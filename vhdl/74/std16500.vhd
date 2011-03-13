--------------------------------------------------------------------------------
--  File Name: std16500.vhd
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
--    V1.0    R. Munden    97 NOV 09  Conformed to style guide
--
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
--
--  Library:    STND
--  Technology: 54/74XXXX
--  Part:       STD16500
--
--  Desciption: Universal Bus Transceiver
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
ENTITY std16500 IS
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
    ATTRIBUTE VITAL_LEVEL0 of std16500 : ENTITY IS TRUE;
END std16500;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std16500 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;
 
    SIGNAL A_ipd               : std_ulogic := 'X';
    SIGNAL B_ipd               : std_ulogic := 'X';
    SIGNAL OEBANeg_ipd         : std_ulogic := 'X';
    SIGNAL CLKBANeg_ipd        : std_ulogic := 'X';
    SIGNAL LEBA_ipd            : std_ulogic := 'X';
    SIGNAL OEAB_ipd            : std_ulogic := 'X';
    SIGNAL CLKABNeg_ipd        : std_ulogic := 'X';
    SIGNAL LEAB_ipd            : std_ulogic := 'X';
    SIGNAL Aint                : std_ulogic := 'X';
    SIGNAL Bint                : std_ulogic := 'X';

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
    a_1: VitalBUFIF0 (
            q            => A,
            data         => Aint,
            Enable       => OEBANeg_ipd,
            tpd_enable_q => tpd_OEAB_B);

    a_2: VitalBUFIF1 (
            q            => B,
            data         => Bint,
            Enable       => OEAB_ipd,
            tpd_enable_q => tpd_OEAB_B);

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior1 : PROCESS (CLKABNeg_ipd, LEAB_ipd, A_ipd)
 
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
                TestSignal      => A_ipd,
                TestSignalName  => "A_ipd",
                RefSignal       => CLKABNeg_ipd,
                RefSignalName   => "CLKABNeg_ipd",
                SetupHigh       => tsetup_A_CLKABNeg,
                SetupLow        => tsetup_A_CLKABNeg,
                HoldHigh        => thold_A_CLKABNeg,
                HoldLow         => thold_A_CLKABNeg,
                CheckEnabled    => LEAB = '0',
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/std16500",
                TimingData      => TD_A_CLKABNeg,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_CLKABNeg
            );

            VitalSetupHoldCheck (
                TestSignal      => A_ipd,
                TestSignalName  => "A_ipd",
                RefSignal       => LEAB_ipd,
                RefSignalName   => "LEAB_ipd",
                SetupHigh       => tsetup_A_LEAB_CLKABNeg_EQ_1,
                SetupLow        => tsetup_A_LEAB_CLKABNeg_EQ_0,
                HoldHigh        => thold_B_LEAB,
                HoldLow         => thold_B_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/std16500",
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
                HeaderMsg       => InstancePath & "/std16500",
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
                HeaderMsg       => InstancePath & "/std16500",
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
            DataIn          => (Violation, LEAB_ipd, CLKABNeg_ipd, A_ipd),
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
                1 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_B,
                      PathCondition     => LEAB_ipd = '1'),
                2 => (InputChangeTime   => CLKABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLKABNeg_B,
                      PathCondition     => LEAB_ipd = '0')
            )
        );
 
    END PROCESS; 

    VitalBehavior2 : PROCESS (CLKBANeg_ipd, LEBA_ipd, B_ipd)
 
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
                TestSignal      => B_ipd,
                TestSignalName  => "B_ipd",
                RefSignal       => CLKBANeg_ipd,
                RefSignalName   => "CLKBANeg_ipd",
                SetupHigh       => tsetup_A_CLKABNeg,
                SetupLow        => tsetup_A_CLKABNeg,
                HoldHigh        => thold_A_CLKABNeg,
                HoldLow         => thold_A_CLKABNeg,
                CheckEnabled    => LEBA = '0',
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/std16500",
                TimingData      => TD_B_CLKBANeg,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_CLKBANeg
            );

            VitalSetupHoldCheck (
                TestSignal      => B_ipd,
                TestSignalName  => "B_ipd",
                RefSignal       => LEBA_ipd,
                RefSignalName   => "LEBA_ipd",
                SetupHigh       => tsetup_A_LEAB_CLKABNeg_EQ_1,
                SetupLow        => tsetup_A_LEAB_CLKABNeg_EQ_0,
                HoldHigh        => thold_B_LEAB,
                HoldLow         => thold_B_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '\',
                HeaderMsg       => InstancePath & "/std16500",
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
                HeaderMsg       => InstancePath & "/std16500",
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
                HeaderMsg       => InstancePath & "/std16500",
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
            DataIn          => (Violation, LEBA_ipd, CLKBANeg_ipd, B_ipd),
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
                1 => (InputChangeTime   => B_ipd'LAST_EVENT,
                      PathDelay         => tpd_A_B,
                      PathCondition     => LEBA_ipd = '1'),
                2 => (InputChangeTime   => CLKBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLKABNeg_B,
                      PathCondition     => LEBA_ipd = '0')
            )
        );
 
    END PROCESS; 

END vhdl_behavioral;
