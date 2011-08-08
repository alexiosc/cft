--------------------------------------------------------------------------------
--  File Name: std646.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2001, 2002 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   01 DEC 22   Initial release
--    V1.1     R. Munden   02 JAN 02   Correct polarity of DIR, add pathdelays
--                                     for SAB and SBA
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/74XXXX
--  Part:       STD646
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
ENTITY std646 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_SAB                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKAB               : VitalDelayType01 := VitalZeroDelay01;
        tipd_DIR                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_SBA                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKBA               : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg               : VitalDelayType01 := VitalZeroDelay01;
        tipd_B                   : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_B                  : VitalDelayType01 := UnitDelay01;
        tpd_SAB_A                : VitalDelayType01 := UnitDelay01;
        tpd_CLKAB_B              : VitalDelayType01 := UnitDelay01;
        tpd_DIR_A                : VitalDelayType01Z := UnitDelay01Z;
        tpd_OENEG_A              : VitalDelayType01Z := UnitDelay01Z;
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
        SAB             : IN    std_ulogic := 'U';
        CLKAB           : IN    std_ulogic := 'U';
        DIR             : IN    std_ulogic := 'U';
        A               : INOUT std_ulogic := 'U';
        SBA             : IN    std_ulogic := 'U';
        CLKBA           : IN    std_ulogic := 'U';
        OENeg           : IN    std_ulogic := 'U';
        B               : INOUT std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std646 : ENTITY IS TRUE;
END std646;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std646 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL SAB_ipd             : std_ulogic := 'U';
    SIGNAL CLKAB_ipd           : std_ulogic := 'U';
    SIGNAL DIR_ipd             : std_ulogic := 'U';
    SIGNAL SBA_ipd             : std_ulogic := 'U';
    SIGNAL CLKBA_ipd           : std_ulogic := 'U';
    SIGNAL OENeg_ipd           : std_ulogic := 'U';
    SIGNAL A_ipd               : std_ulogic := 'U';
    SIGNAL B_ipd               : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (SAB_ipd, SAB, tipd_SAB);
        w_2 : VitalWireDelay (CLKAB_ipd, CLKAB, tipd_CLKAB);
        w_3 : VitalWireDelay (DIR_ipd, DIR, tipd_DIR);
        w_4 : VitalWireDelay (B_ipd, B, tipd_B);
        w_5 : VitalWireDelay (SBA_ipd, SBA, tipd_SBA);
        w_6 : VitalWireDelay (CLKBA_ipd, CLKBA, tipd_CLKBA);
        w_7 : VitalWireDelay (OENeg_ipd, OENeg, tipd_OENeg);
        w_8 : VitalWireDelay (A_ipd, A, tipd_A);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior1 : PROCESS (CLKAB_ipd, SAB_ipd, A_ipd, DIR_ipd, OENeg_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_A_CLKAB      : X01 := '0';
        VARIABLE TD_A_CLKAB         : VitalTimingDataType;

        VARIABLE Pviol_CLKAB        : X01 := '0';
        VARIABLE PD_CLKAB           : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation          : X01 := '0';

        -- Functionality Results Variables
        VARIABLE B_zd               : std_ulogic;
        VARIABLE PrevData           : std_logic_vector(0 to 2);
        VARIABLE Areg               : std_ulogic := 'U';
        VARIABLE Aint               : std_ulogic := 'U';
        VARIABLE Bena               : std_ulogic := 'U';

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
                HeaderMsg       => InstancePath & "/std646",
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
                HeaderMsg       => InstancePath & "/std646",
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

        Bena := VitalAND2 (A => DIR_ipd,
                           B => NOT OENeg_ipd);

        B_zd := VitalBUFIF1 (Data   => Aint,
                             Enable => Bena);
 
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
                      PathCondition     => (Bena = '1')),
                1 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_B),
                      PathCondition     => (Bena = '1')),
                2 => (InputChangeTime   => DIR_ipd'LAST_EVENT,
                      PathDelay         => tpd_DIR_A,
                      PathCondition     => TRUE),
                3 => (InputChangeTime   => SAB_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_SAB_A),
                      PathCondition     => TRUE),
                4 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_A,
                      PathCondition     => TRUE)
            )
        );
 
    END PROCESS;
 
    VitalBehavior2 : PROCESS (CLKBA_ipd, SBA_ipd, B_ipd, OENeg_ipd, DIR_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_B_CLKBA      : X01 := '0';
        VARIABLE TD_B_CLKBA         : VitalTimingDataType;

        VARIABLE Pviol_CLKBA        : X01 := '0';
        VARIABLE PD_CLKBA           : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation          : X01 := '0';

        -- Functionality Results Variables
        VARIABLE A_zd               : std_ulogic;
        VARIABLE PrevData           : std_logic_vector(0 to 2);
        VARIABLE Breg               : std_ulogic := 'U';
        VARIABLE Bint               : std_ulogic := 'U';
        VARIABLE Aena               : std_ulogic := 'U';

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
                HeaderMsg       => InstancePath & "/std646",
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
                HeaderMsg       => InstancePath & "/std646",
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

        Aena := VitalAND2 (A => NOT OENeg_ipd,
                           B => NOT DIR_ipd);

        A_zd := VitalBUFIF1 (Data   => Bint,
                             Enable => Aena);
 
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
                      PathCondition     => (Aena = '1')),
                1 => (InputChangeTime   => B_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_B),
                      PathCondition     => (Aena = '1')),
                2 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_A,
                      PathCondition     => TRUE),
                3 => (InputChangeTime   => SBA_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_SAB_A),
                      PathCondition     => TRUE),
                4 => (InputChangeTime   => DIR_ipd'LAST_EVENT,
                      PathDelay         => tpd_DIR_A,
                      PathCondition     => TRUE)
            )
        );
 
    END PROCESS;

END vhdl_behavioral;
