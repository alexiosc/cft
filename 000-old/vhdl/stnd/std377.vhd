--------------------------------------------------------------------------------
--  File Name: std377.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version | author  | mod date | changes made
--    V1.0  R. Steele  97 JAN  4  Conformed to style guide
--    V1.1  R. Munden  97 MAR 01  Changed XGenerationOn to XOn, added MsgOn, and
--                                updated TimingChecks & PathDelays
--    V1.2  R. Steele  97 MAY  4  Fixed port initialization
--    V1.3  R. Steele  97 JUN 06  Removed excess generic
--    V1.4  R. Steele  97 JUL 10  Removed excess generic
--    V1.5  R. Munden  08 AUG 26  Change PrevData range to eliminate warning
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD377
-- 
--  Desciption:  Octal D-Type Flip-Flop with Enable (8-Bit Hold Register)
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;
                 USE FMF.ff_package.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std377 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_D              : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLK            : VitalDelayType01 := VitalZeroDelay01;
        tipd_GNeg           : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLK_Q           : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_D_CLK        : VitalDelayType := UnitDelay;
        tsetup_GNeg_CLK     : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_D_CLK         : VitalDelayType := UnitDelay;
        thold_GNeg_CLK      : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLK_posedge     : VitalDelayType := UnitDelay;
        tpw_CLK_negedge     : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum CLK period = 1/max freq
        tperiod_CLK_posedge : VitalDelayType := UnitDelay;
        -- generic control parameters
        TimingChecksOn      : Boolean  := DefaultTimingChecks;
        MsgOn               : BOOLEAN := DefaultMsgOn;
        XOn                 : Boolean  := DefaultXOn;
        InstancePath        : STRING   := DefaultInstancePath;
        -- For FMF SDF techonology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );
    PORT (
        Q       : OUT   std_logic := 'U';
        D       : IN    std_logic := 'X';
        CLK     : IN    std_logic := 'X';
        GNeg    : IN    std_logic := 'X'
    );
    ATTRIBUTE VITAL_LEVEL0 of std377 : ENTITY IS TRUE;
END std377;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std377 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL D_ipd        : std_ulogic := 'X';
    SIGNAL Dint         : std_ulogic := 'X';
    SIGNAL CLK_ipd      : std_ulogic := 'X';
    SIGNAL GNeg_ipd     : std_ulogic := 'X';
    SIGNAL Qint         : std_ulogic := 'X';


BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (D_ipd, D, tipd_D);
        w_2: VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_3: VitalWireDelay (GNeg_ipd, GNeg, tipd_GNeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- This device is modeled as a hold register.  That is, data is recirculated
    -- from the output to the input in the hold mode (disabled).  It is 
    -- interesting to note that that is the way most data sheets represent the
    -- device, but they don't call it that.  They refer to the device as a
    -- D-type flip-flop with an enable.  What's worse is the TI data sheet 
    -- represents the device as having a clock enable.  If you look at the logic
    -- diagram, however, you'll notice that this circuit as it is represented
    -- could never work.
    ----------------------------------------------------------------------------

    ----------------------------------------------------------------------------
    -- Concurrent Procedures
    ----------------------------------------------------------------------------
    a_1: VitalBUF  (q => Q,  a => Qint);
    a_2: VitalMUX2 (q => Dint, d1 => Qint, d0 => D_ipd, dSel => GNeg_ipd);

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CLK_ipd, Dint, GNeg_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_D_CLK    : X01 := '0';
        VARIABLE TD_D_CLK       : VitalTimingDataType;

        VARIABLE Tviol_GNeg_CLK    : X01 := '0';
        VARIABLE TD_GNeg_CLK       : VitalTimingDataType;

        VARIABLE Pviol_CLK      : X01 := '0';
        VARIABLE PD_CLK         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation      : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd           : std_ulogic;
        VARIABLE PrevData       : std_logic_vector(0 to 2);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData   : VitalGlitchDataType;


    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => Dint,
                TestSignalName  => "Dint",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_D_CLK,
                SetupLow        => tsetup_D_CLK,
                HoldHigh        => thold_D_CLK,
                HoldLow         => thold_D_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std377",
                TimingData      => TD_D_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_D_CLK
            );
 
            VitalSetupHoldCheck (
                TestSignal      => GNeg_ipd,
                TestSignalName  => "GNeg_ipd",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_GNeg_CLK,
                SetupLow        => tsetup_GNeg_CLK,
                HoldHigh        => thold_GNeg_CLK,
                HoldLow         => thold_GNeg_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std377",
                TimingData      => TD_GNeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_GNeg_CLK
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => CLK_ipd,
                TestSignalName  => "CLK_ipd",
                Period          => tperiod_CLK_posedge,
                PulseWidthHigh  => tpw_CLK_posedge,
                PulseWidthLow   => tpw_CLK_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std377",
                PeriodData      => PD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLK
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_D_CLK OR Tviol_GNeg_CLK OR Pviol_CLK;
 
        VitalStateTable (
            StateTable      => DFF_tab,
            DataIn          => (Violation, CLK_ipd, Dint),
            Result          => Q_zd,
            PreviousDataIn  => PrevData
        );
 
        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => Qint,
            OutSignalName   => "Qint",
            OutTemp         => Q_zd,
            GlitchData      => Q_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q,
                      PathCondition     => TRUE)
            )
        );
 
    END PROCESS;
 
END vhdl_behavioral;
