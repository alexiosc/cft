--------------------------------------------------------------------------------
--  File Name: std544.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997, 1988 Free Model Foundry; http://www.FreeModelFoundry.com
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--  MODIFICATION HISTORY:
--
--  version: |  author:  | mod date: | changes made:
--    V1.0    R. Munden    97 NOV 05  Conformed to style guide
--    V1.1    R. Munden    98 SEP 11  Added seperate timing for CEAB and CEBA
--
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
--
--  Library:    STD
--  Technology: 54/74XXXX
--  Part:       STD544
--
--  Desciption: Inverting Latched Transceiver
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
ENTITY std544 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_B                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEBANeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_CEBANeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_LEBANeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEABNeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_CEABNeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_LEABNeg             : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_B                  : VitalDelayType01 := UnitDelay01;
        tpd_B_A                  : VitalDelayType01 := UnitDelay01;
        tpd_LEABNeg_B            : VitalDelayType01 := UnitDelay01;
        tpd_LEBANeg_A            : VitalDelayType01 := UnitDelay01;
        tpd_OEABNeg_B            : VitalDelayType01Z:= UnitDelay01Z;
        tpd_OEBANeg_A            : VitalDelayType01Z:= UnitDelay01Z;
        tpd_CEABNeg_B            : VitalDelayType01Z:= UnitDelay01Z;
        tpd_CEBANeg_A            : VitalDelayType01Z:= UnitDelay01Z;
        -- tsetup values: setup times
        tsetup_A_LEABNeg         : VitalDelayType := UnitDelay;
        tsetup_B_LEBANeg         : VitalDelayType := UnitDelay;
        tsetup_A_CEABNeg         : VitalDelayType := UnitDelay;
        tsetup_B_CEBANeg         : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_A_LEABNeg          : VitalDelayType := UnitDelay;
        thold_B_LEBANeg          : VitalDelayType := UnitDelay;
        thold_A_CEABNeg          : VitalDelayType := UnitDelay;
        thold_B_CEBANeg          : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_LEBANeg_negedge      : VitalDelayType := UnitDelay;
        tpw_LEABNeg_negedge      : VitalDelayType := UnitDelay;
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
        CEBANeg          : IN    std_logic := 'U';
        LEBANeg          : IN    std_logic := 'U';
        OEABNeg          : IN    std_logic := 'U';
        CEABNeg          : IN    std_logic := 'U';
        LEABNeg          : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std544 : ENTITY IS TRUE;
END std544;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std544 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;
 
    SIGNAL A_ipd               : std_ulogic := 'X';
    SIGNAL B_ipd               : std_ulogic := 'X';
    SIGNAL OEBANeg_ipd         : std_ulogic := 'X';
    SIGNAL CEBANeg_ipd         : std_ulogic := 'X';
    SIGNAL LEBANeg_ipd         : std_ulogic := 'X';
    SIGNAL OEABNeg_ipd         : std_ulogic := 'X';
    SIGNAL CEABNeg_ipd         : std_ulogic := 'X';
    SIGNAL LEABNeg_ipd         : std_ulogic := 'X';
    SIGNAL LEAint              : std_ulogic := 'X';
    SIGNAL LEBint              : std_ulogic := 'X';

