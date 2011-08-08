--------------------------------------------------------------------------------
--  File Name: std74.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997-2005 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   97 JUL 07   Conformed to style guide
--    V1.1     R. Steele   97 JUL 15   Fixed pulse checks
--    V1.2     R. Munden   97 OCT 15   Added CLRNeg_ipd, PRENeg_ipd to 
--                                     sensitivity list
--    V1.3     S. Gmitrovic 05 JUN 28  Added trecovery_PRENeg_CLK and
--                                     trecovery_CLRNeg_CLK generics and timing
--                                     checks for them, changed index
--                                     constraints in variable PrevData
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:     STND
--  Technology:  54/74XXXX
--  Part:        STD74
-- 
--  Description:  Positive-Edge Triggered Flip-Flop
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_timing.ALL;
                 USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;     USE FMF.gen_utils.ALL;
                 USE FMF.ff_package.ALL;
--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std74 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_D              : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLK            : VitalDelayType01 := VitalZeroDelay01;
        tipd_PRENeg         : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLRNeg         : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLK_Q           : VitalDelayType01 := UnitDelay01;
        tpd_PRENeg_Q        : VitalDelayType01 := UnitDelay01;
        tpd_CLRNeg_Q        : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_D_CLK        : VitalDelayType := UnitDelay;
        -- trecovery values: release times
        trecovery_PRENeg_CLK : VitalDelayType := UnitDelay;
        trecovery_CLRNeg_CLK : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_D_CLK         : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLK_posedge     : VitalDelayType := UnitDelay;
        tpw_CLK_negedge     : VitalDelayType := UnitDelay;
        tpw_PRENeg_negedge  : VitalDelayType := UnitDelay;
        tpw_CLRNeg_negedge  : VitalDelayType := UnitDelay;
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
        Q       : OUT   std_logic := 'U';
        QNeg    : OUT   std_logic := 'U';
        D       : IN    std_logic := 'X';
        CLK     : IN    std_logic := 'X';
        PRENeg  : IN    std_logic := 'X';
        CLRNeg  : IN    std_logic := 'X'
    );

    ATTRIBUTE VITAL_LEVEL0 of std74 : ENTITY IS TRUE;
END std74;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std74 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL Qint         : std_ulogic := 'X';
    SIGNAL D_ipd        : std_ulogic := 'X';
    SIGNAL CLK_ipd      : std_ulogic := 'X';
    SIGNAL PRENeg_ipd   : std_ulogic := 'X';
    SIGNAL CLRNeg_ipd   : std_ulogic := 'X';
    SIGNAL CLRint       : std_ulogic := 'X';
    SIGNAL PREint       : std_ulogic := 'X';

BEGIN
    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (D_ipd, D, tipd_D);
        w_2: VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_3: VitalWireDelay (PRENeg_ipd, PRENeg, tipd_PRENeg);
        w_4: VitalWireDelay (CLRNeg_ipd, CLRNeg, tipd_CLRNeg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent Procedures
    ----------------------------------------------------------------------------
    a_1: VitalINV (
            q            => QNeg, 
            a            => Qint
         );

    a_2: VitalBUF (
            q            => Q, 
            a            => Qint
         );

    a_3: VitalINV (
            q            => CLRint, 
            a            => CLRNeg_ipd
         );

    a_4: VitalINV (
            q            => PREint, 
            a            => PRENeg_ipd
         );

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CLK_ipd, D_ipd, CLRint, PREint, CLRNeg_ipd, 
                             PRENeg_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_D_CLK    : X01 := '0';
        VARIABLE TD_D_CLK       : VitalTimingDataType;
        
        VARIABLE Rviol_PRENeg_CLK    : X01 := '0';
        VARIABLE TD_PRENeg_CLK       : VitalTimingDataType;
        
        VARIABLE Rviol_CLRNeg_CLK    : X01 := '0';
        VARIABLE TD_CLRNeg_CLK       : VitalTimingDataType;
       
        VARIABLE Pviol_CLK      : X01 := '0';
        VARIABLE PD_CLK         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_CLRint   : X01 := '0';
        VARIABLE PD_CLRint      : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_PREint   : X01 := '0';
        VARIABLE PD_PREint      : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation      : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd           : std_ulogic;
        VARIABLE PrevData       : std_logic_vector(0 to 4);

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
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std74",
                TimingData      => TD_D_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_D_CLK
            );
            
            VitalRecoveryRemovalCheck (
                TestSignal      => PREint,
                TestSignalName  => "PREint",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                Recovery        => trecovery_PRENeg_CLK,
                ActiveLow       => FALSE,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std74",
                TimingData      => TD_PRENeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Rviol_PRENeg_CLK
            );

            VitalRecoveryRemovalCheck (
                TestSignal      => CLRint,
                TestSignalName  => "CLRint",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                Recovery        => trecovery_CLRNeg_CLK,
                ActiveLow       => FALSE,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std74",
                TimingData      => TD_CLRNeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Rviol_CLRNeg_CLK
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => CLK_ipd,
                TestSignalName  => "CLK_ipd",
                Period          => tperiod_CLK_posedge,
                PulseWidthHigh  => tpw_CLK_posedge,
                PulseWidthLow   => tpw_CLK_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std74",
                PeriodData      => PD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLK
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => CLRNeg_ipd,
                TestSignalName  => "CLRNeg_ipd",
                PulseWidthLow   => tpw_CLRNeg_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std74",
                PeriodData      => PD_CLRint,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLRint
            );
 
            VitalPeriodPulseCheck (
                TestSignal      => PRENeg_ipd,
                TestSignalName  => "PRENeg_ipd",
                PulseWidthLow   => tpw_PRENeg_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std74",
                PeriodData      => PD_PREint,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_PREint
            );
 
        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_D_CLK OR Rviol_PRENeg_CLK OR Rviol_CLRNeg_CLK OR
                     Pviol_CLK OR Pviol_CLRint OR Pviol_PREint;
 
        VitalStateTable (
            StateTable      => DFFSR_tab,
            DataIn          => (Violation, CLK_ipd, D_ipd, PREint, CLRint),
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
                      PathCondition     => ((CLRint = '0') AND (PREint = '0'))),
                1 => (InputChangeTime   => CLRint'LAST_EVENT,
                      PathDelay         => tpd_CLRNeg_Q,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => PREint'LAST_EVENT,
                      PathDelay         => tpd_PRENeg_Q,
                      PathCondition     => TRUE)
            )
        );
 
    END PROCESS;
 
END vhdl_behavioral;
