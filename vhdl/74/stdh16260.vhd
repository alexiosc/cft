--------------------------------------------------------------------------------
--  File Name: stdh16260.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1998, 2002 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   98 MAY 20   Initial release
--    V2.0     R. Munden   02 JAN 24   Re-written to current standards
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STNDH
--  Technology: 54/74XXXX
--  Part:       STDH16260
-- 
--  Desciption: Multiplexed D Latch with 3-State Outputs, bus hold
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stdh16260 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_LE1B                : VitalDelayType01 := VitalZeroDelay01;
        tipd_LE2B                : VitalDelayType01 := VitalZeroDelay01;
        tipd_LEA1B               : VitalDelayType01 := VitalZeroDelay01;
        tipd_LEA2B               : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEANeg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_OE1BNeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_OE2BNeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_SEL                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_N1B                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_N2B                 : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_LE1B_A               : VitalDelayType01 := UnitDelay01;
        tpd_OEANeg_A             : VitalDelayType01Z := UnitDelay01Z;
        tpd_SEL_A_SEL_EQ_0       : VitalDelayType01 := UnitDelay01;
        tpd_SEL_A_SEL_EQ_1       : VitalDelayType01 := UnitDelay01;
        tpd_A_N1B                : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_A_LEA1B           : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_A_LEA1B            : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_LE1B_posedge         : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        LE1B            : IN    std_ulogic := 'U';
        LEA2B           : IN    std_ulogic := 'U';
        OEANeg          : IN    std_ulogic := 'U';
        OE2BNeg         : IN    std_ulogic := 'U';
        LE2B            : IN    std_ulogic := 'U';
        LEA1B           : IN    std_ulogic := 'U';
        SEL             : IN    std_ulogic := 'U';
        OE1BNeg         : IN    std_ulogic := 'U';
        N2B             : INOUT std_ulogic := 'Z';
        A               : INOUT std_ulogic := 'Z';
        N1B             : INOUT std_ulogic := 'Z'
    );
    ATTRIBUTE VITAL_LEVEL0 of stdh16260 : ENTITY IS TRUE;
