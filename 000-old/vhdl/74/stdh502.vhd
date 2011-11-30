--------------------------------------------------------------------------------
--  File Name: stdh502.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2007 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:      | mod date: | changes made:
--    V1.0     D. Stanojkovic  07 Jun 14   Initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STNDH
--  Technology: 54/74XXXX
--  Part:       STDH502
-- 
--  Desciption: Universal Bus Transceiver with 3-state output with bus hold
--------------------------------------------------------------------------------

LIBRARY IEEE;
                USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;
                USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;
--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stdh502 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_CLKAB          : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEABNeg        : VitalDelayType01 := VitalZeroDelay01;
        tipd_LEAB           : VitalDelayType01 := VitalZeroDelay01;
        tipd_A              : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKBA          : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEBANeg        : VitalDelayType01 := VitalZeroDelay01;
        tipd_LEBA           : VitalDelayType01 := VitalZeroDelay01;
        tipd_B              : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_B             : VitalDelayType01 := UnitDelay01;
        tpd_CLKAB_B         : VitalDelayType01 := UnitDelay01;
        tpd_LEAB_B          : VitalDelayType01 := UnitDelay01;
        tpd_B_A             : VitalDelayType01 := UnitDelay01;
        tpd_CLKBA_A         : VitalDelayType01 := UnitDelay01;
        tpd_LEBA_A          : VitalDelayType01 := UnitDelay01;
        tpd_OEABNeg_B       : VitalDelayType01Z := UnitDelay01Z;
        -- tsetup values: setup times
        tsetup_A_CLKAB                          : VitalDelayType := UnitDelay;
        tsetup_A_LEAB_CLK_EQ_1_noedge_negedge   : VitalDelayType := UnitDelay;
        tsetup_A_LEAB_CLK_EQ_0_noedge_negedge   : VitalDelayType := UnitDelay;
        tsetup_B_CLKBA                          : VitalDelayType := UnitDelay;
        tsetup_B_LEBA_CLK_EQ_1_noedge_negedge   : VitalDelayType := UnitDelay;
        tsetup_B_LEBA_CLK_EQ_0_noedge_negedge   : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_A_CLKAB       : VitalDelayType := UnitDelay;
        thold_B_CLKBA       : VitalDelayType := UnitDelay;
        thold_A_LEAB        : VitalDelayType := UnitDelay;
        thold_B_LEBA        : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLKAB_posedge   : VitalDelayType := UnitDelay;
        tpw_CLKAB_negedge   : VitalDelayType := UnitDelay;
        tpw_LEAB_posedge    : VitalDelayType := UnitDelay;
        tpw_CLKBA_posedge   : VitalDelayType := UnitDelay;
        tpw_CLKBA_negedge   : VitalDelayType := UnitDelay;
        tpw_LEBA_posedge    : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLKAB_posedge : VitalDelayType := UnitDelay;
        tperiod_CLKBA_posedge : VitalDelayType := UnitDelay;
        -- generic control parameters
        TimingChecksOn  : BOOLEAN   := DefaultTimingChecks;
        MsgOn           : BOOLEAN   := DefaultMsgOn;
        XOn             : BOOLEAN   := DefaultXOn;
        InstancePath    : STRING    := DefaultInstancePath;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        CLKAB           : IN       std_ulogic := 'U';
        OEABNeg         : IN       std_ulogic := 'U';
        LEAB            : IN       std_ulogic := 'U';
        A               : INOUT    std_logic  := 'U';
        CLKBA           : IN       std_ulogic := 'U';
        OEBANeg         : IN       std_ulogic := 'U';
        LEBA            : IN       std_ulogic := 'U';
        B               : INOUT    std_logic  := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of stdh502 : ENTITY IS TRUE;
