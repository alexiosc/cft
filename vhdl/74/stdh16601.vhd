--------------------------------------------------------------------------------
--  File Name: stdh16601.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1999 Free Model Foundry; http://www.FreeModelFoundry.com
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--  MODIFICATION HISTORY:
--
--  version: |  author:  | mod date: | changes made:
--    V1.0    R. Munden    99 FEB 05  Initial release
--
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
--
--  Library:    STNDH
--  Technology: 54/74XXXX
--  Part:       STDH16601
--
--  Desciption: Universal Bus Transceiver with Bus Hold
--------------------------------------------------------------------------------
--

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;
--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stdh16601 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_B                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEBANeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKBA               : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKENBANeg          : VitalDelayType01 := VitalZeroDelay01;
        tipd_LEBA                : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEABNeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKAB               : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKENABNeg          : VitalDelayType01 := VitalZeroDelay01;
        tipd_LEAB                : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_B                  : VitalDelayType01 := UnitDelay01;
        tpd_B_A                  : VitalDelayType01 := UnitDelay01;
        tpd_OEBANeg_A            : VitalDelayType01Z:= UnitDelay01Z;
        tpd_OEABNeg_B            : VitalDelayType01Z:= UnitDelay01Z;
        tpd_LEBA_A               : VitalDelayType01 := UnitDelay01;
        tpd_LEAB_B               : VitalDelayType01 := UnitDelay01;
        tpd_CLKBA_A              : VitalDelayType01 := UnitDelay01;
        tpd_CLKAB_B              : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_A_CLKAB           : VitalDelayType := UnitDelay;
        tsetup_CLKENABNeg_CLKAB  : VitalDelayType := UnitDelay;
        tsetup_A_LEAB_CLKAB_EQ_0 : VitalDelayType := UnitDelay;
        tsetup_A_LEAB_CLKAB_EQ_1 : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_A_CLKAB            : VitalDelayType := UnitDelay;
        thold_CLKENABNeg_CLKAB   : VitalDelayType := UnitDelay;
        thold_A_LEAB_CLKAB_EQ_0  : VitalDelayType := UnitDelay;
        thold_A_LEAB_CLKAB_EQ_1  : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_LEBA_posedge         : VitalDelayType := UnitDelay;
        tpw_LEAB_posedge         : VitalDelayType := UnitDelay;
        tpw_CLKAB_posedge        : VitalDelayType := UnitDelay;
        tpw_CLKAB_negedge        : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLKAB_posedge : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        A                : INOUT std_logic := 'U';
        B                : INOUT std_logic := 'U';
        OEBANeg          : IN    std_logic := 'U';
        CLKBA            : IN    std_logic := 'U';
        CLKENBANeg       : IN    std_logic := 'U';
        LEBA             : IN    std_logic := 'U';
        OEABNeg          : IN    std_logic := 'U';
        CLKAB            : IN    std_logic := 'U';
        CLKENABNeg       : IN    std_logic := 'U';
        LEAB             : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of stdh16601 : ENTITY IS TRUE;
END stdh16601;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdh16601 IS
    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;
 
    SIGNAL A_ipd               : std_ulogic := 'X';
    SIGNAL B_ipd               : std_ulogic := 'X';
    SIGNAL OEBANeg_ipd         : std_ulogic := 'X';
    SIGNAL CLKBA_ipd           : std_ulogic := 'X';
    SIGNAL CLKENBANeg_ipd      : std_ulogic := 'X';
    SIGNAL LEBA_ipd            : std_ulogic := 'X';
    SIGNAL OEABNeg_ipd         : std_ulogic := 'X';
    SIGNAL CLKAB_ipd           : std_ulogic := 'X';
    SIGNAL CLKENABNeg_ipd      : std_ulogic := 'X';
    SIGNAL LEAB_ipd            : std_ulogic := 'X';
    SIGNAL Aint                : std_ulogic := 'X';
    SIGNAL Bint                : std_ulogic := 'X';
    SIGNAL LEAint              : std_ulogic := 'X';
    SIGNAL LEBint              : std_ulogic := 'X';
    SIGNAL Abh                 : std_logic  := 'X';
    SIGNAL Bbh                 : std_logic  := 'X';
    SIGNAL AbhNeg              : std_ulogic := 'X';
    SIGNAL BbhNeg              : std_ulogic := 'X';

