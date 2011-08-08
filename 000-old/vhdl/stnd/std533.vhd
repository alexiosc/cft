--------------------------------------------------------------------------------
--  File Name: std533.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1998 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   98 APR 29   Initial release
--    V1.1     R. Munden   98 SEP 28   Corrected output polarity
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STD
--  Technology: 54/74XXXX
--  Part:       STD533
-- 
--  Desciption: D Latch with 3-State Inverting Outputs
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std533 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_D                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_LE                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg               : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_LE_QNeg              : VitalDelayType01 := UnitDelay01;
        tpd_D_QNeg               : VitalDelayType01 := UnitDelay01;
        tpd_OENeg_QNeG           : VitalDelayType01Z := UnitDelay01Z;
        -- tsetup values: setup times
        tsetup_D_LE              : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_D_LE               : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_LE_posedge           : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        LE              : IN    std_logic := 'U';
        OENeg           : IN    std_logic := 'U';
        D               : IN    std_logic := 'U';
        QNeg            : OUT   std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std533 : ENTITY IS TRUE;
END std533;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std533 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL LE_ipd              : std_ulogic := 'X';
    SIGNAL OENeg_ipd           : std_ulogic := 'X';
    SIGNAL D_ipd               : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (LE_ipd, LE, tipd_LE);
        w_2 : VitalWireDelay (OENeg_ipd, OENeg, tipd_OENeg);
        w_3 : VitalWireDelay (D_ipd, D, tipd_D);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior1 : PROCESS (LE_ipd, D_ipd, OENeg_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_D_LE         : X01 := '0';
        VARIABLE TD_D_LE            : VitalTimingDataType;

        VARIABLE Pviol_LE           : X01 := '0';
        VARIABLE PD_LE              : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation          : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q_zd               : std_ulogic;
        VARIABLE Qint_zd            : std_ulogic;
        VARIABLE PrevData           : std_logic_vector(0 to 2);

        -- Output Glitch Detection Variables
        VARIABLE Q_GlitchData       : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => D_ipd,
                TestSignalName  => "D_ipd",
                RefSignal       => LE_ipd,
                RefSignalName   => "LEB_ipd",
                SetupHigh       => tsetup_D_LE,
                SetupLow        => tsetup_D_LE,
                HoldHigh        => thold_D_LE,
                HoldLow         => thold_D_LE,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/std533",
                TimingData      => TD_D_LE,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_D_LE
            );

            VitalPeriodPulseCheck (
                TestSignal      => LE_ipd,
                TestSignalName  => "LE_ipd",
                PulseWidthHigh  => tpw_LE_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/std533",
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
            StateTable      => LATNQN_tab,
            DataIn          => (Violation, LE_ipd, D_ipd),
            Result          => Qint_zd,
            PreviousDataIn  => PrevData
        );

        Q_zd := VitalBUFIF0 (data => Qint_zd, enable => OENeg_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       => QNeg,
            OutSignalName   => "QNeg",
            OutTemp         => Q_zd,
            GlitchData      => Q_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LE_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_LE_QNeg),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => D_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_D_QNeg),
                      PathCondition     => LE_ipd = '1'),
                2 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_QNeg,
                      PathCondition     => LE_ipd = '1')
            )
        );

    END PROCESS;

END vhdl_behavioral;
