--------------------------------------------------------------------------------
--  File Name: stdh16500.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997 Free Model Foundry; http://www.FreeModelFoundry.com
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--  MODIFICATION HISTORY:
--
--  version: |  author:  | mod date: | changes made:
--    V1.0    R. Munden    97 NOV 15  Conformed to style guide
--
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
--
--  Library:    STNDH
--  Technology: 54/74XXXX bus hold
--  Part:       STDH16500
--
--  Desciption: Universal Bus Transceiver with bus hold
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
ENTITY stdh16500 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_B                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEBANeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKBANeg            : VitalDelayType01 := VitalZeroDelay01;
        tipd_LEBA                : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEAB                : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKABNeg            : VitalDelayType01 := VitalZeroDelay01;
        tipd_LEAB                : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_B                  : VitalDelayType01 := UnitDelay01;
        tpd_OEAB_B               : VitalDelayType01Z:= UnitDelay01Z;
        tpd_LEAB_B               : VitalDelayType01 := UnitDelay01;
        tpd_CLKABNeg_B           : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_A_CLKABNeg           : VitalDelayType := UnitDelay;
        tsetup_A_LEAB_CLKABNeg_EQ_0 : VitalDelayType := UnitDelay;
        tsetup_A_LEAB_CLKABNeg_EQ_1 : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_A_CLKABNeg         : VitalDelayType := UnitDelay;
        thold_B_LEAB             : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_LEBA_posedge         : VitalDelayType := UnitDelay;
        tpw_LEAB_posedge         : VitalDelayType := UnitDelay;
        tpw_CLKABNeg_posedge     : VitalDelayType := UnitDelay;
        tpw_CLKABNeg_negedge     : VitalDelayType := UnitDelay;
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
        CLKBANeg         : IN    std_logic := 'U';
        LEBA             : IN    std_logic := 'U';
        OEAB             : IN    std_logic := 'U';
        CLKABNeg         : IN    std_logic := 'U';
        LEAB             : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of stdh16500 : ENTITY IS TRUE;
