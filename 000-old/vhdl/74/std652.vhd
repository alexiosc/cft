--------------------------------------------------------------------------------
--  File Name: std652.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1998 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   98 MAY 11   Initial release
--    V1.1     R. Munden   98 SEP 18   Added period checks
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/74XXXX
--  Part:       STD652
-- 
--  Desciption: Registered Bus Transceiver with 3-State Output
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std652 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_SAB                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKAB               : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEAB                : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_SBA                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKBA               : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEBANeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_B                   : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_B                  : VitalDelayType01 := UnitDelay01;
        tpd_SAB_A                : VitalDelayType01 := UnitDelay01;
        tpd_CLKAB_B              : VitalDelayType01 := UnitDelay01;
        tpd_OEAB_B               : VitalDelayType01Z := UnitDelay01Z;
        tpd_OEBANeg_A            : VitalDelayType01Z := UnitDelay01Z;
        -- tsetup values: setup times
        tsetup_A_CLKAB           : VitalDelayType := UnitDelay;
        tsetup_B_CLKBA           : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_A_CLKAB            : VitalDelayType := UnitDelay;
        thold_B_CLKBA            : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLKAB_posedge        : VitalDelayType := UnitDelay;
        tpw_CLKBA_posedge        : VitalDelayType := UnitDelay;
        tpw_CLKAB_negedge        : VitalDelayType := UnitDelay;
        tpw_CLKBA_negedge        : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLKAB_posedge    : VitalDelayType := UnitDelay;
        tperiod_CLKBA_posedge    : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        SAB             : IN    std_logic := 'U';
        CLKAB           : IN    std_logic := 'U';
        OEAB            : IN    std_logic := 'U';
        A               : INOUT std_logic := 'U';
        SBA             : IN    std_logic := 'U';
        CLKBA           : IN    std_logic := 'U';
        OEBANeg         : IN    std_logic := 'U';
        B               : INOUT std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std652 : ENTITY IS TRUE;
END std652;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std652 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL SAB_ipd             : std_ulogic := 'X';
    SIGNAL CLKAB_ipd           : std_ulogic := 'X';
    SIGNAL OEAB_ipd            : std_ulogic := 'X';
    SIGNAL SBA_ipd             : std_ulogic := 'X';
    SIGNAL CLKBA_ipd           : std_ulogic := 'X';
    SIGNAL OEBANeg_ipd         : std_ulogic := 'X';
    SIGNAL A_ipd               : std_ulogic := 'X';
    SIGNAL B_ipd               : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (SAB_ipd, SAB, tipd_SAB);
        w_2 : VitalWireDelay (CLKAB_ipd, CLKAB, tipd_CLKAB);
        w_3 : VitalWireDelay (OEAB_ipd, OEAB, tipd_OEAB);
        w_4 : VitalWireDelay (B_ipd, B, tipd_B);
        w_5 : VitalWireDelay (SBA_ipd, SBA, tipd_SBA);
        w_6 : VitalWireDelay (CLKBA_ipd, CLKBA, tipd_CLKBA);
        w_7 : VitalWireDelay (OEBANeg_ipd, OEBANeg, tipd_OEBANeg);
        w_8 : VitalWireDelay (A_ipd, A, tipd_A);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior1 : PROCESS (CLKAB_ipd, SAB_ipd, A_ipd, OEAB_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_A_CLKAB      : X01 := '0';
        VARIABLE TD_A_CLKAB         : VitalTimingDataType;

        VARIABLE Pviol_CLKAB        : X01 := '0';
        VARIABLE PD_CLKAB           : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation          : X01 := '0';

        -- Functionality Results Variables
        VARIABLE B_zd               : std_ulogic;
        VARIABLE PrevData           : std_logic_vector(0 to 2);
        VARIABLE Areg               : std_ulogic := 'X';
        VARIABLE Aint               : std_ulogic := 'X';

        -- Output Glitch Detection Variables
        VARIABLE B_GlitchData       : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => A_ipd,
                TestSignalName  => "A_ipd",
                RefSignal       => CLKAB_ipd,
                RefSignalName   => "CLKAB_ipd",
                SetupHigh       => tsetup_A_CLKAB,
                SetupLow        => tsetup_A_CLKAB,
                HoldHigh        => thold_A_CLKAB,
                HoldLow         => thold_A_CLKAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std652",
                TimingData      => TD_A_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_CLKAB
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKAB_ipd,
                TestSignalName  => "CLKAB_ipd",
                Period          => tperiod_CLKAB_posedge,
                PulseWidthHigh  => tpw_CLKAB_posedge,
                PulseWidthlow   => tpw_CLKAB_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std652",
                PeriodData      => PD_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKAB
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_A_CLKAB OR Pviol_CLKAB;
 
        VitalStateTable (
            StateTable      => DFF_tab,
            DataIn          => (Violation, CLKAB_ipd, A_ipd),
            Result          => Areg,
            PreviousDataIn  => PrevData
        );

        Aint := VitalMUX2(
                     Data1   => Areg,
                     Data0   => A_ipd,
                     dSelect => SAB_ipd
                 );

        B_zd := VitalBUFIF1 (Data   => Aint,
                              Enable => OEAB_ipd);
 
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
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_B),
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => OEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEAB_B,
                      PathCondition     => TRUE)
            )
        );
 
    END PROCESS;
 
    VitalBehavior2 : PROCESS (CLKBA_ipd, SBA_ipd, B_ipd, OEBANeg_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_B_CLKBA      : X01 := '0';
        VARIABLE TD_B_CLKBA         : VitalTimingDataType;

        VARIABLE Pviol_CLKBA        : X01 := '0';
        VARIABLE PD_CLKBA           : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation          : X01 := '0';

        -- Functionality Results Variables
        VARIABLE A_zd               : std_ulogic;
        VARIABLE PrevData           : std_logic_vector(0 to 2);
        VARIABLE Breg               : std_ulogic := 'X';
        VARIABLE Bint               : std_ulogic := 'X';

        -- Output Glitch Detection Variables
        VARIABLE A_GlitchData       : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => B_ipd,
                TestSignalName  => "B_ipd",
                RefSignal       => CLKBA_ipd,
                RefSignalName   => "CLKBA_ipd",
                SetupHigh       => tsetup_B_CLKBA,
                SetupLow        => tsetup_B_CLKBA,
                HoldHigh        => thold_B_CLKBA,
                HoldLow         => thold_B_CLKBA,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std652",
                TimingData      => TD_B_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_CLKBA
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKBA_ipd,
                TestSignalName  => "CLKBA_ipd",
                Period          => tperiod_CLKBA_posedge,
                PulseWidthHigh  => tpw_CLKBA_posedge,
                PulseWidthLow   => tpw_CLKBA_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std652",
                PeriodData      => PD_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKBA
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_B_CLKBA OR Pviol_CLKBA;
 
        VitalStateTable (
            StateTable      => DFF_tab,
            DataIn          => (Violation, CLKBA_ipd, B_ipd),
            Result          => Breg,
            PreviousDataIn  => PrevData
        );

        Bint := VitalMUX2(
                     Data1   => Breg,
                     Data0   => B_ipd,
                     dSelect => SBA_ipd
                 );

        A_zd := VitalBUFIF0 (Data   => Bint,
                              Enable => OEBANeg_ipd);
 
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
                      PathDelay         => VitalExtendToFillDelay(tpd_CLKAB_B),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => B_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_B),
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => OEBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEBANeg_A,
                      PathCondition     => TRUE)
            )
        );
 
    END PROCESS;

END vhdl_behavioral;