BEGIN
 
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN
 
        w_1 : VitalWireDelay (A_ipd, A, tipd_A);
        w_2 : VitalWireDelay (B_ipd, B, tipd_B);
        w_3 : VitalWireDelay (OEBANeg_ipd, OEBANeg, tipd_OEBANeg);
        w_4 : VitalWireDelay (CLKBA_ipd, CLKBA, tipd_CLKBA);
        w_5 : VitalWireDelay (CLKENBANeg_ipd, CLKENBANeg, tipd_CLKENBANeg);
        w_6 : VitalWireDelay (LEBA_ipd, LEBA, tipd_LEBA);
        w_7 : VitalWireDelay (OEABNeg_ipd, OEABNeg, tipd_OEABNeg);
        w_8 : VitalWireDelay (CLKAB_ipd, CLKAB, tipd_CLKAB);
        w_9 : VitalWireDelay (CLKENABNeg_ipd, CLKENABNeg, tipd_CLKENABNeg);
        w_10 : VitalWireDelay (LEAB_ipd, LEAB, tipd_LEAB);

    END BLOCK;
 
    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalBUF (q => Abh, a => A_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_2: VitalINV (q => AbhNeg, a => Abh);
    a_3: VitalINV (q => Abh, a => AbhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_4: VitalBUF (q => Bbh, a => B_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_5: VitalINV (q => BbhNeg, a => Bbh);
    a_6: VitalINV (q => Bbh, a => BbhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_7: VitalBUFIF0 (
            q            => A,
            data         => Aint,
            Enable       => OEBANeg_ipd,
            tpd_enable_q => tpd_OEABNeg_B);

    a_8: VitalBUFIF0 (
            q            => B,
            data         => Bint,
            Enable       => OEABNeg_ipd,
            tpd_enable_q => tpd_OEABNeg_B);

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior1 : PROCESS (CLKAB_ipd, LEAB_ipd, Abh, CLKENABNeg_ipd)
 
        -- Timing Check Variables
        VARIABLE Tviol_A_CLKAB     : X01 := '0';
        VARIABLE TD_A_CLKAB        : VitalTimingDataType;
 
        VARIABLE Tviol_A_LEAB0     : X01 := '0';
        VARIABLE TD_A_LEAB0        : VitalTimingDataType;
 
        VARIABLE Tviol_A_LEAB1     : X01 := '0';
        VARIABLE TD_A_LEAB1        : VitalTimingDataType;
 
        VARIABLE Tviol_CLKENABNeg_CLKAB     : X01 := '0';
        VARIABLE TD_CLKENABNeg_CLKAB        : VitalTimingDataType;
 
        VARIABLE Pviol_LEAB        : X01 := '0';
        VARIABLE PD_LEAB           : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_CLKAB       : X01 := '0';
        VARIABLE PD_CLKAB          : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation         : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd              : std_ulogic;
        VARIABLE PrevData          : std_logic_vector(0 to 4);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData      : VitalGlitchDataType;

        -- No Weak Values Variables
        VARIABLE LEAB_nwv     : UX01 := 'X';
        VARIABLE CLKAB_nwv    : UX01 := 'X';
        VARIABLE CLKENAB_nwv  : UX01 := 'X';

    BEGIN

        LEAB_nwv     := To_UX01 (s => LEAB_ipd);
        CLKAB_nwv    := To_UX01 (s => CLKAB_ipd);
        CLKENAB_nwv  := To_UX01 (s => CLKENABNeg_ipd);

        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => Abh,
                TestSignalName  => "A",
                RefSignal       => CLKAB_ipd,
                RefSignalName   => "CLKAB_ipd",
                SetupHigh       => tsetup_A_CLKAB,
                SetupLow        => tsetup_A_CLKAB,
                HoldHigh        => thold_A_CLKAB,
                HoldLow         => thold_A_CLKAB,
                CheckEnabled    => CLKENAB_nwv = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16601",
                TimingData      => TD_A_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_CLKAB
            );

            VitalSetupHoldCheck (
                TestSignal      => Abh,
                TestSignalName  => "A",
                RefSignal       => LEAB_ipd,
                RefSignalName   => "LEAB_ipd",
                SetupHigh       => tsetup_A_LEAB_CLKAB_EQ_1,
                SetupLow        => tsetup_A_LEAB_CLKAB_EQ_1,
                HoldHigh        => thold_A_LEAB_CLKAB_EQ_1,
                HoldLow         => thold_A_LEAB_CLKAB_EQ_1,
                CheckEnabled    => (CLKAB_nwv = '1'),
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16601",
                TimingData      => TD_A_LEAB1,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_LEAB1
            );

            VitalSetupHoldCheck (
                TestSignal      => Abh,
                TestSignalName  => "A",
                RefSignal       => LEAB_ipd,
                RefSignalName   => "LEAB_ipd",
                SetupHigh       => tsetup_A_LEAB_CLKAB_EQ_0,
                SetupLow        => tsetup_A_LEAB_CLKAB_EQ_0,
                HoldHigh        => thold_A_LEAB_CLKAB_EQ_0,
                HoldLow         => thold_A_LEAB_CLKAB_EQ_0,
                CheckEnabled    => (CLKAB_nwv = '0'),
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16601",
                TimingData      => TD_A_LEAB0,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_LEAB0
            );

            VitalSetupHoldCheck (
                TestSignal      => CLKENABNeg_ipd,
                TestSignalName  => "CLKENABNeg_ipd",
                RefSignal       => CLKAB_ipd,
                RefSignalName   => "CLKAB_ipd",
                SetupHigh       => tsetup_CLKENABNeg_CLKAB,
                SetupLow        => tsetup_CLKENABNeg_CLKAB,
                HoldHigh        => thold_CLKENABNeg_CLKAB,
                HoldLow         => thold_CLKENABNeg_CLKAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16601",
                TimingData      => TD_CLKENABNeg_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLKENABNeg_CLKAB
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKAB_ipd,
                TestSignalName  => "CLKAB_ipd",
                Period          => tperiod_CLKAB_posedge,
                PulseWidthHigh  => tpw_CLKAB_posedge,
                PulseWidthLow   => tpw_CLKAB_negedge,
                CheckEnabled    => LEAB_nwv = '0',
                HeaderMsg       => InstancePath & "/stdh16601",
                PeriodData      => PD_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKAB
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => LEAB_ipd,
                TestSignalName  => "LEAB_ipd",
                PulseWidthHigh  => tpw_LEAB_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/stdh16601",
                PeriodData      => PD_LEAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LEAB
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_A_LEAB0 OR Pviol_LEAB OR Tviol_A_LEAB1 OR 
                     Tviol_A_CLKAB OR Pviol_CLKAB OR Tviol_CLKENABNeg_CLKAB;
 
        VitalStateTable (
            StateTable      => LATNDFFCEN_tab,
            DataIn          => (Violation, CLKENABNeg_ipd, LEAB_ipd, 
                                CLKAB_ipd, Abh),
            Result          => Q_zd,
            PreviousDataIn  => PrevData
        );
 
        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => Bint,
            OutSignalName   => "Bint",
            OutTemp         => Q_zd,
            GlitchData      => Q_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B,
                      PathCondition     => LEAB_nwv = '1'),
                1 => (InputChangeTime   => Abh'LAST_EVENT,
                      PathDelay         => tpd_A_B,
                      PathCondition     => LEAB_nwv = '1'),
                2 => (InputChangeTime   => CLKAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLKAB_B,
                      PathCondition     => LEAB_nwv = '0')
            )
        );
 
    END PROCESS; 

    VitalBehavior2 : PROCESS (CLKBA_ipd, CLKENBANeg_ipd, LEBA_ipd, Bbh)
 
        -- Timing Check Variables
        VARIABLE Tviol_B_CLKBA     : X01 := '0';
        VARIABLE TD_B_CLKBA        : VitalTimingDataType;
 
        VARIABLE Tviol_B_LEBA0     : X01 := '0';
        VARIABLE TD_B_LEBA0        : VitalTimingDataType;
 
        VARIABLE Tviol_B_LEBA1     : X01 := '0';
        VARIABLE TD_B_LEBA1        : VitalTimingDataType;
 
        VARIABLE Tviol_CLKENBANeg_CLKBA     : X01 := '0';
        VARIABLE TD_CLKENBANeg_CLKBA        : VitalTimingDataType;
 
        VARIABLE Pviol_CLKBA       : X01 := '0';
        VARIABLE PD_CLKBA          : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_LEBA        : X01 := '0';
        VARIABLE PD_LEBA           : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation         : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd              : std_ulogic;
        VARIABLE PrevData          : std_logic_vector(0 to 4);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData      : VitalGlitchDataType;

        -- No Weak Values Variables
        VARIABLE LEBA_nwv     : UX01 := 'X';
        VARIABLE CLKBA_nwv    : UX01 := 'X';
        VARIABLE CLKENBA_nwv  : UX01 := 'X';

    BEGIN

        LEBA_nwv     := To_UX01 (s => LEBA_ipd);
        CLKBA_nwv    := To_UX01 (s => CLKBA_ipd);
        CLKENBA_nwv  := To_UX01 (s => CLKENBANeg_ipd);

        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => Bbh,
                TestSignalName  => "B",
                RefSignal       => CLKBA_ipd,
                RefSignalName   => "CLKBA_ipd",
                SetupHigh       => tsetup_A_CLKAB,
                SetupLow        => tsetup_A_CLKAB,
                HoldHigh        => thold_A_CLKAB,
                HoldLow         => thold_A_CLKAB,
                CheckEnabled    => CLKENBA_nwv = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16601",
                TimingData      => TD_B_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_CLKBA
            );

            VitalSetupHoldCheck (
                TestSignal      => Bbh,
                TestSignalName  => "B",
                RefSignal       => LEBA_ipd,
                RefSignalName   => "LEBA_ipd",
                SetupHigh       => tsetup_A_LEAB_CLKAB_EQ_1,
                SetupLow        => tsetup_A_LEAB_CLKAB_EQ_1,
                HoldHigh        => thold_A_LEAB_CLKAB_EQ_1,
                HoldLow         => thold_A_LEAB_CLKAB_EQ_1,
                CheckEnabled    => (CLKBA_nwv = '1'),
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16601",
                TimingData      => TD_B_LEBA1,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_LEBA1
            );

            VitalSetupHoldCheck (
                TestSignal      => Bbh,
                TestSignalName  => "B",
                RefSignal       => LEBA_ipd,
                RefSignalName   => "LEBA_ipd",
                SetupHigh       => tsetup_A_LEAB_CLKAB_EQ_0,
                SetupLow        => tsetup_A_LEAB_CLKAB_EQ_0,
                HoldHigh        => thold_A_LEAB_CLKAB_EQ_0,
                HoldLow         => thold_A_LEAB_CLKAB_EQ_0,
                CheckEnabled    => (CLKBA_nwv = '0'),
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16601",
                TimingData      => TD_B_LEBA0,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_LEBA0
            );

            VitalSetupHoldCheck (
                TestSignal      => CLKENBANeg_ipd,
                TestSignalName  => "CLKENBANeg_ipd",
                RefSignal       => CLKBA_ipd,
                RefSignalName   => "CLKBA_ipd",
                SetupHigh       => tsetup_CLKENABNeg_CLKAB,
                SetupLow        => tsetup_CLKENABNeg_CLKAB,
                HoldHigh        => thold_CLKENABNeg_CLKAB,
                HoldLow         => thold_CLKENABNeg_CLKAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16601",
                TimingData      => TD_CLKENBANeg_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLKENBANeg_CLKBA
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKBA_ipd,
                TestSignalName  => "CLKBA_ipd",
                PulseWidthHigh  => tpw_CLKAB_posedge,
                PulseWidthLow   => tpw_CLKAB_negedge,
                CheckEnabled    => LEBA_nwv = '0',
                HeaderMsg       => InstancePath & "/stdh16601",
                PeriodData      => PD_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKBA
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => LEBA_ipd,
                TestSignalName  => "LEBA_ipd",
                PulseWidthHigh  => tpw_LEAB_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/stdh16601",
                PeriodData      => PD_LEBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LEBA
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_B_LEBA0 OR Pviol_LEBA OR Tviol_B_CLKBA OR
                     Pviol_CLKBA OR Tviol_B_LEBA1 OR Tviol_CLKENBANeg_CLKBA;
 
        VitalStateTable (
            StateTable      => LATNDFFCEN_tab,
            DataIn          => (Violation, CLKENBANeg_ipd, LEBA_ipd, 
                                CLKBA_ipd, Bbh),
            Result          => Q_zd,
            PreviousDataIn  => PrevData
        );
 
        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => Aint,
            OutSignalName   => "Aint",
            OutTemp         => Q_zd,
            GlitchData      => Q_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEBA_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEBA_A,
                      PathCondition     => LEBA_nwv = '1'),
                1 => (InputChangeTime   => Bbh'LAST_EVENT,
                      PathDelay         => tpd_B_A,
                      PathCondition     => LEBA_nwv = '1'),
                2 => (InputChangeTime   => CLKBA_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLKBA_A,
                      PathCondition     => LEBA_nwv = '0')
            )
        );
 
    END PROCESS; 

END vhdl_behavioral;