END stdh16500;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdh16500 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;
 
    SIGNAL A_ipd               : std_ulogic := 'X';
    SIGNAL B_ipd               : std_ulogic := 'X';
    SIGNAL OEBANeg_ipd         : std_ulogic := 'X';
    SIGNAL CLKBANeg_ipd        : std_ulogic := 'X';
    SIGNAL LEBA_ipd            : std_ulogic := 'X';
    SIGNAL OEAB_ipd            : std_ulogic := 'X';
    SIGNAL CLKABNeg_ipd        : std_ulogic := 'X';
    SIGNAL LEAB_ipd            : std_ulogic := 'X';
    SIGNAL Aint                : std_logic  := 'X';
    SIGNAL Bint                : std_logic  := 'X';
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
        w_4 : VitalWireDelay (CLKBANeg_ipd, CLKBANeg, tipd_CLKBANeg);
        w_5 : VitalWireDelay (LEBA_ipd, LEBA, tipd_LEBA);
        w_6 : VitalWireDelay (OEAB_ipd, OEAB, tipd_OEAB);
        w_7 : VitalWireDelay (CLKABNeg_ipd, CLKABNeg, tipd_CLKABNeg);
        w_8 : VitalWireDelay (LEAB_ipd, LEAB, tipd_LEAB);

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

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalOutput1 : PROCESS (Bint, OEAB_ipd)

        -- Functionality Results Variables
        VARIABLE B_zd           : std_ulogic;
 
        -- Output Glitch Detection Variables
        VARIABLE B_GlitchData   : VitalGlitchDataType;
 
    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        B_zd := VitalBUFIF1 (data => Bint, enable => OEAB_ipd);
 
        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
         VitalPathDelay01Z (
            OutSignal       =>  B,
            OutSignalName   =>  "B",
            OutTemp         =>  B_zd,
            GlitchData      => B_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => Bint'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_B),
                      PathCondition     => OEAB_ipd = '1'),
                1 => (InputChangeTime   => OEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEAB_B,
                      PathCondition     => TRUE))
        );

    END PROCESS;

    VitalOutput2 : PROCESS (Aint, OEBANeg_ipd)

        -- Functionality Results Variables
        VARIABLE A_zd           : std_ulogic;
 
        -- Output Glitch Detection Variables
        VARIABLE A_GlitchData   : VitalGlitchDataType;
 
    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        A_zd := VitalBUFIF0 (data => Aint, enable => OEBANeg_ipd);
 
        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
         VitalPathDelay01Z (
            OutSignal       =>  A,
            OutSignalName   =>  "A",
            OutTemp         =>  A_zd,
            GlitchData      => A_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => Aint'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_B),
                      PathCondition     => OEAB_ipd = '0'),
                1 => (InputChangeTime   => OEBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEAB_B,
                      PathCondition     => TRUE))
        );

    END PROCESS;

    VitalBehavior1 : PROCESS (CLKABNeg_ipd, LEAB_ipd, Abh)
 
        -- Timing Check Variables
        VARIABLE Tviol_A_CLKABNeg     : X01 := '0';
        VARIABLE TD_A_CLKABNeg        : VitalTimingDataType;
 
        VARIABLE Tviol_A_LEAB         : X01 := '0';
        VARIABLE TD_A_LEAB            : VitalTimingDataType;
 
        VARIABLE Pviol_CLKABNeg       : X01 := '0';
        VARIABLE PD_CLKABNeg          : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_LEAB        : X01 := '0';
        VARIABLE PD_LEAB           : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation         : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd              : std_ulogic;
        VARIABLE PrevData          : std_logic_vector(0 to 3);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData      : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => Abh,
                TestSignalName  => "Abh",
                RefSignal       => CLKABNeg_ipd,
                RefSignalName   => "CLKABNeg_ipd",
                SetupHigh       => tsetup_A_CLKABNeg,
                SetupLow        => tsetup_A_CLKABNeg,
                HoldHigh        => thold_A_CLKABNeg,
                HoldLow         => thold_A_CLKABNeg,
                CheckEnabled    => LEAB = '0',
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/stdh16500",
                TimingData      => TD_A_CLKABNeg,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_CLKABNeg
            );

            VitalSetupHoldCheck (
                TestSignal      => Abh,
                TestSignalName  => "Abh",
                RefSignal       => LEAB_ipd,
                RefSignalName   => "LEAB_ipd",
                SetupHigh       => tsetup_A_LEAB_CLKABNeg_EQ_1,
                SetupLow        => tsetup_A_LEAB_CLKABNeg_EQ_0,
                HoldHigh        => thold_B_LEAB,
                HoldLow         => thold_B_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/stdh16500",
                TimingData      => TD_A_LEAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_LEAB
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKABNeg_ipd,
                TestSignalName  => "CLKABNeg_ipd",
                PulseWidthHigh  => tpw_CLKABNeg_posedge,
                PulseWidthLow   => tpw_CLKABNeg_negedge,
                CheckEnabled    => LEAB = '0',
                HeaderMsg       => InstancePath & "/stdh16500",
                PeriodData      => PD_CLKABNeg,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKABNeg
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => LEAB_ipd,
                TestSignalName  => "LEAB_ipd",
                PulseWidthHigh  => tpw_LEAB_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/stdh16500",
                PeriodData      => PD_LEAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LEAB
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_A_LEAB OR Pviol_LEAB OR Tviol_A_CLKABNeg OR
                     Pviol_CLKABNeg;
 
        VitalStateTable (
            StateTable      => LATNDFFN_tab,
            DataIn          => (Violation, LEAB_ipd, CLKABNeg_ipd, Abh),
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
                      PathCondition     => LEAB_ipd = '1'),
                1 => (InputChangeTime   => Abh'LAST_EVENT,
                      PathDelay         => tpd_A_B,
                      PathCondition     => LEAB_ipd = '1'),
                2 => (InputChangeTime   => CLKABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLKABNeg_B,
                      PathCondition     => LEAB_ipd = '0')
            )
        );
 
    END PROCESS; 

    VitalBehavior2 : PROCESS (CLKBANeg_ipd, LEBA_ipd, Bbh)
 
        -- Timing Check Variables
        VARIABLE Tviol_B_CLKBANeg     : X01 := '0';
        VARIABLE TD_B_CLKBANeg        : VitalTimingDataType;
 
        VARIABLE Tviol_B_LEBA         : X01 := '0';
        VARIABLE TD_B_LEBA            : VitalTimingDataType;
 
        VARIABLE Pviol_CLKBANeg       : X01 := '0';
        VARIABLE PD_CLKBANeg          : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_LEBA        : X01 := '0';
        VARIABLE PD_LEBA           : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation         : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd              : std_ulogic;
        VARIABLE PrevData          : std_logic_vector(0 to 3);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData      : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => Bbh,
                TestSignalName  => "Bbh",
                RefSignal       => CLKBANeg_ipd,
                RefSignalName   => "CLKBANeg_ipd",
                SetupHigh       => tsetup_A_CLKABNeg,
                SetupLow        => tsetup_A_CLKABNeg,
                HoldHigh        => thold_A_CLKABNeg,
                HoldLow         => thold_A_CLKABNeg,
                CheckEnabled    => LEBA = '0',
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/stdh16500",
                TimingData      => TD_B_CLKBANeg,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_CLKBANeg
            );

            VitalSetupHoldCheck (
                TestSignal      => Bbh,
                TestSignalName  => "Bbh",
                RefSignal       => LEBA_ipd,
                RefSignalName   => "LEBA_ipd",
                SetupHigh       => tsetup_A_LEAB_CLKABNeg_EQ_1,
                SetupLow        => tsetup_A_LEAB_CLKABNeg_EQ_0,
                HoldHigh        => thold_B_LEAB,
                HoldLow         => thold_B_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/stdh16500",
                TimingData      => TD_B_LEBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_LEBA
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKBANeg_ipd,
                TestSignalName  => "CLKBANeg_ipd",
                PulseWidthHigh  => tpw_CLKABNeg_posedge,
                PulseWidthLow   => tpw_CLKABNeg_negedge,
                CheckEnabled    => LEBA = '0',
                HeaderMsg       => InstancePath & "/stdh16500",
                PeriodData      => PD_CLKBANeg,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKBANeg
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => LEBA_ipd,
                TestSignalName  => "LEBA_ipd",
                PulseWidthHigh  => tpw_LEAB_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/stdh16500",
                PeriodData      => PD_LEBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LEBA
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_B_LEBA OR Pviol_LEBA OR Tviol_B_CLKBANeg OR
                     Pviol_CLKBANeg;
 
        VitalStateTable (
            StateTable      => LATNDFFN_tab,
            DataIn          => (Violation, LEBA_ipd, CLKBANeg_ipd, Bbh),
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
                      PathDelay         => tpd_LEAB_B,
                      PathCondition     => LEBA_ipd = '1'),
                1 => (InputChangeTime   => Bbh'LAST_EVENT,
                      PathDelay         => tpd_A_B,
                      PathCondition     => LEBA_ipd = '1'),
                2 => (InputChangeTime   => CLKBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLKABNeg_B,
                      PathCondition     => LEBA_ipd = '0')
            )
        );
 
    END PROCESS; 

END vhdl_behavioral;
