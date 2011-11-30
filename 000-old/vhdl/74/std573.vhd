--------------------------------------------------------------------------------
--  File Name: std573.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2000 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version | author  | mod date | changes made
--    V1.0  R. Munden  00 NOV 30  Initial release
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STND
--  Technology:  54/74XXXX
--  Part:        STD573
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
ENTITY std573 IS
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
        Q       : OUT   std_ulogic := 'U';
        D       : IN    std_ulogic := 'U';
        LE      : IN    std_ulogic := 'U';
        OENeg   : IN    std_ulogic := 'U'
    );

    ATTRIBUTE VITAL_LEVEL0 of std573 : ENTITY IS TRUE;
END std573;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std573 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL Q_ipd        : std_ulogic := 'U';
    SIGNAL D_ipd        : std_ulogic := 'U';
    SIGNAL LE_ipd       : std_ulogic := 'U';
    SIGNAL OENeg_ipd    : std_ulogic := 'U';

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
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (LE_ipd, D_ipd, OENeg_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_D_LE     : X01 := '0';
        VARIABLE TD_D_LE        : VitalTimingDataType;

        VARIABLE Pviol_LE       : X01 := '0';
        VARIABLE PD_LE          : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation      : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd           : std_ulogic;
        VARIABLE Qint           : std_ulogic;
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
                HeaderMsg       => InstancePath & "/std573",
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
                HeaderMsg       => InstancePath & "/std573",
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
            Result          => Qint,
            PreviousDataIn  => PrevData
        );
 
        Q_zd := VitalBUFIF0 (data => Qint, enable => OENeg_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       => Q,
            OutSignalName   => "Q",
            OutTemp         => Q_zd,
            GlitchData      => Q_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LE_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_LE_Q),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_Q,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => D_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_D_Q),
                      PathCondition     => LE_ipd = '1')
            )
        );
 
    END PROCESS;
 
END vhdl_behavioral;
