--------------------------------------------------------------------------------
--  File Name: stdh952.vhd
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
--    V1.0     R. Munden   97 DEC 19   Conformed to style guide
--    V1.1     R. Munden   97 DEC 30   Added pulse width check for CLKEN
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STNDH
--  Technology: 54/74XXXX
--  Part:       STDH952
-- 
--  Description: Registered Transceiver with 3-State Output and bus hold
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stdh952 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_CLKENABNeg          : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKAB               : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEABNeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKENBANeg          : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKBA               : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEBANeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_B                   : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLKAB_B              : VitalDelayType01 := UnitDelay01;
        tpd_OEBANeg_A            : VitalDelayType01Z := UnitDelay01Z;
        -- tsetup values: setup times
        tsetup_A_CLKAB           : VitalDelayType := UnitDelay;
        tsetup_B_CLKBA           : VitalDelayType := UnitDelay;
        tsetup_CLKENABNeg_CLKAB  : VitalDelayType := UnitDelay;
        tsetup_CLKENBANeg_CLKBA  : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_A_CLKAB            : VitalDelayType := UnitDelay;
        thold_B_CLKBA            : VitalDelayType := UnitDelay;
        thold_CLKENABNeg_CLKAB   : VitalDelayType := UnitDelay;
        thold_CLKENBANeg_CLKBA   : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLKAB_posedge        : VitalDelayType := UnitDelay;
        tpw_CLKBA_posedge        : VitalDelayType := UnitDelay;
        tpw_CLKAB_negedge        : VitalDelayType := UnitDelay;
        tpw_CLKBA_negedge        : VitalDelayType := UnitDelay;
        tpw_CLKENABNeg_posedge   : VitalDelayType := UnitDelay;
        tpw_CLKENBANeg_posedge   : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        CLKENABNeg      : IN    std_logic := 'U';
        CLKAB           : IN    std_logic := 'U';
        OEABNeg         : IN    std_logic := 'U';
        A               : INOUT std_logic := 'U';
        CLKENBANeg      : IN    std_logic := 'U';
        CLKBA           : IN    std_logic := 'U';
        OEBANeg         : IN    std_logic := 'U';
        B               : INOUT std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of stdh952 : ENTITY IS TRUE;