BEGIN
 
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN
 
        w_1 : VitalWireDelay (A_ipd, A, tipd_A);
        w_2 : VitalWireDelay (B_ipd, B, tipd_B);
        w_3 : VitalWireDelay (OEBANeg_ipd, OEBANeg, tipd_OEBANeg);
        w_4 : VitalWireDelay (CEBANeg_ipd, CEBANeg, tipd_CEBANeg);
        w_5 : VitalWireDelay (LEBANeg_ipd, LEBANeg, tipd_LEBANeg);
        w_6 : VitalWireDelay (OEABNeg_ipd, OEABNeg, tipd_OEABNeg);
        w_7 : VitalWireDelay (CEABNeg_ipd, CEABNeg, tipd_CEABNeg);
        w_8 : VitalWireDelay (LEABNeg_ipd, LEABNeg, tipd_LEABNeg);

    END BLOCK;
 
    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalOR2 (
            q            => LEBint,
            a            => LEBANeg_ipd,
            b            => CEBANeg_ipd
         );

    a_2: VitalOR2 (
            q            => LEAint,
            a            => LEABNeg_ipd,
            b            => CEABNeg_ipd
         );

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior1 : PROCESS (LEAint, LEABNeg_ipd, CEABNeg_ipd, OEABNeg_ipd, 
                              A_ipd)
 
        -- Timing Check Variables
        VARIABLE Tviol_A_LEA        : X01 := '0';
        VARIABLE TD_A_LEA           : VitalTimingDataType;
 
        VARIABLE Tviol_A_CEA        : X01 := '0';
        VARIABLE TD_A_CEA           : VitalTimingDataType;
 
        VARIABLE Pviol_LEA          : X01 := '0';
        VARIABLE PD_LEA             : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_CEA          : X01 := '0';
        VARIABLE PD_CEA             : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation          : X01 := '0';

        -- Functionality Results Variables
        VARIABLE B_zd               : std_ulogic;
        VARIABLE PrevData           : std_logic_vector(0 to 2);

        VARIABLE OEBint             : std_ulogic;
        VARIABLE Bint               : std_ulogic;

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
                RefSignal       => LEABNeg_ipd,
                RefSignalName   => "LEABNeg",
                SetupHigh       => tsetup_A_LEABNeg,
                SetupLow        => tsetup_A_LEABNeg,
                HoldHigh        => thold_A_LEABNeg,
                HoldLow         => thold_A_LEABNeg,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std544",
                TimingData      => TD_A_LEA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_LEA
            );

            VitalSetupHoldCheck (
                TestSignal      => A_ipd,
                TestSignalName  => "A_ipd",
                RefSignal       => CEABNeg_ipd,
                RefSignalName   => "CEABNeg",
                SetupHigh       => tsetup_A_CEABNeg,
                SetupLow        => tsetup_A_CEABNeg,
                HoldHigh        => thold_A_CEABNeg,
                HoldLow         => thold_A_CEABNeg,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std544",
                TimingData      => TD_A_CEA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_CEA
            );

            VitalPeriodPulseCheck (
                TestSignal      => LEAint,
                TestSignalName  => "LEAint",
                PulseWidthHigh  => tpw_LEABNeg_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std544",
                PeriodData      => PD_LEA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LEA
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_A_LEA OR Pviol_LEA OR Tviol_A_CEA;
 
        VitalStateTable (
            StateTable      => LATQN_tab,
            DataIn          => (Violation, LEAint, A_ipd),
            Result          => Bint,
            PreviousDataIn  => PrevData
        );
 
        OEBint := VitalNOR2(
            a            => OEABNeg_ipd,
            b            => CEABNeg_ipd
         );
  
        B_zd := VitalBUFIF1 (
            Data         => Bint,
            Enable       => OEBint
         );

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
                0 => (InputChangeTime   => LEABNeg_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_LEABNeg_B),
                      PathCondition     => CEABNeg_ipd = '0'),
                1 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_B),
                      PathCondition     => LEAint = '1'),
                2 => (InputChangeTime   => CEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CEABNeg_B,
                      PathCondition     => OEABNeg_ipd = '0'),
                3 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B,
                      PathCondition     => CEABNeg_ipd = '0')
            )
        );
 
    END PROCESS; 

    VitalBehavior2 : PROCESS (LEBint, LEBANeg_ipd, CEABNeg_ipd, OEBANeg_ipd,
                              B_ipd)
 
        -- Timing Check Variables
        VARIABLE Tviol_B_LEB        : X01 := '0';
        VARIABLE TD_B_LEB           : VitalTimingDataType;
 
        VARIABLE Tviol_B_CEB        : X01 := '0';
        VARIABLE TD_B_CEB           : VitalTimingDataType;
 
        VARIABLE Pviol_LEB          : X01 := '0';
        VARIABLE PD_LEB             : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation          : X01 := '0';

        -- Functionality Results Variables
        VARIABLE A_zd               : std_ulogic;
        VARIABLE PrevData           : std_logic_vector(0 to 2);

        VARIABLE Aint               : std_ulogic;
        VARIABLE OEAint             : std_ulogic;

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
                RefSignal       => LEBANeg_ipd,
                RefSignalName   => "LEBANeg",
                SetupHigh       => tsetup_B_LEBANeg,
                SetupLow        => tsetup_B_LEBANeg,
                HoldHigh        => thold_B_LEBANeg,
                HoldLow         => thold_B_LEBANeg,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std544",
                TimingData      => TD_B_LEB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_LEB
            );

            VitalSetupHoldCheck (
                TestSignal      => B_ipd,
                TestSignalName  => "B_ipd",
                RefSignal       => CEBANeg_ipd,
                RefSignalName   => "CEBANeg",
                SetupHigh       => tsetup_B_CEBANeg,
                SetupLow        => tsetup_B_CEBANeg,
                HoldHigh        => thold_B_CEBANeg,
                HoldLow         => thold_B_CEBANeg,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std544",
                TimingData      => TD_B_CEB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_CEB
            );

            VitalPeriodPulseCheck (
                TestSignal      => LEBint,
                TestSignalName  => "LEBint",
                PulseWidthHigh  => tpw_LEBANeg_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std544",
                PeriodData      => PD_LEB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LEB
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_B_LEB OR Pviol_LEB OR Tviol_B_CEB;
 
        VitalStateTable (
            StateTable      => LATQN_tab,
            DataIn          => (Violation, LEBint, B_ipd),
            Result          => Aint,
            PreviousDataIn  => PrevData
        );
 
        OEAint := VitalNOR2(
            a            => OEBANeg_ipd,
            b            => CEBANeg_ipd
         );
  
        A_zd := VitalBUFIF1 (
            Data         => Aint,
            Enable       => OEAint
         );

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
                0 => (InputChangeTime   => LEBANeg_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_LEBANeg_A),
                      PathCondition     => CEBANeg_ipd = '0'),
                1 => (InputChangeTime   => B_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_B_A),
                      PathCondition     => LEBint = '1'),
                2 => (InputChangeTime   => CEBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CEABNeg_B,
                      PathCondition     => OEBANeg_ipd = '0'),
                3 => (InputChangeTime   => OEBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEBANeg_A,
                      PathCondition     => CEBANeg_ipd = '0')
            )
        );
 
    END PROCESS;

END vhdl_behavioral;
