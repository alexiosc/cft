--------------------------------------------------------------------------------
--  File Name: stdh16836.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2001 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version:  |     author:        | mod date: | changes made:
--     V1.0    S.Randjic,D.Djokovic  01 OCT 10   Initial release 
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STNDH
--  Technology: 74XXXX
--  Part:       stdh16836
-- 
--  Description: 20-BIT UNIVERSAL BUS DRIVER WITH 3-STATE OUTPUTS AND BUS-HOLD
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stdh16836 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_CLK                : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_LENeg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                  : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_Y                 : VitalDelayType01 := UnitDelay01;
        tpd_LENeg_Y             : VitalDelayType01 := UnitDelay01;
        tpd_CLK_Y               : VitalDelayType01 := UnitDelay01;
        tpd_OENeg_Y             : VitalDelayType01Z:= UnitDelay01Z;
        -- tsetup values: setup times
        tsetup_A_CLK            : VitalDelayType := UnitDelay;   --tSU
        tsetup_A_LENeg_CLK_EQ_1 : VitalDelayType := UnitDelay;   --tSU, 
                                                                  --CLK-HIGH
        tsetup_A_LENeg_CLK_EQ_0 : VitalDelayType := UnitDelay;   --tSU, CLK-LOW 
        -- thold values: hold times
        thold_A_CLK             : VitalDelayType := UnitDelay;   --tSU
        thold_A_LENeg           : VitalDelayType := UnitDelay;   --tSU, 
                                                          --CLK-HIGH and CLK-LOW
        -- tpw values: pulse widths
        tpw_LENeg_negedge       : VitalDelayType := UnitDelay;    --tW Low
        tpw_CLK_posedge         : VitalDelayType := UnitDelay;    --tW(H),
                                                                   --tW(L)
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLK_posedge     : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath            : STRING    := DefaultInstancePath;
        TimingChecksOn          : BOOLEAN   := DefaultTimingChecks;
        MsgOn                   : BOOLEAN   := DefaultMsgOn;
        XOn                     : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel             : STRING    := DefaultTimingModel
    );
    PORT (
        A              : IN std_ulogic := 'U';
        OENeg          : IN std_ulogic := 'U';
        CLK            : IN std_ulogic := 'U';
        LENeg          : IN std_ulogic := 'U';
        Y              : OUT std_ulogic := 'U'
    );

    ATTRIBUTE VITAL_LEVEL0 of stdh16836 : ENTITY IS TRUE;