END stdh16260;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdh16260 IS
    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL LE1B_ipd            : std_ulogic := 'U';
    SIGNAL LEA2B_ipd           : std_ulogic := 'U';
    SIGNAL OEANeg_ipd          : std_ulogic := 'U';
    SIGNAL OE2BNeg_ipd         : std_ulogic := 'U';
    SIGNAL LE2B_ipd            : std_ulogic := 'U';
    SIGNAL LEA1B_ipd           : std_ulogic := 'U';
    SIGNAL SEL_ipd             : std_ulogic := 'U';
    SIGNAL OE1BNeg_ipd         : std_ulogic := 'U';
    SIGNAL N2B_ipd             : std_ulogic := 'U';
    SIGNAL A_ipd               : std_ulogic := 'U';
    SIGNAL N1B_ipd             : std_ulogic := 'U';
    SIGNAL Abh                 : std_logic  := 'X';
    SIGNAL N1Bbh               : std_logic  := 'X';
    SIGNAL N2Bbh               : std_logic  := 'X';
    SIGNAL AbhNeg              : std_ulogic := 'X';
    SIGNAL N1BbhNeg            : std_ulogic := 'X';
    SIGNAL N2BbhNeg            : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (LE1B_ipd, LE1B, tipd_LE1B);
        w_2 : VitalWireDelay (LEA2B_ipd, LEA2B, tipd_LEA2B);
        w_3 : VitalWireDelay (OEANeg_ipd, OEANeg, tipd_OEANeg);
        w_4 : VitalWireDelay (OE2BNeg_ipd, OE2BNeg, tipd_OE2BNeg);
        w_5 : VitalWireDelay (LE2B_ipd, LE2B, tipd_LE2B);
        w_6 : VitalWireDelay (LEA1B_ipd, LEA1B, tipd_LEA1B);
        w_7 : VitalWireDelay (SEL_ipd, SEL, tipd_SEL);
        w_8 : VitalWireDelay (OE1BNeg_ipd, OE1BNeg, tipd_OE1BNeg);
        w_9 : VitalWireDelay (N2B_ipd, N2B, tipd_N2B);
        w_10 : VitalWireDelay (A_ipd, A, tipd_A);
        w_11 : VitalWireDelay (N1B_ipd, N1B, tipd_N1B);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    bh_1: VitalBUF (q => Abh, a => A_ipd, ResultMap => ('U', 'Z', '0', '1'));
    bh_2: VitalINV (q => AbhNeg, a => Abh);
    bh_3: VitalINV (q => Abh, a => AbhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    bh_4: VitalBUF (q => N1Bbh, a => N1B_ipd, ResultMap => ('U', 'Z', '0', '1'));
    bh_5: VitalINV (q => N1BbhNeg, a => N1Bbh);
    bh_6: VitalINV (q => N1Bbh, a => N1BbhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    bh_7: VitalBUF (q => N2Bbh, a => N2B_ipd, ResultMap => ('U', 'Z', '0', '1'));
    bh_8: VitalINV (q => N2BbhNeg, a => N2Bbh);
    bh_9: VitalINV (q => N2Bbh, a => N2BbhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior1 : PROCESS (LE1B_ipd, LE2B_ipd, N1Bbh, N2Bbh, OEANeg_ipd,
                              SEL_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_N1B_LE1B     : X01 := '0';
        VARIABLE TD_N1B_LE1B        : VitalTimingDataType;

        VARIABLE Pviol_LE1B         : X01 := '0';
        VARIABLE PD_LE1B            : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Tviol_N2B_LE2B     : X01 := '0';
        VARIABLE TD_N2B_LE2B        : VitalTimingDataType;

        VARIABLE Pviol_LE2B         : X01 := '0';
        VARIABLE PD_LE2B            : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation          : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd               : std_ulogic;
        VARIABLE Aint               : std_ulogic;
        VARIABLE As0                : std_ulogic;
        VARIABLE As1                : std_ulogic;
        VARIABLE PrevData0          : std_logic_vector(0 to 2);
        VARIABLE PrevData1          : std_logic_vector(0 to 2);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData       : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => N1Bbh,
                TestSignalName  => "N1Bbh",
                RefSignal       => LE1B_ipd,
                RefSignalName   => "LE1B_ipd",
                SetupHigh       => tsetup_A_LEA1B,
                SetupLow        => tsetup_A_LEA1B,
                HoldHigh        => thold_A_LEA1B,
                HoldLow         => thold_A_LEA1B,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16260",
                TimingData      => TD_N1B_LE1B,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_N1B_LE1B
            );

            VitalSetupHoldCheck (
                TestSignal      => N2Bbh,
                TestSignalName  => "N2Bbh",
                RefSignal       => LE2B_ipd,
                RefSignalName   => "LE2B_ipd",
                SetupHigh       => tsetup_A_LEA1B,
                SetupLow        => tsetup_A_LEA1B,
                HoldHigh        => thold_A_LEA1B,
                HoldLow         => thold_A_LEA1B,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16260",
                TimingData      => TD_N2B_LE2B,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_N2B_LE2B
            );

            VitalPeriodPulseCheck (
                TestSignal      => LE2B_ipd,
                TestSignalName  => "LE2B_ipd",
                PulseWidthHigh  => tpw_LE1B_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/stdh16260",
                PeriodData      => PD_LE2B,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LE2B
            );

            VitalPeriodPulseCheck (
                TestSignal      => LE1B_ipd,
                TestSignalName  => "LE1B_ipd",
                PulseWidthHigh  => tpw_LE1B_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/stdh16260",
                PeriodData      => PD_LE1B,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LE1B
            );

            Violation := Tviol_N2B_LE2B OR Pviol_LE2B OR Tviol_N1B_LE1B OR
                         Pviol_LE1B;
        END IF;
 
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------

        VitalStateTable (                    
            StateTable      => LATN_tab,
            DataIn          => (Violation, LE2B_ipd, N2Bbh),
            Result          => As0,
            PreviousDataIn  => PrevData0
        );

        VitalStateTable (                    
            StateTable      => LATN_tab,
            DataIn          => (Violation, LE1B_ipd, N1Bbh),
            Result          => As1,
            PreviousDataIn  => PrevData1
        );

        Aint := VitalMUX2 (Data1   => As1,
                           Data0   => As0,
                           dSelect => SEL_ipd);

        Q_zd := VitalBUFIF0 (Data   => Aint,
                             Enable => OEANeg_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       => A,
            OutSignalName   => "A",
            OutTemp         => Q_zd,
            GlitchData      => Q_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LE1B_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_LE1B_A),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => N1Bbh'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_N1B),
                      PathCondition     => to_X01(LE1B_ipd) = '1'),
                2 => (InputChangeTime   => N2Bbh'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_N1B),
                      PathCondition     => to_X01(LE2B_ipd) = '1'),
                3 => (InputChangeTime   => SEL_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay
                                           (tpd_SEL_A_SEL_EQ_0),
                      PathCondition     => to_X01(SEL_ipd) = '0'),
                4 => (InputChangeTime   => SEL_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay
                                           (tpd_SEL_A_SEL_EQ_1),
                      PathCondition     => to_X01(SEL_ipd) = '1'),
                5 => (InputChangeTime   => OEANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEANeg_A,
                      PathCondition     => TRUE)
            )
        );

    END PROCESS;

    VitalBehavior2 : PROCESS (LEA2B_ipd, Abh, OE2BNeg_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_A_LEA2B      : X01 := '0';
        VARIABLE TD_A_LEA2B         : VitalTimingDataType;

        VARIABLE Pviol_LEA2B        : X01 := '0';
        VARIABLE PD_LEA2B           : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation          : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd               : std_ulogic;
        VARIABLE B2int              : std_ulogic;
        VARIABLE PrevData           : std_logic_vector(0 to 2);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData       : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => Abh,
                TestSignalName  => "Abh",
                RefSignal       => LEA2B_ipd,
                RefSignalName   => "LEA2B_ipd",
                SetupHigh       => tsetup_A_LEA1B,
                SetupLow        => tsetup_A_LEA1B,
                HoldHigh        => thold_A_LEA1B,
                HoldLow         => thold_A_LEA1B,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16260",
                TimingData      => TD_A_LEA2B,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_LEA2B
            );

            VitalPeriodPulseCheck (
                TestSignal      => LEA2B_ipd,
                TestSignalName  => "LEA2B_ipd",
                PulseWidthHigh  => tpw_LE1B_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/stdh16260",
                PeriodData      => PD_LEA2B,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LEA2B
            );

        END IF;
 
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_A_LEA2B OR Pviol_LEA2B;

        VitalStateTable (                    
            StateTable      => LATN_tab,
            DataIn          => (Violation, LEA2B_ipd, Abh),
            Result          => B2int,
            PreviousDataIn  => PrevData
        );

        Q_zd := VitalBUFIF0 (Data   => B2int,
                             Enable => OE2BNeg_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       => N2B,
            OutSignalName   => "N2B",
            OutTemp         => Q_zd,
            GlitchData      => Q_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEA2B_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_LE1B_A),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => OE2BNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEANeg_A,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => Abh'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_N1B),
                      PathCondition     => to_X01(LEA2B_ipd) = '1')
            )
        );

    END PROCESS;

    VitalBehavior3 : PROCESS (LEA1B_ipd, Abh, OE1BNeg_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_A_LEA1B      : X01 := '0';
        VARIABLE TD_A_LEA1B         : VitalTimingDataType;

        VARIABLE Pviol_LEA1B        : X01 := '0';
        VARIABLE PD_LEA1B           : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation          : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd               : std_ulogic;
        VARIABLE B1int              : std_ulogic;
        VARIABLE PrevData           : std_logic_vector(0 to 2);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData       : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => Abh,
                TestSignalName  => "Abh",
                RefSignal       => LEA1B_ipd,
                RefSignalName   => "LEA1B_ipd",
                SetupHigh       => tsetup_A_LEA1B,
                SetupLow        => tsetup_A_LEA1B,
                HoldHigh        => thold_A_LEA1B,
                HoldLow         => thold_A_LEA1B,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16260",
                TimingData      => TD_A_LEA1B,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_LEA1B
            );

            VitalPeriodPulseCheck (
                TestSignal      => LEA1B_ipd,
                TestSignalName  => "LEA1B_ipd",
                PulseWidthHigh  => tpw_LE1B_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/stdh16260",
                PeriodData      => PD_LEA1B,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LEA1B
            );

        END IF;
 
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_A_LEA1B OR Pviol_LEA1B;

        VitalStateTable (                    
            StateTable      => LATN_tab,
            DataIn          => (Violation, LEA1B_ipd, Abh),
            Result          => B1int,
            PreviousDataIn  => PrevData
        );

        Q_zd := VitalBUFIF0 (Data   => B1int,
                             Enable => OE1BNeg_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       => N1B,
            OutSignalName   => "N1B",
            OutTemp         => Q_zd,
            GlitchData      => Q_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEA1B_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_LE1B_A),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => OE1BNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEAneg_A,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => Abh'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_N1B),
                      PathCondition     => to_X01(LEA1B_ipd) = '1')
            )
        );

    END PROCESS;

END vhdl_behavioral;
