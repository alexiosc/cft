--------------------------------------------------------------------------------
--  File Name: std823.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1997, 2001 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0    R. Munden    97 JUN 03  Conformed to style guide
--    V1.1    R. Munden    01 MAR 24  Removed tpd_CLKENNeg generic & pathdelay
--                                    removed other extraneous generics
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: 54/74XXXX
--  Part:       STD823
-- 
--  Description: Bus Interface Flip-Flop with 3-State Output
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;
--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std823 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_CKENNeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLRNeg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg               : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLK                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_D                   : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLRNeg_Q             : VitalDelayType01  := UnitDelay01;
        tpd_OENeg_Q              : VitalDelayType01Z := UnitDelay01Z;
        tpd_CLK_Q                : VitalDelayType01  := UnitDelay01;
        -- tsetup values: setup times
        tsetup_D_CLK        : VitalDelayType := UnitDelay;
        tsetup_CKENNeg_CLK  : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_D_CLK         : VitalDelayType := UnitDelay;
        thold_CKENNeg_CLK   : VitalDelayType := UnitDelay;
        -- trecovery values: release times
        trecovery_CLRNeg_CLK : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLK_posedge     : VitalDelayType := UnitDelay;
        tpw_CLK_negedge     : VitalDelayType := UnitDelay;
        tpw_CLRNeg_negedge  : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        CKENNeg         : IN    std_ulogic := 'U';
        CLRNeg          : IN    std_ulogic := 'U';
        OENeg           : IN    std_ulogic := 'U';
        CLK             : IN    std_ulogic := 'U';
        D               : IN    std_ulogic := 'U';
        Q               : OUT   std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std823 : ENTITY IS TRUE;
END std823;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std823 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    SIGNAL CKENNeg_ipd         : std_ulogic := 'U';
    SIGNAL CLRNeg_ipd          : std_ulogic := 'U';
    SIGNAL OENeg_ipd           : std_ulogic := 'U';
    SIGNAL CLK_ipd             : std_ulogic := 'U';
    SIGNAL D_ipd               : std_ulogic := 'U';
    SIGNAL Qint                : std_ulogic := 'U';
    SIGNAL CLKint              : std_ulogic := 'U';
    SIGNAL CLKAint             : std_ulogic := 'U';
    SIGNAL CKENint             : std_ulogic := 'U';
    SIGNAL CKENNegint          : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (CKENNeg_ipd, CKENNeg, tipd_CKENNeg);
        w_2 : VitalWireDelay (CLRNeg_ipd, CLRNeg, tipd_CLRNeg);
        w_3 : VitalWireDelay (OENeg_ipd, OENeg, tipd_OENeg);
        w_4 : VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_5 : VitalWireDelay (D_ipd, D, tipd_D);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalBUFIF0 (
            q            => Q,
            data         => Qint,
            Enable       => OENeg_ipd,
            tpd_enable_q => tpd_OENeg_Q);

    a_2: VitalAND2 (
            q            => CLKint,
            a            => CLK_ipd,
            b            => CKENNegint
         );

    a_3: VitalAND2 (
            q            => CLKAint,
            a            => CLK_ipd,
            b            => CKENint
         );

    a_4: VitalNOR2 (
            q            => CKENNegint,
            a            => CKENNeg_ipd,
            b            => CLKAint
         );

    a_5: VitalOR2 (
            q            => CKENint,
            a            => CKENNeg_ipd,
            b            => CLKAint
         );

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (CLK_ipd, CKENNeg_ipd, D_ipd, CLRNeg_ipd, CLKint)

        -- Timing Check Variables
        VARIABLE Tviol_D_CLK         : X01 := '0';
        VARIABLE TD_D_CLK            : VitalTimingDataType;

        VARIABLE Tviol_CKENNeg_CLK   : X01 := '0';
        VARIABLE TD_CKENNeg_CLK      : VitalTimingDataType;

        VARIABLE Rviol_CLRNeg_CLK    : X01 := '0';
        VARIABLE TD_CLRNeg_CLK       : VitalTimingDataType;

        VARIABLE Pviol_CLK      : X01 := '0';
        VARIABLE PD_CLK         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_CLRNeg   : X01 := '0';
        VARIABLE PD_CLRNeg      : VitalPeriodDataType := VitalPeriodDataInit;

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
                TestSignalName  => "D",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_D_CLK,
                SetupLow        => tsetup_D_CLK,
                HoldHigh        => thold_D_CLK,
                HoldLow         => thold_D_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std823",
                TimingData      => TD_D_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_D_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => CKENNeg_ipd,
                TestSignalName  => "CKENNeg",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                SetupHigh       => tsetup_CKENNeg_CLK,
                SetupLow        => tsetup_CKENNeg_CLK,
                HoldHigh        => thold_CKENNeg_CLK,
                HoldLow         => thold_CKENNeg_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std823",
                TimingData      => TD_CKENNeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CKENNeg_CLK
            );

            VitalRecoveryRemovalCheck (
                TestSignal      => CLRNeg_ipd,
                TestSignalName  => "CLRNeg",
                RefSignal       => CLKint,
                RefSignalName   => "CLKint",
                Recovery        => trecovery_CLRNeg_CLK,
                ActiveLow       => TRUE,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std823",
                TimingData      => TD_CLRNeg_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Rviol_CLRNeg_CLK
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLK_ipd,
                TestSignalName  => "CLK",
                PulseWidthHigh  => tpw_CLK_posedge,
                PulseWidthLow   => tpw_CLK_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std823",
                PeriodData      => PD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLK
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLRNeg_ipd,
                TestSignalName  => "CLRNeg",
                PulseWidthLow   => tpw_CLRNeg_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std823",
                PeriodData      => PD_CLRNeg,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLRNeg
            );

        END IF;
 
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_D_CLK OR Pviol_CLK OR Tviol_CKENNeg_CLK OR
                     Pviol_CLK OR Pviol_CLRNeg;

        VitalStateTable (                      
            StateTable      => DFFRN_tab,
            DataIn          => (Violation, CLKint, D_ipd, CLRNeg_ipd),
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
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => CLRNeg_ipd'LAST_EVENT, 
                      PathDelay         => tpd_CLRNeg_Q,
                      PathCondition     => TRUE)) 
            );

    END PROCESS;

END vhdl_behavioral;