END stdh16836;
--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdh16836 IS
    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    CONSTANT partID           : STRING := "stdh16836";

    SIGNAL OENeg_ipd          : std_ulogic := 'X';
    SIGNAL CLK_ipd            : std_ulogic := 'X';
    SIGNAL LENeg_ipd          : std_ulogic := 'X';
    SIGNAL A_ipd              : std_ulogic := 'X';
    SIGNAL Abh                : std_logic  := 'X';
    SIGNAL AbhNeg             : std_logic  := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (OENeg_ipd, OENeg, tipd_OENeg);
        w_2 : VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_3 : VitalWireDelay (LENeg_ipd, LENeg, tipd_LENeg);
        w_4 : VitalWireDelay (A_ipd, A, tipd_A);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalBUF (q => Abh, a => A_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_2: VitalINV (q => AbhNeg, a => Abh);
    a_3: VitalINV (q => Abh, a => AbhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    ----------------------------------------------------------------------------
    -- Behavior Process 
    ----------------------------------------------------------------------------
    VitalBehavior : PROCESS (OENeg_IPD, CLK_ipd, LENeg_ipd, Abh)

        -- Timing Check Variables
        VARIABLE Tviol_A_CLK      : X01 := '0';
        VARIABLE TD_A_CLK         : VitalTimingDataType;

        VARIABLE Tviol_A_LENeg_CLKhigh      : X01 :='0';
        VARIABLE TD_A_LENeg_CLKhigh         : VitalTimingDataType;

        VARIABLE Tviol_A_LENeg_CLKlow       : X01 :='0';
        VARIABLE TD_A_LENeg_CLKlow          : VitalTimingDataType;

        VARIABLE PD_CLK          : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_CLK       : X01 := '0';

        VARIABLE PD_LENeg        : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_LENeg     : X01 := '0';

        VARIABLE Violation       : X01 := '0';

        -- Functionality Results Variables 
        VARIABLE Y_zd     : std_ulogic;

        VARIABLE LENeg_inv : std_ulogic;

        -- Temporary Variables for tri state out
        VARIABLE QA_int    : std_ulogic := 'U';

        -- Prevdata for LATNDFF tab
        VARIABLE PrevData1         : std_logic_vector(0 to 3);

        -- Output Glitch Detection Variables
        VARIABLE Y_GlitchData     : VitalGlitchDataType;

        -- No Weak Values Variables
        VARIABLE CLK_nwv       : UX01 := 'X';
        VARIABLE OENeg_nwv     : UX01 := 'X';
        VARIABLE LENeg_nwv     : UX01 := 'X';

   BEGIN

        CLK_nwv      := To_UX01 (s => CLK_ipd);
        OENeg_nwv    := To_UX01 (s => OENeg_ipd);
        LENeg_nwv    := To_UX01 (s => LENeg_ipd);

        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------

        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => Abh,
                TestSignalName  => "Abh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A_CLK,
                SetupLow        => tsetup_A_CLK,
                HoldHigh        => thold_A_CLK,
                HoldLow         => thold_A_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_A_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => Abh,
                TestSignalName  => "Abh",
                RefSignal       => LENeg_ipd,
                RefSignalName   => "LENeg_ipd",
                SetupHigh       => tsetup_A_LENeg_CLK_EQ_1,
                SetupLow        => tsetup_A_LENeg_CLK_EQ_1,
                HoldHigh        => thold_A_LENeg,
                HoldLow         => thold_A_LENeg,
                CheckEnabled    => CLK_nwv = '1',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_A_LENeg_CLKHigh,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_LENeg_CLKHigh
            );

            VitalSetupHoldCheck (
                TestSignal      => Abh,
                TestSignalName  => "Abh",
                RefSignal       => LENeg_ipd,
                RefSignalName   => "LENeg_ipd",
                SetupHigh       => tsetup_A_LENeg_CLK_EQ_0,
                SetupLow        => tsetup_A_LENeg_CLK_EQ_0,
                HoldHigh        => thold_A_LENeg,
                HoldLow         => thold_A_LENeg,
                CheckEnabled    => CLK_nwv = '0' ,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & partID,
                TimingData      => TD_A_LENeg_CLKLow,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_LENeg_CLKLow
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLK_ipd,
                TestSignalName  => "CLK_ipd",
                Period          => tperiod_CLK_posedge,
                PulseWidthHigh  => tpw_CLK_posedge,
                PulseWidthlow   => tpw_CLK_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & partID,
                PeriodData      => PD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLK
            );

            VitalPeriodPulseCheck (
                TestSignal      => LENeg_ipd,
                TestSignalName  => "LENeg_ipd",
                PulseWidthlow   => tpw_LENeg_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & partID,
                PeriodData      => PD_LENeg,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LENeg
            );

        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_A_CLK   OR 
             Tviol_A_LENeg_CLKHigh OR  
             Tviol_A_LENeg_CLKLow  OR
             Pviol_LENeg OR 
             Pviol_CLK;
 
        LENeg_inv := VitalINV (Data => LENeg_ipd);

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LENeg_inv, CLK_ipd, Abh),
            Result          => QA_int,       
            PreviousDataIn  => PrevData1
        );
        Y_zd := VitalBUFIF0 (data => QA_int,
                              enable => OENeg_ipd);

        -----------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------

        VitalPathDelay01Z (
            OutSignal       => Y,
            OutSignalName   => "Y",
            OutTemp         => Y_zd,
            GlitchData      => Y_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_CLK_Y),
                      PathCondition     => (OENeg_nwv = '0' 
                                            AND LENeg_nwv = '1' )),
                1 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_OENeg_Y),
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => LENeg_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_LENeg_Y),
                      PathCondition     => OENeg_nwv = '0'), 
                3 => (InputChangeTime   => Abh'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_Y),
                      PathCondition     => (LENeg_nwv = '0' 
                                            AND OENeg_nwv = '0'))
            )
        );

    END PROCESS;
END vhdl_behavioral;
