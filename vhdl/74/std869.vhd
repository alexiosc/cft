--------------------------------------------------------------------------------
--  File Name: std869.vhd
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
--    V1.0  R. Steele  96 DEC 23  Conformed to style guide
--    V1.1  R. Munden  97 MAR 01  Changed XGenerationOn to XOn, added MsgOn, and
--                                updated TimingChecks & PathDelays
--    V1.2  R. Steele  97 JUL 10  Added tsetup_ENTNeg_CLK
--    V1.3  R. Munden  98 APR 22  Switched to IEEE.numeric_std and unsigned type
--                                for arithmetic operations on vectors
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD869
-- 
--  Desciption:  Synchronous 8-Bit Up/Down Counter
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
                 USE IEEE.numeric_std.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std869 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_S0             : VitalDelayType01 := VitalZeroDelay01;
        tipd_S1             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D0             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D1             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D2             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D3             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D4             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D5             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D6             : VitalDelayType01 := VitalZeroDelay01;
        tipd_D7             : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLK            : VitalDelayType01 := VitalZeroDelay01;
        tipd_ENTNeg         : VitalDelayType01 := VitalZeroDelay01;
        tipd_ENPNeg         : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_S0_RCONeg       : VitalDelayType01 := UnitDelay01;
        tpd_S1_RCONeg       : VitalDelayType01 := UnitDelay01;
        tpd_CLK_Q0          : VitalDelayType01 := UnitDelay01;
        tpd_CLK_RCONeg      : VitalDelayType01 := UnitDelay01;
        tpd_ENPNeg_RCONeg   : VitalDelayType01 := UnitDelay01;
        tpd_ENTNeg_RCONeg   : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_S0_CLK_S0_EQ_0_AN_S1_EQ_0   : VitalDelayType := UnitDelay;
        tsetup_S0_CLK_S0_EQ_1_AN_S1_EQ_0   : VitalDelayType := UnitDelay;
        tsetup_S0_CLK_S0_EQ_0_AN_S1_EQ_1   : VitalDelayType := UnitDelay;
        tsetup_S0_CLK_S0_EQ_1_AN_S1_EQ_1   : VitalDelayType := UnitDelay;
        tsetup_S1_CLK_S1_EQ_0_AN_S0_EQ_0   : VitalDelayType := UnitDelay;
        tsetup_S1_CLK_S1_EQ_1_AN_S0_EQ_0   : VitalDelayType := UnitDelay;
        tsetup_S1_CLK_S1_EQ_0_AN_S0_EQ_1   : VitalDelayType := UnitDelay;
        tsetup_S1_CLK_S1_EQ_1_AN_S0_EQ_1   : VitalDelayType := UnitDelay;
        tsetup_D0_CLK       : VitalDelayType := UnitDelay;
        tsetup_ENPNeg_CLK   : VitalDelayType := UnitDelay;
        tsetup_ENTNeg_CLK   : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_S0_CLK        : VitalDelayType := UnitDelay;
        thold_D0_CLK        : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLK_posedge     : VitalDelayType := UnitDelay;
        tpw_CLK_negedge     : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
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
        S0          : IN    std_logic := 'X';
        S1          : IN    std_logic := 'X';
        D0          : IN    std_logic := 'X';
        D1          : IN    std_logic := 'X';
        D2          : IN    std_logic := 'X';
        D3          : IN    std_logic := 'X';
        D4          : IN    std_logic := 'X';
        D5          : IN    std_logic := 'X';
        D6          : IN    std_logic := 'X';
        D7          : IN    std_logic := 'X';
        CLK         : IN    std_logic := 'X';
        ENTNeg      : IN    std_logic := 'X';
        ENPNeg      : IN    std_logic := 'X';
        RCONeg      : OUT   std_logic := 'U';
        Q0          : OUT   std_logic := 'U';
        Q1          : OUT   std_logic := 'U';
        Q2          : OUT   std_logic := 'U';
        Q3          : OUT   std_logic := 'U';
        Q4          : OUT   std_logic := 'U';
        Q5          : OUT   std_logic := 'U';
        Q6          : OUT   std_logic := 'U';
        Q7          : OUT   std_logic := 'U'
    );

    ATTRIBUTE VITAL_LEVEL0 of std869 : ENTITY IS TRUE;