END stdh502;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdh502 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;
    CONSTANT partID : STRING  := "stdh502";

    SIGNAL CLKAB_ipd           : std_ulogic := 'U';
    SIGNAL OEABNeg_ipd         : std_ulogic := 'U';
    SIGNAL LEAB_ipd            : std_ulogic := 'U';
    SIGNAL A_ipd               : std_ulogic := 'U';
    SIGNAL Abh                 : std_logic  := 'U';
    SIGNAL AbhNeg              : std_ulogic := 'U';
    SIGNAL CLKBA_ipd           : std_ulogic := 'U';
    SIGNAL OEBANeg_ipd         : std_ulogic := 'U';
    SIGNAL LEBA_ipd            : std_ulogic := 'U';
    SIGNAL B_ipd               : std_ulogic := 'U';
    SIGNAL Bbh                 : std_logic  := 'U';
    SIGNAL BbhNeg              : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (A_ipd, A, tipd_A);
        w_2 : VitalWireDelay (B_ipd, B, tipd_B);
        w_3 : VitalWireDelay (CLKAB_ipd, CLKAB, tipd_CLKAB);
        w_4 : VitalWireDelay (CLKBA_ipd, CLKBA, tipd_CLKBA);
        w_5 : VitalWireDelay (LEAB_ipd, LEAB, tipd_LEAB);
        w_6 : VitalWireDelay (LEBA_ipd, LEBA, tipd_LEBA);
        w_7 : VitalWireDelay (OEABNeg_ipd, OEABNeg, tipd_OEABNeg);
        w_8 : VitalWireDelay (OEBANeg_ipd, OEBANeg, tipd_OEBANeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalBUF (q => Abh, a => A_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_2: VitalINV (q => AbhNeg, a => Abh);
    a_3: VitalINV (q => Abh, a => AbhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    b_1: VitalBUF (q => Bbh, a => B_ipd, ResultMap => ('U', 'Z', '0', '1'));
    b_2: VitalINV (q => BbhNeg, a => Bbh);
    b_3: VitalINV (q => Bbh, a => BbhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    ----------------------------------------------------------------------------
    -- VITALBehavior Process
    ----------------------------------------------------------------------------
    VITALBehavior1 : PROCESS(Abh, CLKAB_ipd, LEAB_ipd, OEABNeg_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_A_CLKAB           : X01 := '0';
        VARIABLE TD_A_CLKAB              : VitalTimingDataType;

        VARIABLE Tviol_A_LEAB_CLKABhigh  : X01 := '0';
        VARIABLE TD_A_LEAB_CLKABhigh     : VitalTimingDataType;

        VARIABLE Tviol_A_LEAB_CLKABlow   : X01 := '0';
        VARIABLE TD_A_LEAB_CLKABlow      : VitalTimingDataType;

        VARIABLE Pviol_CLKAB    : X01 := '0';
        VARIABLE PD_CLKAB       : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_LEAB     : X01 := '0';
        VARIABLE PD_LEAB        : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation      : X01 := '0';

        -- Functionality Result Variable
        VARIABLE B_zd               : std_ulogic;

        -- Temporary Variable for tri state out
        VARIABLE Bint               : std_ulogic := 'U';

        -- Prevdata for LATNDFF tab
        VARIABLE PrevData           : std_logic_vector(0 to 3);

        -- Output Glitch Detection Variable
        VARIABLE B_GlitchData       : VitalGlitchDataType;

        -- No Weak Values Variables
        VARIABLE CLKAB_nwv          : UX01 := 'X';
        VARIABLE LEAB_nwv           : UX01 := 'X';
        VARIABLE OEABNeg_nwv        : UX01 := 'X';

    BEGIN

        CLKAB_nwv       := To_UX01(CLKAB_ipd);
        LEAB_nwv        := To_UX01(LEAB_ipd);
        OEABNeg_nwv     := To_UX01(OEABNeg_ipd);

        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => Abh,
                TestSignalName  => "Abh",
                RefSignal       => CLKAB_ipd,
                RefSignalName   => "CLKAB_ipd",
                SetupHigh       => tsetup_A_CLKAB,
                SetupLow        => tsetup_A_CLKAB,
                HoldHigh        => thold_A_CLKAB,
                HoldLow         => thold_A_CLKAB,
                CheckEnabled    => OEABNeg_nwv = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/partID",
                TimingData      => TD_A_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_CLKAB
            );

            VitalSetupHoldCheck (
                TestSignal      => Abh,
                TestSignalName  => "Abh",
                RefSignal       => LEAB_ipd,
                RefSignalName   => "LEAB_ipd",
                SetupHigh       => tsetup_A_LEAB_CLK_EQ_0_noedge_negedge,
                SetupLow        => tsetup_A_LEAB_CLK_EQ_0_noedge_negedge,
                HoldHigh        => thold_A_LEAB,
                HoldLow         => thold_A_LEAB,
                CheckEnabled    => CLKAB_nwv = '0',
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/partID",
                TimingData      => TD_A_LEAB_CLKABlow,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_LEAB_CLKABlow
            );

            VitalSetupHoldCheck (
                TestSignal      => Abh,
                TestSignalName  => "Abh",
                RefSignal       => LEAB_ipd,
                RefSignalName   => "LEAB_ipd",
                SetupHigh       => tsetup_A_LEAB_CLK_EQ_1_noedge_negedge,
                SetupLow        => tsetup_A_LEAB_CLK_EQ_1_noedge_negedge,
                HoldHigh        => thold_A_LEAB,
                HoldLow         => thold_A_LEAB,
                CheckEnabled    => CLKAB_nwv = '1',
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/partID",
                TimingData      => TD_A_LEAB_CLKABhigh,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_LEAB_CLKABhigh
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKAB_ipd,
                TestSignalName  => "CLKAB_ipd",
                Period          => tperiod_CLKAB_posedge,
                PulseWidthHigh  => tpw_CLKAB_posedge,
                PulseWidthlow   => tpw_CLKAB_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/partID",
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
                HeaderMsg       => InstancePath & "/partID",
                PeriodData      => PD_LEAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LEAB
            );

        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
         Violation := Tviol_A_CLKAB          OR
                      Tviol_A_LEAB_CLKABlow  OR
                      Tviol_A_LEAB_CLKABhigh OR
                      Pviol_CLKAB            OR
                      Pviol_LEAB;

         VitalStateTable (
                StateTable      => LATNDFF_tab,
                DataIn          => (Violation, LEAB_ipd, CLKAB_ipd, Abh),
                Result          => Bint,
                PreviousDataIn  => PrevData
         );

        B_zd := VitalBUFIF0 (data   => Bint,
                             enable => OEABNeg_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       => B,
            OutSignalName   => "B",
            OutTemp         => B_zd,
            GlitchData      => B_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLKAB_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_CLKAB_B),
                      PathCondition     => (OEABNeg_nwv = '0' AND
                                            LEAB_nwv = '0')),
                1 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_LEAB_B),
                      PathCondition     => OEABNeg_nwv = '0'),
                3 => (InputChangeTime   => Abh'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_B),
                      PathCondition     => (OEABNeg_nwv = '0' AND
                                            LEAB_nwv = '1'))
            )
        );

    END PROCESS;

    VITALBehavior2 : PROCESS(Bbh, CLKBA_ipd, LEBA_ipd, OEBANeg_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_B_CLKBA           : X01 := '0';
        VARIABLE TD_B_CLKBA              : VitalTimingDataType;

        VARIABLE Tviol_B_LEBA_CLKBAhigh  : X01 := '0';
        VARIABLE TD_B_LEBA_CLKBAhigh     : VitalTimingDataType;

        VARIABLE Tviol_B_LEBA_CLKBAlow   : X01 := '0';
        VARIABLE TD_B_LEBA_CLKBAlow      : VitalTimingDataType;

        VARIABLE Pviol_CLKBA    : X01 := '0';
        VARIABLE PD_CLKBA       : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_LEBA     : X01 := '0';
        VARIABLE PD_LEBA        : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation      : X01 := '0';

        -- Functionality Result Variable
        VARIABLE A_zd               : std_ulogic;

        -- Temporary Variable for tri state out
        VARIABLE Aint               : std_ulogic := 'U';

        -- Prevdata for LATNDFF tab
        VARIABLE PrevData           : std_logic_vector(0 to 3);

        -- Output Glitch Detection Variable
        VARIABLE A_GlitchData       : VitalGlitchDataType;

        -- No Weak Values Variables
        VARIABLE CLKBA_nwv          : UX01 := 'X';
        VARIABLE LEBA_nwv           : UX01 := 'X';
        VARIABLE OEBANeg_nwv        : UX01 := 'X';

    BEGIN

        CLKBA_nwv       := To_UX01(CLKBA_ipd);
        LEBA_nwv        := To_UX01(LEBA_ipd);
        OEBANeg_nwv     := To_UX01(OEBANeg_ipd);

        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => Bbh,
                TestSignalName  => "Bbh",
                RefSignal       => CLKBA_ipd,
                RefSignalName   => "CLKBA_ipd",
                SetupHigh       => tsetup_B_CLKBA,
                SetupLow        => tsetup_B_CLKBA,
                HoldHigh        => thold_B_CLKBA,
                HoldLow         => thold_B_CLKBA,
                CheckEnabled    => OEBANeg_nwv = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/partID",
                TimingData      => TD_B_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_CLKBA
            );

            VitalSetupHoldCheck (
                TestSignal      => Bbh,
                TestSignalName  => "Bbh",
                RefSignal       => LEBA_ipd,
                RefSignalName   => "LEBA_ipd",
                SetupHigh       => tsetup_B_LEBA_CLK_EQ_0_noedge_negedge,
                SetupLow        => tsetup_B_LEBA_CLK_EQ_0_noedge_negedge,
                HoldHigh        => thold_B_LEBA,
                HoldLow         => thold_B_LEBA,
                CheckEnabled    => CLKBA_nwv = '0',
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/partID",
                TimingData      => TD_B_LEBA_CLKBAlow,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_LEBA_CLKBAlow
            );

            VitalSetupHoldCheck (
                TestSignal      => Bbh,
                TestSignalName  => "Bbh",
                RefSignal       => LEBA_ipd,
                RefSignalName   => "LEBA_ipd",
                SetupHigh       => tsetup_B_LEBA_CLK_EQ_1_noedge_negedge,
                SetupLow        => tsetup_B_LEBA_CLK_EQ_1_noedge_negedge,
                HoldHigh        => thold_B_LEBA,
                HoldLow         => thold_B_LEBA,
                CheckEnabled    => CLKBA_nwv = '1',
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/partID",
                TimingData      => TD_B_LEBA_CLKBAhigh,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_LEBA_CLKBAhigh
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKBA_ipd,
                TestSignalName  => "CLKBA_ipd",
                Period          => tperiod_CLKBA_posedge,
                PulseWidthHigh  => tpw_CLKBA_posedge,
                PulseWidthlow   => tpw_CLKBA_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/partID",
                PeriodData      => PD_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKBA
            );

            VitalPeriodPulseCheck (
                TestSignal      => LEBA_ipd,
                TestSignalName  => "LEBA_ipd",
                PulseWidthHigh  => tpw_LEBA_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/partID",
                PeriodData      => PD_LEBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LEBA
            );

        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
         Violation := Tviol_B_CLKBA          OR
                      Tviol_B_LEBA_CLKBAlow  OR
                      Tviol_B_LEBA_CLKBAhigh OR
                      Pviol_CLKBA            OR
                      Pviol_LEBA;

         VitalStateTable (
                StateTable      => LATNDFF_tab,
                DataIn          => (Violation, LEBA_ipd, CLKBA_ipd, Bbh),
                Result          => Aint,
                PreviousDataIn  => PrevData
         );

        A_zd := VitalBUFIF0 (data   => Aint,
                             enable => OEBANeg_ipd);

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
                0 => (InputChangeTime   => CLKBA_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_CLKBA_A),
                      PathCondition     => (OEBANeg_nwv = '0' AND
                                            LEBA_nwv = '0')),
                1 => (InputChangeTime   => OEBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => LEBA_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_LEBA_A),
                      PathCondition     => OEBANeg_nwv = '0'),
                3 => (InputChangeTime   => Bbh'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_B_A),
                      PathCondition     => (OEBANeg_nwv = '0' AND
                                            LEBA_nwv = '1'))
            )
        );

    END PROCESS;

END vhdl_behavioral;
