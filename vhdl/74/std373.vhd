--------------------------------------------------------------------------------
--  File Name: std373.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997-2008 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version | author  | mod date | changes made
--    V1.0  R. Munden  97 JUN 16  Conformed to style guide
--    V1.1  R. Munden  08 AUG 25  Changed PrevData range to eliminate MS warning
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD373
-- 
--  Desciption:  Transparent Latch
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;
                 USE FMF.ff_package.ALL;
--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std373 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_D              : VitalDelayType01 := VitalZeroDelay01;
        tipd_LE             : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg          : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_D_Q             : VitalDelayType01 := UnitDelay01;
        tpd_LE_Q            : VitalDelayType01 := UnitDelay01;
        tpd_OENeg_Q         : VitalDelayType01Z := UnitDelay01Z;
        -- tsetup values: setup times
        tsetup_D_LE         : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_D_LE          : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_LE_posedge      : VitalDelayType := UnitDelay;
        tpw_LE_negedge      : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_LE_posedge  : VitalDelayType := UnitDelay;
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
        LE      : IN    std_logic := 'X';
        OENeg   : IN    std_logic := 'X'
    );

    ATTRIBUTE VITAL_LEVEL0 of std373 : ENTITY IS TRUE;
END std373;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std373 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL Q_ipd        : std_ulogic := 'X';
    SIGNAL Qint         : std_ulogic := 'X';
    SIGNAL D_ipd        : std_ulogic := 'X';
    SIGNAL LE_ipd       : std_ulogic := 'X';
    SIGNAL OENeg_ipd    : std_ulogic := 'X';

BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (D_ipd, D, tipd_D);
        w_2: VitalWireDelay (LE_ipd, LE, tipd_LE);
        w_3: VitalWireDelay (OENeg_ipd, OENeg, tipd_OENeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent Procedures
    ----------------------------------------------------------------------------
    a_1: VitalBUFIF0 (
            q            => Q, 
            data         => Qint, 
            Enable       => OENeg_ipd, 
            tpd_enable_q => tpd_OENeg_Q);

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (LE_ipd, D_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_D_LE     : X01 := '0';
        VARIABLE TD_D_LE        : VitalTimingDataType;

        VARIABLE Pviol_LE       : X01 := '0';
        VARIABLE PD_LE          : VitalPeriodDataType := VitalPeriodDataInit;

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
                TestSignal      => D_ipd,
                TestSignalName  => "D_ipd",
                RefSignal       => LE_ipd,
                RefSignalName   => "LE_ipd",
                SetupHigh       => tsetup_D_LE,
                SetupLow        => tsetup_D_LE,
                HoldHigh        => thold_D_LE,
                HoldLow         => thold_D_LE,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std373",
                TimingData      => TD_D_LE,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_D_LE
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => LE_ipd,
                TestSignalName  => "LE_ipd",
                Period          => tperiod_LE_posedge,
                PulseWidthHigh  => tpw_LE_posedge,
                PulseWidthLow   => tpw_LE_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std373",
                PeriodData      => PD_LE,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LE
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_D_LE OR Pviol_LE;
 
        VitalStateTable (
            StateTable      => LATN_tab,
            DataIn          => (Violation, LE_ipd, D_ipd),
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
                0 => (InputChangeTime   => LE_ipd'LAST_EVENT,
                      PathDelay         => tpd_LE_Q,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => D_ipd'LAST_EVENT,
                      PathDelay         => tpd_D_Q,
                      PathCondition     => LE_ipd = '1')
            )
        );
 
    END PROCESS;
 
END vhdl_behavioral;