END stdh952;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdh952 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL CLKENABNeg_ipd      : std_ulogic := 'X';
    SIGNAL CLKAB_ipd           : std_ulogic := 'X';
    SIGNAL OEABNeg_ipd         : std_ulogic := 'X';
    SIGNAL CLKENBANeg_ipd      : std_ulogic := 'X';
    SIGNAL CLKBA_ipd           : std_ulogic := 'X';
    SIGNAL OEBANeg_ipd         : std_ulogic := 'X';
    SIGNAL A_ipd               : std_ulogic := 'X';
    SIGNAL B_ipd               : std_ulogic := 'X';
    SIGNAL Aint                : std_ulogic := 'X';
    SIGNAL Bint                : std_ulogic := 'X';
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

        w_1 : VitalWireDelay (CLKENABNeg_ipd, CLKENABNeg, tipd_CLKENABNeg);
        w_2 : VitalWireDelay (CLKAB_ipd, CLKAB, tipd_CLKAB);
        w_3 : VitalWireDelay (OEABNeg_ipd, OEABNeg, tipd_OEABNeg);
        w_4 : VitalWireDelay (B_ipd, B, tipd_B);
        w_5 : VitalWireDelay (CLKENBANeg_ipd, CLKENBANeg, tipd_CLKENBANeg);
        w_6 : VitalWireDelay (CLKBA_ipd, CLKBA, tipd_CLKBA);
        w_7 : VitalWireDelay (OEBANeg_ipd, OEBANeg, tipd_OEBANeg);
        w_8 : VitalWireDelay (A_ipd, A, tipd_A);

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
    VitalOutput1 : PROCESS (Aint, OEBANeg_ipd)

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
            OutSignal       => A,
            OutSignalName   => "A",
            OutTemp         => A_zd,
            GlitchData      => A_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => Aint'LAST_EVENT,
                      PathDelay         => VitalZeroDelay01Z,
                      PathCondition     => OEBANeg_ipd = '0'),
                1 => (InputChangeTime   => OEBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEBANeg_A,
                      PathCondition     => TRUE))
        );

    END PROCESS;

    VitalOutput2 : PROCESS (Bint, OEABNeg_ipd)

        -- Functionality Results Variables
        VARIABLE B_zd           : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE B_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        B_zd := VitalBUFIF0 (data => Bint, enable => OEABNeg_ipd);

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
                      PathDelay         => VitalZeroDelay01Z,
                      PathCondition     => OEABNeg_ipd = '0'),
                1 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEBANeg_A,
                      PathCondition     => TRUE))
        );

    END PROCESS;

    VitalBehavior1 : PROCESS (CLKAB_ipd, CLKENABNeg_ipd, Abh)

        -- Timing Check Variables
        VARIABLE Tviol_A_CLKAB      : X01 := '0';
        VARIABLE TD_A_CLKAB         : VitalTimingDataType;

        VARIABLE Tviol_CLKENABNeg_CLKAB      : X01 := '0';
        VARIABLE TD_CLKENABNeg_CLKAB         : VitalTimingDataType;

        VARIABLE Pviol_CLKAB        : X01 := '0';
        VARIABLE PD_CLKAB           : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_CLKENABNeg   : X01 := '0';
        VARIABLE PD_CLKENABNeg      : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation          : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd               : std_ulogic;
        VARIABLE PrevData           : std_logic_vector(1 to 3);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData       : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

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
                HeaderMsg       => InstancePath & "/stdh952",
                TimingData      => TD_CLKENABNeg_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLKENABNeg_CLKAB
            );

            VitalSetupHoldCheck (
                TestSignal      => Abh,
                TestSignalName  => "Abh",
                RefSignal       => CLKAB_ipd,
                RefSignalName   => "CLKAB_ipd",
                SetupHigh       => tsetup_A_CLKAB,
                SetupLow        => tsetup_A_CLKAB,
                HoldHigh        => thold_A_CLKAB,
                HoldLow         => thold_A_CLKAB,
                CheckEnabled    => CLKENABNeg_ipd = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh952",
                TimingData      => TD_A_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_CLKAB
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKAB_ipd,
                TestSignalName  => "CLKAB_ipd",
                PulseWidthHigh  => tpw_CLKAB_posedge,
                PulseWidthLow   => tpw_CLKAB_negedge,
                CheckEnabled    => CLKENABNeg_ipd = '0',
                HeaderMsg       => InstancePath & "/stdh952",
                PeriodData      => PD_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKAB
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => CLKENABNeg_ipd,
                TestSignalName  => "CLKENABNeg_ipd",
                PulseWidthHigh  => tpw_CLKENABNeg_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/stdh952",
                PeriodData      => PD_CLKENABNeg,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKENABNeg
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_A_CLKAB OR Tviol_CLKENABNeg_CLKAB OR Pviol_CLKAB;
 
        VitalStateTable (
            StateTable      => DFF_tab,
            DataIn          => (Violation, 
                               (CLKAB_ipd AND (NOT CLKENABNeg_ipd)), 
                               Abh),
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
                0 => (InputChangeTime   => CLKAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLKAB_B,
                      PathCondition     => CLKENABNeg_ipd = '0')
            )
        );
 
    END PROCESS;
 
    VitalBehavior2 : PROCESS (CLKBA_ipd, CLKENBANeg_ipd, Bbh)

        -- Timing Check Variables
        VARIABLE Tviol_B_CLKBA      : X01 := '0';
        VARIABLE TD_B_CLKBA         : VitalTimingDataType;

        VARIABLE Tviol_CLKENBANeg_CLKBA      : X01 := '0';
        VARIABLE TD_CLKENBANeg_CLKBA         : VitalTimingDataType;

        VARIABLE Pviol_CLKBA        : X01 := '0';
        VARIABLE PD_CLKBA           : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_CLKENBANeg   : X01 := '0';
        VARIABLE PD_CLKENBANeg      : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation          : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd               : std_ulogic;
        VARIABLE PrevData           : std_logic_vector(1 to 3);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData       : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => CLKENBANeg_ipd,
                TestSignalName  => "CLKENBANeg_ipd",
                RefSignal       => CLKBA_ipd,
                RefSignalName   => "CLKBA_ipd",
                SetupHigh       => tsetup_CLKENBANeg_CLKBA,
                SetupLow        => tsetup_CLKENBANeg_CLKBA,
                HoldHigh        => thold_CLKENBANeg_CLKBA,
                HoldLow         => thold_CLKENBANeg_CLKBA,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh952",
                TimingData      => TD_CLKENBANeg_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLKENBANeg_CLKBA
            );

            VitalSetupHoldCheck (
                TestSignal      => Bbh,
                TestSignalName  => "Bbh",
                RefSignal       => CLKBA_ipd,
                RefSignalName   => "CLKBA_ipd",
                SetupHigh       => tsetup_B_CLKBA,
                SetupLow        => tsetup_B_CLKBA,
                HoldHigh        => thold_B_CLKBA,
                HoldLow         => thold_B_CLKBA,
                CheckEnabled    => CLKENABNeg_ipd = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh952",
                TimingData      => TD_B_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_CLKBA
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKBA_ipd,
                TestSignalName  => "CLKBA_ipd",
                PulseWidthHigh  => tpw_CLKBA_posedge,
                PulseWidthLow   => tpw_CLKBA_negedge,
                CheckEnabled    => CLKENBANeg_ipd = '0',
                HeaderMsg       => InstancePath & "/stdh952",
                PeriodData      => PD_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKBA
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => CLKENBANeg_ipd,
                TestSignalName  => "CLKENBANeg_ipd",
                PulseWidthHigh  => tpw_CLKENBANeg_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/stdh952",
                PeriodData      => PD_CLKENBANeg,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKENBANeg
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_B_CLKBA OR Tviol_CLKENBANeg_CLKBA OR Pviol_CLKBA;
 
        VitalStateTable (
            StateTable      => DFF_tab,
            DataIn          => (Violation, 
                               (CLKBA_ipd AND (NOT CLKENBANeg_ipd)), 
                               Bbh),
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
                0 => (InputChangeTime   => CLKBA_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLKAB_B,
                      PathCondition     => CLKENBANeg_ipd = '0')
            )
        );

    END PROCESS;

END vhdl_behavioral;
