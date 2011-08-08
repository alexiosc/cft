--------------------------------------------------------------------------------
--  File Name: std379.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1999 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0    R. Munden    99 DEC 29  Initial release
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD379
-- 
--  Desciption:  D Flip-Flop with Clock Enable and Complimentary Output
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;
                 USE FMF.ff_package.ALL;
--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std379 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_D              : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLK            : VitalDelayType01 := VitalZeroDelay01;
        tipd_CKENeg         : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLK_Q           : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_D_CLK        : VitalDelayType := UnitDelay;
        tsetup_CKENeg_CLK   : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_D_CLK         : VitalDelayType := UnitDelay;
        thold_CKENeg_CLK    : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLK_posedge     : VitalDelayType := UnitDelay;
        tpw_CLK_negedge     : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLK_posedge : VitalDelayType := UnitDelay;
        -- generic control parameters
        TimingChecksOn      : Boolean  := DefaultTimingChecks;
        MsgOn               : Boolean  := DefaultMsgOn;
        XOn                 : Boolean  := DefaultXOn;
        InstancePath        : STRING   := DefaultInstancePath;
        -- For FMF SDF techonology file usage
        TimingModel         : STRING   := DefaultTimingModel
    );
    PORT (
        Q       : OUT   std_logic := 'U';
        QNeg    : OUT   std_logic := 'U';
        D       : IN    std_logic := 'U';
        CLK     : IN    std_logic := 'U';
        CKENeg  : IN    std_logic := 'U'
    );

    ATTRIBUTE VITAL_LEVEL0 of std379 : ENTITY IS TRUE;
END std379;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std379 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL Qint         : std_ulogic := 'U';
    SIGNAL D_ipd        : std_ulogic := 'U';
    SIGNAL CLK_ipd      : std_ulogic := 'U';
    SIGNAL CKENeg_ipd   : std_ulogic := 'U';

BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (D_ipd, D, tipd_D);
        w_2: VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_3: VitalWireDelay (CKENeg_ipd, CKENeg, tipd_CKENeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent Procedures
    ----------------------------------------------------------------------------

    a_1: VitalBUF (
            q            => Q, 
            a            => Qint
         );
    a_2: VitalINV (
            q            => QNeg, 
            a            => Qint
         );

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CLK_ipd, D_ipd, CKENeg_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_D_CLK    : X01 := '0';
        VARIABLE TD_D_CLK       : VitalTimingDataType;

        VARIABLE Tviol_CKENeg_CLK    : X01 := '0';
        VARIABLE TD_CKENeg_CLK       : VitalTimingDataType;

        VARIABLE Pviol_CLK      : X01 := '0';
        VARIABLE PD_CLK         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation      : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd           : std_ulogic;
        VARIABLE PrevData       : std_logic_vector(0 to 3);

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
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_D_CLK,
                SetupLow        => tsetup_D_CLK,
                HoldHigh        => thold_D_CLK,
                HoldLow         => thold_D_CLK,
                CheckEnabled    => (CKENeg_ipd = '0'),
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std379",
                TimingData      => TD_D_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_D_CLK
            );
 
            VitalSetupHoldCheck (
                TestSignal      => CKENeg_ipd,
                TestSignalName  => "CKENeg",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_CKENeg_CLK,
                SetupLow        => tsetup_CKENeg_CLK,
                HoldHigh        => thold_CKENeg_CLK,
                HoldLow         => thold_CKENeg_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std379",
                TimingData      => TD_CKENeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CKENeg_CLK
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => CLK_ipd,
                TestSignalName  => "CLK_ipd",
                Period          => tperiod_CLK_posedge,
                PulseWidthHigh  => tpw_CLK_posedge,
                PulseWidthLow   => tpw_CLK_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std379",
                PeriodData      => PD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLK
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_D_CLK OR Pviol_CLK OR Tviol_CKENeg_CLK;
 
        VitalStateTable (
            StateTable      => DFFCEN_tab,
            DataIn          => (Violation, CKENeg_ipd, CLK_ipd, D_ipd),
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
                      PathCondition     => (CKENeg_ipd = '0') OR
                                           (CKENeg_ipd = 'L'))
            )
        );
 
    END PROCESS;
 
END vhdl_behavioral;