END std869;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std869 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL S0_ipd       : std_ulogic := 'X';
    SIGNAL S1_ipd       : std_ulogic := 'X';
    SIGNAL D0_ipd       : std_ulogic := 'X';
    SIGNAL D1_ipd       : std_ulogic := 'X';
    SIGNAL D2_ipd       : std_ulogic := 'X';
    SIGNAL D3_ipd       : std_ulogic := 'X';
    SIGNAL D4_ipd       : std_ulogic := 'X';
    SIGNAL D5_ipd       : std_ulogic := 'X';
    SIGNAL D6_ipd       : std_ulogic := 'X';
    SIGNAL D7_ipd       : std_ulogic := 'X';
    SIGNAL CLK_ipd      : std_ulogic := 'X';
    SIGNAL ENTNeg_ipd   : std_ulogic := 'X';
    SIGNAL ENPNeg_ipd   : std_ulogic := 'X';


BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (S0_ipd, S0, tipd_S0);
        w_2: VitalWireDelay (S1_ipd, S1, tipd_S1);
        w_3: VitalWireDelay (D0_ipd, D0, tipd_D0);
        w_4: VitalWireDelay (D1_ipd, D1, tipd_D1);
        w_5: VitalWireDelay (D2_ipd, D2, tipd_D2);
        w_6: VitalWireDelay (D3_ipd, D3, tipd_D3);
        w_7: VitalWireDelay (D4_ipd, D4, tipd_D4);
        w_8: VitalWireDelay (D5_ipd, D5, tipd_D5);
        w_9: VitalWireDelay (D6_ipd, D6, tipd_D6);
        w_10: VitalWireDelay (D7_ipd, D7, tipd_D7);
        w_11: VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_12: VitalWireDelay (ENTNeg_ipd, ENTNeg, tipd_ENTNeg);
        w_13: VitalWireDelay (ENPNeg_ipd, ENPNeg, tipd_ENPNeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CLK_ipd, S1_ipd, S0_ipd, ENTNeg_ipd, ENPNeg_ipd,
                             D0_ipd,  D1_ipd,  D2_ipd, D3_ipd, 
                             D4_ipd,  D5_ipd,  D6_ipd, D7_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_D0_CLK   : X01 := '0';
        VARIABLE TD_D0_CLK      : VitalTimingDataType;

        VARIABLE Tviol_D1_CLK   : X01 := '0';
        VARIABLE TD_D1_CLK      : VitalTimingDataType;

        VARIABLE Tviol_D2_CLK   : X01 := '0';
        VARIABLE TD_D2_CLK      : VitalTimingDataType;

        VARIABLE Tviol_D3_CLK   : X01 := '0';
        VARIABLE TD_D3_CLK      : VitalTimingDataType;

        VARIABLE Tviol_D4_CLK   : X01 := '0';
        VARIABLE TD_D4_CLK      : VitalTimingDataType;

        VARIABLE Tviol_D5_CLK   : X01 := '0';
        VARIABLE TD_D5_CLK      : VitalTimingDataType;

        VARIABLE Tviol_D6_CLK   : X01 := '0';
        VARIABLE TD_D6_CLK      : VitalTimingDataType;

        VARIABLE Tviol_D7_CLK   : X01 := '0';
        VARIABLE TD_D7_CLK      : VitalTimingDataType;

        VARIABLE Tviol_S1_CLK_S0_EQ_0 : X01 := '0';
        VARIABLE TD_S1_CLK_S0_EQ_0    : VitalTimingDataType;

        VARIABLE Tviol_S1_CLK_S0_EQ_1 : X01 := '0';
        VARIABLE TD_S1_CLK_S0_EQ_1    : VitalTimingDataType;

        VARIABLE Tviol_S0_CLK_S1_EQ_0 : X01 := '0';
        VARIABLE TD_S0_CLK_S1_EQ_0    : VitalTimingDataType;

        VARIABLE Tviol_S0_CLK_S1_EQ_1 : X01 := '0';
        VARIABLE TD_S0_CLK_S1_EQ_1    : VitalTimingDataType;

        VARIABLE Tviol_ENPNeg_CLK     : X01 := '0';
        VARIABLE TD_ENPNeg_CLK        : VitalTimingDataType;

        VARIABLE Tviol_ENTNeg_CLK     : X01 := '0';
        VARIABLE TD_ENTNeg_CLK        : VitalTimingDataType;

        VARIABLE PD_CLK         : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_CLK      : X01 := '0';

        VARIABLE Violation      : X01 := '0';

        -- Functionality Results Variables
        VARIABLE COUNT    : unsigned(8 downto 0):= (OTHERS => 'X');
        ALIAS Q0_zd       : std_ulogic IS COUNT(0);
        ALIAS Q1_zd       : std_ulogic IS COUNT(1);
        ALIAS Q2_zd       : std_ulogic IS COUNT(2);
        ALIAS Q3_zd       : std_ulogic IS COUNT(3);
        ALIAS Q4_zd       : std_ulogic IS COUNT(4);
        ALIAS Q5_zd       : std_ulogic IS COUNT(5);
        ALIAS Q6_zd       : std_ulogic IS COUNT(6);
        ALIAS Q7_zd       : std_ulogic IS COUNT(7);
        VARIABLE RCONeg_zd  : std_ulogic := 'X'; 

        -- Output Glitch Detection Variables
        VARIABLE Q0_GlitchData   : VitalGlitchDataType;
        VARIABLE Q1_GlitchData   : VitalGlitchDataType;
        VARIABLE Q2_GlitchData   : VitalGlitchDataType;
        VARIABLE Q3_GlitchData   : VitalGlitchDataType;
        VARIABLE Q4_GlitchData   : VitalGlitchDataType;
        VARIABLE Q5_GlitchData   : VitalGlitchDataType;
        VARIABLE Q6_GlitchData   : VitalGlitchDataType;
        VARIABLE Q7_GlitchData   : VitalGlitchDataType;
        VARIABLE RCONeg_GlitchData : VitalGlitchDataType;

        -- No Weak Values Variables
        VARIABLE S0nwv : UX01 := 'X';
        VARIABLE S1nwv : UX01 := 'X';
        VARIABLE ENPNegnwv : UX01 := 'X';
        VARIABLE ENTNegnwv : UX01 := 'X';



    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------

        ------------------------------------------------------------------------
        -- Some versions of the '869 have setup times that vary for the select
        -- ports: S0 and S1.  The setup time of one port varies based on the 
        -- state of the other.  For this reason each of these ports has four
        -- generics and two timing checks associated with it.  The setup time
        -- checked will depend on whether the "CheckEnabled" condition is met.
        ------------------------------------------------------------------------

        S0nwv := To_UX01 (s => S0_ipd);
        S1nwv := To_UX01 (s => S1_ipd);
        ENPNegnwv := To_UX01 (s => ENPNeg_ipd);
        ENTNegnwv := To_UX01 (s => ENTNeg_ipd);

        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      =>  D0_ipd,
                TestSignalName  => "D0_ipd",
                RefSignal       =>  CLK_ipd,
                RefSignalName   =>  "CLK_ipd",
                SetupHigh       =>  tsetup_D0_CLK,
                SetupLow        =>  tsetup_D0_CLK,
                HoldHigh        =>  thold_D0_CLK,
                HoldLow         =>  thold_D0_CLK,
                CheckEnabled    =>  TRUE,
                RefTransition   =>  '/',
                HeaderMsg       =>  InstancePath & "/std869",
                TimingData      =>  TD_D0_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Tviol_D0_CLK );

            VitalSetupHoldCheck (
                TestSignal      =>  D1_ipd,
                TestSignalName  => "D1_ipd",
                RefSignal       =>  CLK_ipd,
                RefSignalName   =>  "CLK_ipd",
                SetupHigh       =>  tsetup_D0_CLK,
                SetupLow        =>  tsetup_D0_CLK,
                HoldHigh        =>  thold_D0_CLK,
                HoldLow         =>  thold_D0_CLK,
                CheckEnabled    =>  TRUE,
                RefTransition   =>  '/',
                HeaderMsg       =>  InstancePath & "/std869",
                TimingData      =>  TD_D1_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Tviol_D1_CLK );

            VitalSetupHoldCheck (
                TestSignal      =>  D2_ipd,
                TestSignalName  => "D2_ipd",
                RefSignal       =>  CLK_ipd,
                RefSignalName   =>  "CLK_ipd",
                SetupHigh       =>  tsetup_D0_CLK,
                SetupLow        =>  tsetup_D0_CLK,
                HoldHigh        =>  thold_D0_CLK,
                HoldLow         =>  thold_D0_CLK,
                CheckEnabled    =>  TRUE,
                RefTransition   =>  '/',
                HeaderMsg       =>  InstancePath & "/std869",
                TimingData      =>  TD_D2_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Tviol_D2_CLK );

            VitalSetupHoldCheck (
                TestSignal      =>  D3_ipd,
                TestSignalName  => "D3_ipd",
                RefSignal       =>  CLK_ipd,
                RefSignalName   =>  "CLK_ipd",
                SetupHigh       =>  tsetup_D0_CLK,
                SetupLow        =>  tsetup_D0_CLK,
                HoldHigh        =>  thold_D0_CLK,
                HoldLow         =>  thold_D0_CLK,
                CheckEnabled    =>  TRUE,
                RefTransition   =>  '/',
                HeaderMsg       =>  InstancePath & "/std869",
                TimingData      =>  TD_D3_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Tviol_D3_CLK );

            VitalSetupHoldCheck (
                TestSignal      =>  D4_ipd,
                TestSignalName  => "D4_ipd",
                RefSignal       =>  CLK_ipd,
                RefSignalName   =>  "CLK_ipd",
                SetupHigh       =>  tsetup_D0_CLK,
                SetupLow        =>  tsetup_D0_CLK,
                HoldHigh        =>  thold_D0_CLK,
                HoldLow         =>  thold_D0_CLK,
                CheckEnabled    =>  TRUE,
                RefTransition   =>  '/',
                HeaderMsg       =>  InstancePath & "/std869",
                TimingData      =>  TD_D4_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Tviol_D4_CLK );

            VitalSetupHoldCheck (
                TestSignal      =>  D5_ipd,
                TestSignalName  => "D5_ipd",
                RefSignal       =>  CLK_ipd,
                RefSignalName   =>  "CLK_ipd",
                SetupHigh       =>  tsetup_D0_CLK,
                SetupLow        =>  tsetup_D0_CLK,
                HoldHigh        =>  thold_D0_CLK,
                HoldLow         =>  thold_D0_CLK,
                CheckEnabled    =>  TRUE,
                RefTransition   =>  '/',
                HeaderMsg       =>  InstancePath & "/std869",
                TimingData      =>  TD_D5_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Tviol_D5_CLK );

            VitalSetupHoldCheck (
                TestSignal      =>  D6_ipd,
                TestSignalName  => "D6_ipd",
                RefSignal       =>  CLK_ipd,
                RefSignalName   =>  "CLK_ipd",
                SetupHigh       =>  tsetup_D0_CLK,
                SetupLow        =>  tsetup_D0_CLK,
                HoldHigh        =>  thold_D0_CLK,
                HoldLow         =>  thold_D0_CLK,
                CheckEnabled    =>  TRUE,
                RefTransition   =>  '/',
                HeaderMsg       =>  InstancePath & "/std869",
                TimingData      =>  TD_D6_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Tviol_D6_CLK );

            VitalSetupHoldCheck (
                TestSignal      =>  D7_ipd,
                TestSignalName  => "D7_ipd",
                RefSignal       =>  CLK_ipd,
                RefSignalName   =>  "CLK_ipd",
                SetupHigh       =>  tsetup_D0_CLK,
                SetupLow        =>  tsetup_D0_CLK,
                HoldHigh        =>  thold_D0_CLK,
                HoldLow         =>  thold_D0_CLK,
                CheckEnabled    =>  TRUE,
                RefTransition   =>  '/',
                HeaderMsg       =>  InstancePath & "/std869",
                TimingData      =>  TD_D7_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Tviol_D7_CLK );

            VitalSetupHoldCheck (
                TestSignal      =>  S1_ipd,
                TestSignalName  => "S1_ipd",
                RefSignal       =>  CLK_ipd,
                RefSignalName   =>  "CLK_ipd",
                SetupHigh       =>  tsetup_S1_CLK_S1_EQ_1_AN_S0_EQ_0,
                SetupLow        =>  tsetup_S1_CLK_S1_EQ_0_AN_S0_EQ_0,
                HoldHigh        =>  thold_S0_CLK,
                HoldLow         =>  thold_S0_CLK,
                CheckEnabled    =>  (S0nwv = '0'),
                RefTransition   =>  '/',
                HeaderMsg       =>  InstancePath & "/std869",
                TimingData      =>  TD_S1_CLK_S0_EQ_0,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Tviol_S1_CLK_S0_EQ_0 );

            VitalSetupHoldCheck (
                TestSignal      =>  S1_ipd,
                TestSignalName  => "S1_ipd",
                RefSignal       =>  CLK_ipd,
                RefSignalName   =>  "CLK_ipd",
                SetupHigh       =>  tsetup_S1_CLK_S1_EQ_1_AN_S0_EQ_1,
                SetupLow        =>  tsetup_S1_CLK_S1_EQ_0_AN_S0_EQ_1,
                HoldHigh        =>  thold_S0_CLK,
                HoldLow         =>  thold_S0_CLK,
                CheckEnabled    =>  (S0nwv = '1'),
                RefTransition   =>  '/',
                HeaderMsg       =>  InstancePath & "/std869",
                TimingData      =>  TD_S1_CLK_S0_EQ_1,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Tviol_S1_CLK_S0_EQ_1 );

            VitalSetupHoldCheck (
                TestSignal      =>  S0_ipd,
                TestSignalName  => "S0_ipd",
                RefSignal       =>  CLK_ipd,
                RefSignalName   =>  "CLK_ipd",
                SetupHigh       =>  tsetup_S0_CLK_S0_EQ_1_AN_S1_EQ_0,
                SetupLow        =>  tsetup_S0_CLK_S0_EQ_0_AN_S1_EQ_0,
                HoldHigh        =>  thold_S0_CLK,
                HoldLow         =>  thold_S0_CLK,
                CheckEnabled    =>  (S1nwv = '0'),
                RefTransition   =>  '/',
                HeaderMsg       =>  InstancePath & "/std869",
                TimingData      =>  TD_S0_CLK_S1_EQ_0,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Tviol_S0_CLK_S1_EQ_0 );

            VitalSetupHoldCheck (
                TestSignal      =>  S0_ipd,
                TestSignalName  => "S0_ipd",
                RefSignal       =>  CLK_ipd,
                RefSignalName   =>  "CLK_ipd",
                SetupHigh       =>  tsetup_S0_CLK_S0_EQ_1_AN_S1_EQ_1,
                SetupLow        =>  tsetup_S0_CLK_S0_EQ_0_AN_S1_EQ_1,
                HoldHigh        =>  thold_S0_CLK,
                HoldLow         =>  thold_S0_CLK,
                CheckEnabled    =>  (S1nwv = '1'),
                RefTransition   =>  '/',
                HeaderMsg       =>  InstancePath & "/std869",
                TimingData      =>  TD_S0_CLK_S1_EQ_1,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Tviol_S0_CLK_S1_EQ_1 );

            VitalSetupHoldCheck (
                TestSignal      =>  ENTNeg_ipd,
                TestSignalName  => "ENTNeg_ipd",
                RefSignal       =>  CLK_ipd,
                RefSignalName   =>  "CLK_ipd",
                SetupHigh       =>  tsetup_ENPNEg_CLK,
                SetupLow        =>  tsetup_ENPNeg_CLK,
                CheckEnabled    =>  TRUE,
                RefTransition   =>  '/',
                HeaderMsg       =>  InstancePath & "/std869",
                TimingData      =>  TD_ENTNeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Tviol_ENTNeg_CLK );

            VitalSetupHoldCheck (
                TestSignal      =>  ENPNeg_ipd,
                TestSignalName  => "ENPNeg_ipd",
                RefSignal       =>  CLK_ipd,
                RefSignalName   =>  "CLK_ipd",
                SetupHigh       =>  tsetup_ENPNeg_CLK,
                SetupLow        =>  tsetup_ENPNeg_CLK,
                CheckEnabled    =>  TRUE,
                RefTransition   =>  '/',
                HeaderMsg       =>  InstancePath & "/std869",
                TimingData      =>  TD_ENPNeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Tviol_ENPNeg_CLK );

            VitalPeriodPulseCheck (
                TestSignal      =>  CLK_ipd,
                TestSignalName  =>  "CLK_ipd",
                Period          =>  tperiod_CLK_posedge,
                PulseWidthHigh  =>  tpw_CLK_posedge,
                PulseWidthLow   =>  tpw_CLK_negedge,
                PeriodData      =>  PD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       =>  Pviol_CLK,
                HeaderMsg       =>  InstancePath & "/std869",
                CheckEnabled    =>  TRUE );

        END IF; -- Timing Check Section

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Pviol_CLK  OR Tviol_ENPNeg_CLK OR Tviol_ENTNeg_CLK OR 
                     Tviol_S0_CLK_S1_EQ_0 OR Tviol_S0_CLK_S1_EQ_1 OR
                     Tviol_S1_CLK_S0_EQ_0 OR Tviol_S1_CLK_S0_EQ_1 OR 
                     Tviol_D0_CLK OR Tviol_D1_CLK OR 
                     Tviol_D2_CLK OR Tviol_D3_CLK OR Tviol_D4_CLK OR 
                     Tviol_D5_CLK OR Tviol_D6_CLK OR Tviol_D7_CLK;

        ------------------------------------------------------------------------
        -- This model was written such that RCONeg goes high asynchronously
        -- when any of the control ports (S1, S0, ENTNeg, & ENPNeg) have  
        -- affecting events.  This may not be accurate for all versions of this
        -- part.  In the SN74ALS869, for instance, the ENPNeg does not control
        -- RCONeg asynchronously.  Since there is no way of knowing ahead of
        -- time what a manufacturer may decide to do, it seems reasonable that
        -- modeling all the control pins asynchronously is a good worst case
        -- approach.  The effect is that an asynchronously asserted control
        -- signal will shorten the RCONeg pulse.  Also, note that TI's data 
        -- sheet timing diagram is incorrect.  The second RCONeg pulse should go
        -- low on the rising edge of the clock because the synchronous outputs
        -- are the last event that occurs at the inputs to the RCONeg logic
        -- circuit.
        ------------------------------------------------------------------------

        IF (Violation = 'X')  THEN 
            COUNT := (OTHERS => 'X');
            RCONeg_zd := 'X';

        ELSIF (CLK_ipd = '0' AND CLK_ipd'EVENT) THEN
            NULL; -- Do nothing 

        -- Clear --
        ELSIF (S1nwv = '0' AND S0nwv = '0') THEN
            RCONeg_zd := '1';

            IF (CLK_ipd = '1' AND CLK_ipd'EVENT) THEN
                COUNT := (OTHERS => '0');
            END IF;

        -- Load data --
        ELSIF (S1nwv = '1' AND S0nwv = '0') THEN
            RCONeg_zd := '1';

            IF (CLK_ipd = '1' AND CLK_ipd'EVENT) THEN
                COUNT := ('0', D7_ipd, D6_ipd, D5_ipd, D4_ipd,
                               D3_ipd, D2_ipd, D1_ipd, D0_ipd);
--                COUNT := To_UX01 (s => COUNT);
            END IF;

        -- Disable (does not control clear or load) --
        ELSIF (ENPNegnwv = '1' OR ENTNegnwv = '1') THEN
            RCONeg_zd := '1';

        -- Count Up --
        ELSIF (S1nwv = '1' AND S0nwv = '1') THEN
            RCONeg_zd := '1';

            IF (CLK_ipd = '1' AND CLK_ipd'EVENT) THEN
                COUNT := ('0' & COUNT(7 downto 0)) + to_unsigned( 1,1);

                IF (COUNT(7 downto 0) = "11111111") THEN
                    RCONeg_zd := '0';
                END IF;
            END IF;

        -- Count down --
        ELSIF (S1nwv = '0' AND S0nwv = '1') THEN
            RCONeg_zd := '1';

            IF (CLK_ipd = '1' AND CLK_ipd'EVENT) THEN
                COUNT := ('0' & COUNT(7 downto 0)) - to_unsigned( 1,1);

                IF (COUNT(7 downto 0) = "00000000") THEN
                    RCONeg_zd := '0';
                END IF;
            END IF;
        END IF;

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => Q0,
            OutSignalName   => "Q0",
            OutTemp         => Q0_zd,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => TRUE)),
            GlitchData      => Q0_GlitchData 
        );

        VitalPathDelay01 (
            OutSignal       => Q1,
            OutSignalName   => "Q1",
            OutTemp         => Q1_zd,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => TRUE)),
            GlitchData        => Q1_GlitchData);

        VitalPathDelay01 (
            OutSignal       => Q2,
            OutSignalName   => "Q2",
            OutTemp         => Q2_zd,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => TRUE)),
            GlitchData        => Q2_GlitchData);

        VitalPathDelay01 (
            OutSignal       => Q3,
            OutSignalName   => "Q3",
            OutTemp         => Q3_zd,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => TRUE)),
            GlitchData        => Q3_GlitchData);

        VitalPathDelay01 (
            OutSignal       => Q4,
            OutSignalName   => "Q4",
            OutTemp         => Q4_zd,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => TRUE)),
            GlitchData        => Q4_GlitchData);

        VitalPathDelay01 (
            OutSignal       => Q5,
            OutSignalName   => "Q5",
            OutTemp         => Q5_zd,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => TRUE)),
            GlitchData        => Q5_GlitchData);

        VitalPathDelay01 (
            OutSignal       => Q6,
            OutSignalName   => "Q6",
            OutTemp         => Q6_zd,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => TRUE)),
            GlitchData        => Q6_GlitchData);

        VitalPathDelay01 (
            OutSignal       => Q7,
            OutSignalName   => "Q7",
            OutTemp         => Q7_zd,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_Q0,
                      PathCondition     => TRUE)),
            GlitchData        => Q7_GlitchData);

        VitalPathDelay01 (
            OutSignal       => RCONeg,
            OutSignalName   => "RCONeg",
            OutTemp         => RCONeg_zd,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_RCONeg,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => S0_ipd'LAST_EVENT,
                      PathDelay         => tpd_S0_RCONeg,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => S1_ipd'LAST_EVENT,
                      PathDelay         => tpd_S1_RCONeg,
                      PathCondition     => TRUE),
                3 => (InputChangeTime   => ENPNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_ENPNeg_RCONeg,
                      PathCondition     => TRUE),
                4 => (InputChangeTime   => ENTNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_ENTNeg_RCONeg,
                      PathCondition     => TRUE)),
            GlitchData        => RCONeg_GlitchData);

    END PROCESS;

END vhdl_behavioral;
