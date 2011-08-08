--------------------------------------------------------------------------------
--  File Name: std8952.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2004 Free Model Foundry; http://www.FreeModelFoundry.com
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--  MODIFICATION HISTORY:
--
--  version: | author:   | mod date: | changes made:
--   V1.0    M.Radmanovic  04 Feb 27   Initial release
--
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
--
--  Library:    STD
--  Technology: 54/74XXXX
--  Part:       STD8952
--  Description: Scan Test Device with Octal Registered Bus Tranceivers
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;

LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.conversions.ALL;
--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std8952 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_CLKENABNeg          : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKAB               : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEABNeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_A1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A4                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A5                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A6                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A7                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A8                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKENBANeg          : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKBA               : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEBANeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_B1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B4                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B5                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B6                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B7                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B8                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_TDI                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_TCK                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_TMS                 : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLKAB_B1             : VitalDelayType01 := UnitDelay01;
        tpd_OEBANeg_A1           : VitalDelayType01Z := UnitDelay01Z;
        tpd_TCK_A1               : VitalDelayType01Z := UnitDelay01Z;
        tpd_TCK_TDO              : VitalDelayType01Z := UnitDelay01Z;
        -- tsetup values: setup times
        tsetup_A1_CLKAB          : VitalDelayType := UnitDelay;
        tsetup_A1_TCK             : VitalDelayType := UnitDelay;
        tsetup_B1_CLKBA          : VitalDelayType := UnitDelay;
        tsetup_CLKENABNeg_CLKAB  : VitalDelayType := UnitDelay;
        tsetup_CLKENBANeg_CLKBA  : VitalDelayType := UnitDelay;
        tsetup_TDI_TCK           : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_A1_CLKAB           : VitalDelayType := UnitDelay;
        thold_A1_TCK             : VitalDelayType := UnitDelay;
        thold_B1_CLKBA           : VitalDelayType := UnitDelay;
        thold_CLKENABNeg_CLKAB   : VitalDelayType := UnitDelay;
        thold_CLKENBANeg_CLKBA   : VitalDelayType := UnitDelay;
        thold_TDI_TCK            : VitalDelayType := UnitDelay;
        -- tperiod min (calculated as 1/max freq)
        tperiod_TCK              : VitalDelayType := UnitDelay;
        tperiod_CLKAB            : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLKAB_posedge        : VitalDelayType := UnitDelay;
        tpw_CLKAB_negedge        : VitalDelayType := UnitDelay;
        tpw_TCK_posedge          : VitalDelayType := UnitDelay;
        tpw_TCK_negedge          : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        CLKENABNeg      : IN    std_logic := 'U';
        CLKAB           : IN    std_logic := 'U';
        OEABNeg         : IN    std_logic := 'U';
        A1              : INOUT std_logic := 'U';
        A2              : INOUT std_logic := 'U';
        A3              : INOUT std_logic := 'U';
        A4              : INOUT std_logic := 'U';
        A5              : INOUT std_logic := 'U';
        A6              : INOUT std_logic := 'U';
        A7              : INOUT std_logic := 'U';
        A8              : INOUT std_logic := 'U';
        CLKENBANeg      : IN    std_logic := 'U';
        CLKBA           : IN    std_logic := 'U';
        OEBANeg         : IN    std_logic := 'U';
        B1              : INOUT std_logic := 'U';
        B2              : INOUT std_logic := 'U';
        B3              : INOUT std_logic := 'U';
        B4              : INOUT std_logic := 'U';
        B5              : INOUT std_logic := 'U';
        B6              : INOUT std_logic := 'U';
        B7              : INOUT std_logic := 'U';
        B8              : INOUT std_logic := 'U';
        TDI             : IN    std_logic := 'U';
        TCK             : IN    std_logic := 'U';
        TDO             : OUT   std_logic := 'U';
        TMS             : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std8952 : ENTITY IS TRUE;
END std8952;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std8952 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    CONSTANT partID             : STRING := "std8952";

    SIGNAL CLKENABNeg_ipd      : std_ulogic := 'U';
    SIGNAL CLKAB_ipd           : std_ulogic := 'U';
    SIGNAL OEABNeg_ipd         : std_ulogic := 'U';
    SIGNAL CLKENBANeg_ipd      : std_ulogic := 'U';
    SIGNAL CLKBA_ipd           : std_ulogic := 'U';
    SIGNAL OEBANeg_ipd         : std_ulogic := 'U';
    SIGNAL A1_ipd              : std_ulogic := 'U';
    SIGNAL A2_ipd              : std_ulogic := 'U';
    SIGNAL A3_ipd              : std_ulogic := 'U';
    SIGNAL A4_ipd              : std_ulogic := 'U';
    SIGNAL A5_ipd              : std_ulogic := 'U';
    SIGNAL A6_ipd              : std_ulogic := 'U';
    SIGNAL A7_ipd              : std_ulogic := 'U';
    SIGNAL A8_ipd              : std_ulogic := 'U';
    SIGNAL B1_ipd              : std_ulogic := 'U';
    SIGNAL B2_ipd              : std_ulogic := 'U';
    SIGNAL B3_ipd              : std_ulogic := 'U';
    SIGNAL B4_ipd              : std_ulogic := 'U';
    SIGNAL B5_ipd              : std_ulogic := 'U';
    SIGNAL B6_ipd              : std_ulogic := 'U';
    SIGNAL B7_ipd              : std_ulogic := 'U';
    SIGNAL B8_ipd              : std_ulogic := 'U';
    SIGNAL TDI_ipd             : std_ulogic := 'U';
    SIGNAL TCK_ipd             : std_ulogic := 'U';
    SIGNAL TMS_ipd             : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1  : VitalWireDelay (CLKENABNeg_ipd, CLKENABNeg, tipd_CLKENABNeg);
        w_2  : VitalWireDelay (CLKAB_ipd, CLKAB, tipd_CLKAB);
        w_3  : VitalWireDelay (OEABNeg_ipd, OEABNeg, tipd_OEABNeg);
        w_4  : VitalWireDelay (B1_ipd, B1, tipd_B1);
        w_5  : VitalWireDelay (B2_ipd, B2, tipd_B2);
        w_6  : VitalWireDelay (B3_ipd, B3, tipd_B3);
        w_7  : VitalWireDelay (B4_ipd, B4, tipd_B4);
        w_8  : VitalWireDelay (B5_ipd, B5, tipd_B5);
        w_9  : VitalWireDelay (B6_ipd, B6, tipd_B6);
        w_10 : VitalWireDelay (B7_ipd, B7, tipd_B7);
        w_11 : VitalWireDelay (B8_ipd, B8, tipd_B8);
        w_12 : VitalWireDelay (CLKENBANeg_ipd, CLKENBANeg, tipd_CLKENBANeg);
        w_13 : VitalWireDelay (CLKBA_ipd, CLKBA, tipd_CLKBA);
        w_14 : VitalWireDelay (OEBANeg_ipd, OEBANeg, tipd_OEBANeg);
        w_15 : VitalWireDelay (A1_ipd, A1, tipd_A1);
        w_16 : VitalWireDelay (A2_ipd, A2, tipd_A2);
        w_17 : VitalWireDelay (A3_ipd, A3, tipd_A3);
        w_18 : VitalWireDelay (A4_ipd, A4, tipd_A4);
        w_19 : VitalWireDelay (A5_ipd, A5, tipd_A5);
        w_20 : VitalWireDelay (A6_ipd, A6, tipd_A6);
        w_21 : VitalWireDelay (A7_ipd, A7, tipd_A7);
        w_22 : VitalWireDelay (A8_ipd, A8, tipd_A8);
        w_23 : VitalWireDelay (TDI_ipd, TDI, tipd_TDI);
        w_24 : VitalWireDelay (TCK_ipd, TCK, tipd_TCK);
        w_25 : VitalWireDelay (TMS_ipd, TMS, tipd_TMS);

    END BLOCK;

    ---------------------------------------------------------------------------
    -- Main Behavior Block
    ---------------------------------------------------------------------------
    Behavior: BLOCK

        PORT (
            AIn            : IN    std_logic_vector(7 downto 0) :=
                                               (OTHERS => 'U');
            AOut           : OUT   std_logic_vector(7 downto 0) :=
                                               (OTHERS => 'U');
            BIn            : IN    std_logic_vector(7 downto 0) :=
                                               (OTHERS => 'U');
            BOut           : OUT   std_logic_vector(7 downto 0) :=
                                               (OTHERS => 'U');
            CLKENABNeg     : IN    std_ulogic := 'U';
            CLKENBANeg     : IN    std_ulogic := 'U';
            CLKAB          : IN    std_ulogic := 'U';
            CLKBA          : IN    std_ulogic := 'U';
            OEABNeg        : IN    std_ulogic := 'U';
            OEBANeg        : IN    std_ulogic := 'U';
            TDI            : IN    std_ulogic := 'U';
            TCK            : IN    std_ulogic := 'U';
            TMS            : IN    std_ulogic := 'U';
            TDO            : OUT   std_ulogic := 'U'
        );
        PORT MAP (

             AIn(7)       => A8_ipd,
             AIn(6)       => A7_ipd,
             AIn(5)       => A6_ipd,
             AIn(4)       => A5_ipd,
             AIn(3)       => A4_ipd,
             AIn(2)       => A3_ipd,
             AIn(1)       => A2_ipd,
             AIn(0)       => A1_ipd,

             AOut(7)      => A8,
             AOut(6)      => A7,
             AOut(5)      => A6,
             AOut(4)      => A5,
             AOut(3)      => A4,
             AOut(2)      => A3,
             AOut(1)      => A2,
             AOut(0)      => A1,

             BIn(7)       => B8_ipd,
             BIn(6)       => B7_ipd,
             BIn(5)       => B6_ipd,
             BIn(4)       => B5_ipd,
             BIn(3)       => B4_ipd,
             BIn(2)       => B3_ipd,
             BIn(1)       => B2_ipd,
             BIn(0)       => B1_ipd,

             BOut(7)      => B8,
             BOut(6)      => B7,
             BOut(5)      => B6,
             BOut(4)      => B5,
             BOut(3)      => B4,
             BOut(2)      => B3,
             BOut(1)      => B2,
             BOut(0)      => B1,

             CLKENABNeg   => CLKENABNeg,
             CLKENBANeg   => CLKENBANeg,
             CLKAB        => CLKAB,
             CLKBA        => CLKBA,
             OEABNeg      => OEABNeg,
             OEBANeg      => OEBANeg,
             TDI          => TDI,
             TCK          => TCK,
             TMS          => TMS,
             TDO          => TDO
        );

        TYPE Instruction IS (bypass,
                             extest,
                             highz,
                             sample_preload,
                             clamp,
                             readbn,
                             readbt,
                             celltst,
                             tophip,
                             scancn,
                             scanct,
                             runt
                            );

        TYPE boundary_opcode IS (TOPSIP,
                                 PRPG,
                                 PSA,
                                 PSA_PRPG,
                                 PSA_COUNT
                                );

        SIGNAL BS_reg     : std_logic_vector(37 downto 0);
        SIGNAL BS_psa     : std_logic_vector(37 downto 0);

        SIGNAL B_zd       : std_logic_vector(7 downto 0);
        SIGNAL A_zd      : std_logic_vector(7 downto 0);

        SIGNAL test_mode  : std_logic := '0';

        SIGNAL opcode     : boundary_opcode;
        SIGNAL Instruct   : Instruction;

    BEGIN

    test_mode <= '1' WHEN (Instruct = extest OR Instruct = clamp OR
                           Instruct = tophip OR(Instruct = runt AND
                           (OEABNeg /= OEBANeg))) ELSE '0';

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior1 : PROCESS (CLKAB, CLKENABNeg, AIn, OEABNeg, Instruct, TCK,
                              BS_reg(7 downto 0))

        -- Timing Check Variables
        VARIABLE Tviol_A_CLKAB      : X01 := '0';
        VARIABLE TD_A_CLKAB         : VitalTimingDataType;

        VARIABLE Tviol_A_TCK        : X01 := '0';
        VARIABLE TD_A_TCK           : VitalTimingDataType;

        VARIABLE Tviol_CLKENABNeg_CLKAB      : X01 := '0';
        VARIABLE TD_CLKENABNeg_CLKAB         : VitalTimingDataType;

        VARIABLE Pviol_CLKAB      : X01 := '0';
        VARIABLE PD_CLKAB         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation        : X01 := '0';

        -- Functionality Results Variables
        VARIABLE A_int            : std_logic_vector(7 downto 0);

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => CLKENABNeg,
                TestSignalName  => "CLKENABNeg",
                RefSignal       => CLKAB,
                RefSignalName   => "CLKAB",
                SetupHigh       => tsetup_CLKENABNeg_CLKAB,
                SetupLow        => tsetup_CLKENABNeg_CLKAB,
                HoldHigh        => thold_CLKENABNeg_CLKAB,
                HoldLow         => thold_CLKENABNeg_CLKAB,
                CheckEnabled    => test_mode = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & PartID,
                TimingData      => TD_CLKENABNeg_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLKENABNeg_CLKAB
            );

            VitalSetupHoldCheck (
                TestSignal      => AIn,
                TestSignalName  => "AIn",
                RefSignal       => CLKAB,
                RefSignalName   => "CLKAB",
                SetupHigh       => tsetup_A1_CLKAB,
                SetupLow        => tsetup_A1_CLKAB,
                HoldHigh        => thold_A1_CLKAB,
                HoldLow         => thold_A1_CLKAB,
                CheckEnabled    => CLKENABNeg = '0' AND
                                   test_mode = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & PartID,
                TimingData      => TD_A_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_CLKAB
            );

            VitalSetupHoldCheck (
                TestSignal      => AIn,
                TestSignalName  => "AIn",
                RefSignal       => TCK,
                RefSignalName   => "TCK",
                SetupHigh       => tsetup_A1_TCK,
                SetupLow        => tsetup_A1_TCK,
                HoldHigh        => thold_A1_TCK,
                HoldLow         => thold_A1_TCK,
                CheckEnabled    => test_mode = '1',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & PartID,
                TimingData      => TD_A_TCK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_TCK
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKAB,
                TestSignalName  => "CLKAB",
                Period          => tperiod_CLKAB,
                PulseWidthLow   => tpw_CLKAB_negedge,
                PulseWidthHigh  => tpw_CLKAB_posedge,
                CheckEnabled    => CLKENABNeg = '0' AND
                                   test_mode = '0',
                HeaderMsg       => InstancePath & PartID,
                PeriodData      => PD_CLKAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKAB
            );

        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_A_CLKAB OR Tviol_CLKENABNeg_CLKAB OR
                     Tviol_A_TCK OR Pviol_CLKAB;

        IF test_mode = '0' THEN
            A_int := AIn;
        ELSE
            A_int := BS_reg(31 downto 24);
        END IF;

        IF test_mode = '0' THEN
        --normal mode
            IF rising_edge(CLKAB) THEN
                IF CLKENABNeg = '0' THEN
                    B_zd <= A_int;
                END IF;
            END IF;
        ELSE
        --test mode
            IF falling_edge(TCK) THEN
                B_zd <= BS_reg(7 downto 0);
            END IF;
        END IF;

        IF Instruct = extest OR Instruct = clamp THEN
            B_zd <= BS_reg(7 downto 0);
        END IF;

        IF (OEABNeg = '1' OR Instruct = highz) THEN
            B_zd <= (others => 'Z');
        END IF;

    END PROCESS;

        ------------------------------------------------------------------------
    VitalBehavior2 : PROCESS (CLKBA, CLKENBANeg, BIn, OEBANeg, Instruct, TCK,
                              BS_reg(15 downto 8))

        -- Timing Check Variables
        VARIABLE Tviol_B_CLKBA      : X01 := '0';
        VARIABLE TD_B_CLKBA         : VitalTimingDataType;

        VARIABLE Tviol_B_TCK        : X01 := '0';
        VARIABLE TD_B_TCK           : VitalTimingDataType;

        VARIABLE Tviol_CLKENBANeg_CLKBA      : X01 := '0';
        VARIABLE TD_CLKENBANeg_CLKBA         : VitalTimingDataType;

        VARIABLE Pviol_CLKBA      : X01 := '0';
        VARIABLE PD_CLKBA         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation        : X01 := '0';

        -- Functionality Results Variables
        VARIABLE B_int            : std_logic_vector(7 downto 0);

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => CLKENBANeg,
                TestSignalName  => "CLKENBANeg",
                RefSignal       => CLKBA,
                RefSignalName   => "CLKBA",
                SetupHigh       => tsetup_CLKENBANeg_CLKBA,
                SetupLow        => tsetup_CLKENBANeg_CLKBA,
                HoldHigh        => thold_CLKENBANeg_CLKBA,
                HoldLow         => thold_CLKENBANeg_CLKBA,
                CheckEnabled    => test_mode = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & PartID,
                TimingData      => TD_CLKENBANeg_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLKENBANeg_CLKBA
            );

            VitalSetupHoldCheck (
                TestSignal      => BIn,
                TestSignalName  => "BIn",
                RefSignal       => CLKBA,
                RefSignalName   => "CLKBA",
                SetupHigh       => tsetup_B1_CLKBA,
                SetupLow        => tsetup_B1_CLKBA,
                HoldHigh        => thold_B1_CLKBA,
                HoldLow         => thold_B1_CLKBA,
                CheckEnabled    => CLKENBANeg = '0' AND
                                   test_mode = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & PartID,
                TimingData      => TD_B_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_CLKBA
            );

            VitalSetupHoldCheck (
                TestSignal      => BIn,
                TestSignalName  => "BIn",
                RefSignal       => TCK,
                RefSignalName   => "TCK",
                SetupHigh       => tsetup_A1_TCK,
                SetupLow        => tsetup_A1_TCK,
                HoldHigh        => thold_A1_TCK,
                HoldLow         => thold_A1_TCK,
                CheckEnabled    => test_mode = '1',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & PartID,
                TimingData      => TD_B_TCK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B_TCK
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLKBA,
                TestSignalName  => "CLKBA",
                Period          => tperiod_CLKAB,
                PulseWidthLow   => tpw_CLKAB_negedge,
                PulseWidthHigh  => tpw_CLKAB_posedge,
                CheckEnabled    => CLKENBANeg = '0' AND
                                   test_mode = '0',
                HeaderMsg       => InstancePath & PartID,
                PeriodData      => PD_CLKBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKBA
            );

        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_B_CLKBA OR Tviol_CLKENBANeg_CLKBA OR
                     Tviol_B_TCK OR Pviol_CLKBA;

        IF test_mode = '0' THEN
            B_int := BIn;
        ELSE
            B_int := BS_reg(15 downto 8);
        END IF;

        IF test_mode = '0' THEN
        --normal mode
            IF rising_edge(CLKBA) THEN
                IF CLKENBANeg = '0' THEN
                    A_zd <= B_int;
                END IF;
            END IF;
        ELSE
        --test mode
            IF falling_edge(TCK) THEN
                A_zd <= BS_reg(23 downto 16);
            END IF;
        END IF;

        IF Instruct = extest OR Instruct = clamp THEN
            A_zd <= BS_reg(23 downto 16);
        END IF;

        IF (OEBANeg = '1' OR Instruct = highz) THEN
            A_zd <= (others => 'Z');
        END IF;

    END PROCESS;

        ------------------------------------------------------------------------
        -- Path Delay Process
        ------------------------------------------------------------------------

        BOutPath1 : FOR I IN 7 DOWNTO 0 GENERATE
            DataOut_Delay1 : PROCESS (B_zd(i))
                VARIABLE B_GlitchData:VitalGlitchDataArrayType(7 Downto 0);
            BEGIN
                VitalPathDelay01Z (
                    OutSignal       => BOut(i),
                    OutSignalName   => "B(i)",
                    OutTemp         => B_zd(i),
                    Mode            => VitalTransport,
                    GlitchData      => B_GlitchData(i),
                    Paths           => (
                        1 => (InputChangeTime => CLKAB'LAST_EVENT,
                              PathDelay => VitalExtendToFillDelay(tpd_CLKAB_B1),
                              PathCondition   => OEABNeg = '0' AND
                                                 test_mode = '0'),
                        2 => (InputChangeTime => OEABNeg'LAST_EVENT,
                              PathDelay => tpd_OEBANeg_A1,
                              PathCondition   => test_mode = '0'),
                        3 => (InputChangeTime => TCK'LAST_EVENT,
                              PathDelay => tpd_TCK_A1,
                              PathCondition   => test_mode = '1' AND
                                                 OEABNeg = '0')
                   )
                );

            END PROCESS;
        END GENERATE;

        ------------------------------------------------------------------------
        -- Path Delay Process
        ------------------------------------------------------------------------

        AOutPath1 : FOR I IN 7 DOWNTO 0 GENERATE
            DataOut_Delay1 : PROCESS (A_zd(i))
                VARIABLE A_GlitchData:VitalGlitchDataArrayType(7 Downto 0);
            BEGIN
                VitalPathDelay01Z (
                    OutSignal       => AOut(i),
                    OutSignalName   => "A(i)",
                    OutTemp         => A_zd(i),
                    Mode            => VitalTransport,
                    GlitchData      => A_GlitchData(i),
                    Paths           => (
                        1 => (InputChangeTime => CLKBA'LAST_EVENT,
                              PathDelay => VitalExtendToFillDelay(tpd_CLKAB_B1),
                              PathCondition   => OEBANeg = '0' AND
                                                 test_mode = '0'),
                        2 => (InputChangeTime => OEBANeg'LAST_EVENT,
                              PathDelay => tpd_OEBANeg_A1,
                              PathCondition   => test_mode = '0'),
                        3 => (InputChangeTime => TCK'LAST_EVENT,
                              PathDelay => tpd_TCK_A1,
                              PathCondition   => test_mode = '1' AND
                                                 OEBANeg = '0')
                   )
                );

            END PROCESS;
        END GENERATE;

    ---------------------------------------------------------------------------
    -- JTAG
    ---------------------------------------------------------------------------
    JTAG : PROCESS (TDI, TMS, TCK)

        TYPE tap_state_type IS (Test_Logic_Reset,
                                Run_Test_Idle,
                                Select_DR_Scan,
                                Capture_DR,
                                Shift_DR,
                                Exit1_DR,
                                Pause_DR,
                                Exit2_DR,
                                Update_DR,
                                Select_IR_Scan,
                                Capture_IR,
                                Shift_IR,
                                Exit1_IR,
                                Pause_IR,
                                Exit2_IR,
                                Update_IR
                                );

        VARIABLE TAP_state   : tap_state_type;

            -- Timing Check Variables

        VARIABLE Tviol_TDI_TCK           : X01 := '0';
        VARIABLE TD_TDI_TCK              : VitalTimingDataType;

        VARIABLE Tviol_TMS_TCK           : X01 := '0';
        VARIABLE TD_TMS_TCK              : VitalTimingDataType;

        VARIABLE Pviol_TCK    : X01 := '0';
        VARIABLE PD_TCK       : VitalPeriodDataType := VitalPeriodDataInit;


        VARIABLE BYReg       : std_logic := '0';
        VARIABLE BYTmp       : std_logic;
        VARIABLE IReg        : std_logic_vector(7 downto 0);
        VARIABLE ITmp        : std_logic_vector(7 downto 0);
        VARIABLE BSTmp       : std_logic_vector(37 downto 0)
                                    := (others => '1');
        VARIABLE BC_tmp     : std_logic_vector(10 downto 0);
        VARIABLE BC_reg     : std_logic_vector(10 downto 0);

        VARIABLE TDOTmp      : std_logic;

        VARIABLE mask        : std_logic_vector(7 downto 0);
        VARIABLE Shift       : BOOLEAN := false;
        VARIABLE UpdateIR    : BOOLEAN := false;
        VARIABLE UpdateDR    : BOOLEAN := false;

        VARIABLE count       : NATURAL;

        VARIABLE Violation          : X01 := '0';

        -- Output Glitch Detection Variables
        VARIABLE TDO_GlitchData         : VitalGlitchDataType;

        VARIABLE TDO_zd                 : std_logic := 'Z';

    BEGIN

            --------------------------------------------------------------------
            -- Timing Check Section
            --------------------------------------------------------------------
            IF (TimingChecksOn) THEN

                VitalSetupHoldCheck (
                    TestSignal      => TDI,
                    TestSignalName  => "TDI",
                    RefSignal       => TCK,
                    RefSignalName   => "TCK",
                    SetupHigh       => tsetup_TDI_TCK,
                    SetupLow        => tsetup_TDI_TCK,
                    HoldHigh        => thold_TDI_TCK,
                    HoldLow         => thold_TDI_TCK,
                    CheckEnabled    => true,
                    RefTransition   => '/',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_TDI_TCK,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_TDI_TCK );

                VitalSetupHoldCheck (
                    TestSignal      => TMS,
                    TestSignalName  => "TMS",
                    RefSignal       => TCK,
                    RefSignalName   => "TCK",
                    SetupHigh       => tsetup_TDI_TCK,
                    SetupLow        => tsetup_TDI_TCK,
                    HoldHigh        => thold_TDI_TCK,
                    HoldLow         => thold_TDI_TCK,
                    CheckEnabled    => true,
                    RefTransition   => '/',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_TMS_TCK,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_TMS_TCK );

                VitalPeriodPulseCheck (
                    TestSignal      =>  TCK,
                    TestSignalName  =>  "TCK",
                    Period          =>  tperiod_TCK,
                    PulseWidthLow   =>  tpw_TCK_negedge,
                    PulseWidthHigh  =>  tpw_TCK_posedge,
                    PeriodData      =>  PD_TCK,
                    XOn             =>  XOn,
                    MsgOn           =>  MsgOn,
                    Violation       =>  Pviol_TCK,
                    HeaderMsg       =>  InstancePath & PartID,
                    CheckEnabled    =>  true );

                Violation := Tviol_TDI_TCK OR Tviol_TMS_TCK OR Pviol_TCK;

                ASSERT Violation = '0'
                    REPORT InstancePath & partID & ": simulation may be" &
                           " inaccurate due to timing violations"
                    SEVERITY Warning;

            END IF;
    ----------------------------------------------------------------------------
    -- Functional Section
    ----------------------------------------------------------------------------

        -- Power Up & Reset JTAG
        IF NOW = 0 ns THEN
            TAP_state := Test_Logic_Reset;
            Shift := false;
            UpdateIR := false;
            UpdateDR := false;
            Instruct <= bypass;
            IReg := "11111111";
        END IF;

        -- TAP State Machine
        IF rising_edge(TCK) THEN
            CASE TAP_state IS
                WHEN Test_Logic_Reset =>
                    IF TMS = '1' THEN
                        TAP_state := Test_Logic_Reset;
                        IReg := "11111111";
                        Instruct <= bypass;
                        BC_reg := "00000000010";
                        BS_reg <= "11000000000000000000000000000000000000";
                        BS_psa <= BS_reg;
                    ELSE
                        TAP_state := Run_Test_Idle;
                    END IF;
                WHEN Run_Test_Idle =>
                    IF TMS = '1' THEN
                        TAP_state := Select_DR_Scan;
                    ELSE
                        TAP_state := Run_Test_Idle;
                    END IF;
                WHEN Select_DR_Scan =>
                    IF TMS = '1' THEN
                        TAP_state := Select_IR_Scan;
                    ELSE
                        TAP_state := Capture_DR;
                        CASE Instruct IS
                            WHEN bypass =>
                                BYTmp := '0';
                                BYReg := '0';
                            WHEN extest =>
                                BSTmp := BS_reg;
                                --boundary scan
                                BSTmp(32) := CLKENABNeg;
                                BSTmp(33) := CLKENBANeg;
                                BSTmp(34) := CLKAB;
                                BSTmp(35) := CLKBA;
                                BSTmp(36) := OEABNeg;
                                BSTmp(37) := OEBANeg;
                                IF OEABNeg <= '0' THEN
                                    BSTmp(31 downto 24) := AIn;
                                    BSTmp(7 downto 0) := B_zd;
                                END IF;
                                IF OEBANeg <= '0' THEN
                                    BSTmp(15 downto 8)  := BIn;
                                    BSTmp(23 downto 16) := A_zd;
                                END IF;

                                BS_reg <= BSTmp;
                            WHEN highz =>
                                BYTmp := '0';
                                BYReg := '0';
                            WHEN sample_preload =>
                                BSTmp := BS_reg;
                                BSTmp(32) := CLKENABNeg;
                                BSTmp(33) := CLKENBANeg;
                                BSTmp(34) := CLKAB;
                                BSTmp(35) := CLKBA;
                                BSTmp(36) := OEABNeg;
                                BSTmp(37) := OEBANeg;
                                IF OEABNeg <= '0' THEN
                                    BSTmp(31 downto 24) := AIn;
                                    BSTmp(7 downto 0) := B_zd;
                                END IF;
                                IF OEBANeg <= '0' THEN
                                    BSTmp(15 downto 8)  := BIn;
                                    BSTmp(23 downto 16) := A_zd;
                                END IF;

                                BS_reg <= BSTmp;
                            WHEN clamp =>
                                BYTmp := '0';
                                BYReg := '0';
                            WHEN celltst =>
                                BSTmp := BS_reg;

                                FOR I IN 37 downto 0 LOOP
                                    BSTmp(i)  := not(BSTmp(i));
                                END LOOP;

                            WHEN tophip =>
                                BYTmp := '0';
                                BYReg := '0';
                            WHEN scancn =>
                                BC_tmp := BC_reg;
                            WHEN scanct =>
                                BC_tmp := BC_reg;
                            WHEN runt =>
                                BYTmp := '0';
                                BYReg := '0';
                            WHEN readbn | readbt =>
                                BSTmp := BS_reg;

                            WHEN others =>
                                NULL;
                        END CASE;
                    END IF;
                WHEN Capture_DR =>
                    IF TMS = '1' THEN
                        TAP_state := Exit1_DR;
                        Shift := false;
                    ELSE
                        TAP_state := Shift_DR;
                        CASE Instruct IS
                            WHEN extest =>
                                TDOTmp := BSTmp(0);
                                FOR I IN 0 TO 36 LOOP
                                    BSTmp(i) := BSTmp(i+1);
                                END LOOP;
                                BSTmp(37) := TDI;
                                Shift := true;
                            WHEN bypass =>
                                TDOTmp := BYTmp;
                                BYTmp := TDI;
                                Shift := true;
                            WHEN highz =>
                                TDOTmp := BYTmp;
                                BYTmp := TDI;
                                Shift := true;
                            WHEN sample_preload =>
                                TDOTmp := BSTmp(0);
                                FOR I IN 0 TO 36 LOOP
                                    BSTmp(i) := BSTmp(i+1);
                                END LOOP;
                                BSTmp(37) := TDI;
                                Shift := true;
                            WHEN celltst | readbn | readbt =>
                                TDOTmp := BSTmp(0);
                                FOR I IN 0 TO 36 LOOP
                                    BSTmp(i) := BSTmp(i+1);
                                END LOOP;
                                BSTmp(37) := TDI;
                                Shift := true;
                            WHEN clamp | runt | tophip =>
                                TDOTmp := BYTmp;
                                BYTmp := TDI;
                                Shift := true;
                            WHEN scancn | scanct =>
                                TDOTmp := BC_tmp(0);
                                FOR I IN 0 TO 9 LOOP
                                    BC_tmp(i) := BC_tmp(i+1);
                                END LOOP;
                                BC_tmp(10) := TDI;
                                Shift := true;
                            WHEN others =>
                                NULL;
                        END CASE;
                    END IF;
                WHEN Shift_DR =>
                    IF TMS = '1' THEN
                        TAP_state := Exit1_DR;
                        Shift := false;
                    ELSE
                        TAP_state := Shift_DR;
                        CASE Instruct IS
                            WHEN extest =>
                                TDOTmp := BSTmp(0);
                                FOR I IN 0 TO 36 LOOP
                                    BSTmp(i) := BSTmp(i+1);
                                END LOOP;
                                BSTmp(37) := TDI;
                                Shift := true;
                            WHEN bypass =>
                                TDOTmp := BYTmp;
                                BYTmp := TDI;
                                Shift := true;
                            WHEN highz =>
                                TDOTmp := BYTmp;
                                BYTmp := TDI;
                                Shift := true;
                            WHEN sample_preload =>
                                TDOTmp := BSTmp(0);
                                FOR I IN 0 TO 36 LOOP
                                    BSTmp(i) := BSTmp(i+1);
                                END LOOP;
                                BSTmp(37) := TDI;
                                Shift := true;
                            WHEN celltst | readbn | readbt =>
                                TDOTmp := BSTmp(0);
                                FOR I IN 0 TO 36 LOOP
                                    BSTmp(i) := BSTmp(i+1);
                                END LOOP;
                                BSTmp(37) := TDI;
                                Shift := true;
                            WHEN clamp | runt | tophip =>
                                TDOTmp := BYTmp;
                                BYTmp := TDI;
                                Shift := true;
                            WHEN scancn | scanct =>
                                TDOTmp := BC_tmp(0);
                                FOR I IN 0 TO 9 LOOP
                                    BC_tmp(i) := BC_tmp(i+1);
                                END LOOP;
                                BC_tmp(10) := TDI;
                                Shift := true;
                            WHEN others =>
                                NULL;
                        END CASE;
                    END IF;
                WHEN Exit1_DR =>
                    IF TMS = '1' THEN
                        TAP_state := Update_DR;
                        UpdateDR := true;
                    ELSE
                        TAP_state := Pause_DR;
                    END IF;
                WHEN Pause_DR =>
                    IF TMS = '1' THEN
                        TAP_state := Exit2_DR;
                    ELSE
                        TAP_state := Pause_DR;
                    END IF;
                WHEN Exit2_DR =>
                    IF TMS = '1' THEN
                        TAP_state := Update_DR;
                        UpdateDR := true;
                    ELSE
                        TAP_state := Shift_DR;
                        CASE Instruct IS
                            WHEN extest =>
                                TDOTmp := BSTmp(0);
                                FOR I IN 0 TO 36 LOOP
                                    BSTmp(i) := BSTmp(i+1);
                                END LOOP;
                                BSTmp(37) := TDI;
                                Shift := true;
                            WHEN bypass =>
                                TDOTmp := BYTmp;
                                BYTmp := TDI;
                                Shift := true;
                            WHEN highz =>
                                TDOTmp := BYTmp;
                                BYTmp := TDI;
                                Shift := true;
                            WHEN sample_preload =>
                                TDOTmp := BSTmp(0);
                                FOR I IN 0 TO 36 LOOP
                                    BSTmp(i) := BSTmp(i+1);
                                END LOOP;
                                BSTmp(37) := TDI;
                                Shift := true;
                            WHEN celltst | readbn | readbt =>
                                TDOTmp := BSTmp(0);
                                FOR I IN 0 TO 36 LOOP
                                    BSTmp(i) := BSTmp(i+1);
                                END LOOP;
                                BSTmp(37) := TDI;
                                Shift := true;
                            WHEN clamp | runt | tophip =>
                                TDOTmp := BYTmp;
                                BYTmp := TDI;
                                Shift := true;
                            WHEN scancn | scanct =>
                                TDOTmp := BC_tmp(0);
                                FOR I IN 0 TO 9 LOOP
                                    BC_tmp(i) := BC_tmp(i+1);
                                END LOOP;
                                BC_tmp(10) := TDI;
                                Shift := true;
                            WHEN others =>
                                NULL;
                        END CASE;
                    END IF;
                WHEN Update_DR =>
                    IF TMS = '1' THEN
                        TAP_state := Select_DR_Scan;
                    ELSE
                        TAP_state := Run_Test_Idle;
                    END IF;
                WHEN Select_IR_Scan =>
                    IF TMS = '1' THEN
                        TAP_state := Test_Logic_Reset;
                        IReg := "11111111";
                        Instruct <= bypass;
                        BC_reg := "00000000010";
                        BS_reg <= "11000000000000000000000000000000000000";
                    ELSE
                        TAP_state := Capture_IR;
                        ITmp := "10000001";
                        TDO_zd := 'Z';
                    END IF;
                WHEN Capture_IR =>
                    IF TMS = '1' THEN
                        TAP_state := Exit1_IR;
                        Shift := false;
                    ELSE
                        TAP_state := Shift_IR;
                        TDOTmp := ITmp(0);
                        FOR I IN 0 TO 6 LOOP
                            ITmp(i) := ITmp(i+1);
                        END LOOP;
                        ITmp(7) := TDI;
                        Shift := true;
                    END IF;
                WHEN Shift_IR =>
                    IF TMS = '1' THEN
                        TAP_state := Exit1_IR;
                        Shift := false;
                    ELSE
                        TAP_state := Shift_IR;
                        TDOTmp := ITmp(0);
                        FOR I IN 0 TO 6 LOOP
                            ITmp(i) := ITmp(i+1);
                        END LOOP;
                        ITmp(7) := TDI;
                        Shift := true;
                    END IF;
                WHEN Exit1_IR =>
                    IF TMS = '1' THEN
                        TAP_state := Update_IR;
                        UpdateIR := true;
                    ELSE
                        TAP_state := Pause_IR;
                    END IF;
                WHEN Pause_IR =>
                    IF TMS = '1' THEN
                        TAP_state := Exit2_IR;
                    ELSE
                        TAP_state := Pause_IR;
                    END IF;
                WHEN Exit2_IR =>
                    IF TMS = '1' THEN
                        TAP_state := Update_IR;
                        UpdateIR := true;
                    ELSE
                        TAP_state := Shift_IR;
                        TDOTmp := ITmp(0);
                        FOR I IN 0 TO 6 LOOP
                            ITmp(i) := ITmp(i+1);
                        END LOOP;
                        ITmp(7) := TDI;
                        Shift := true;
                    END IF;
                WHEN Update_IR =>
                    IF TMS = '1' THEN
                        TAP_state := Select_DR_Scan;
                    ELSE
                        TAP_state := Run_Test_Idle;
                    END IF;
            END CASE;
        END IF;

        ----------------------------
        -- opcode functions during Run_Test_Idle
        IF rising_edge(TCK) THEN
           IF TAP_state = Run_Test_Idle THEN
                IF OEABNeg = '0' AND OEBANeg = '1' THEN
                    IF Instruct = runt THEN
                        CASE opcode IS
                            WHEN TOPSIP =>
                                --sample inputs
                                BS_reg(31 downto 24) <= AIn;
                                -- toggle outputs
                                FOR I IN 7 downto 0 LOOP
                                    BS_reg(i) <= not(BS_reg(i));
                                END LOOP;
                            WHEN PRPG =>
                                FOR I IN 24 TO 30 LOOP
                                    BS_reg(i) <= BS_reg(i+1);
                                END LOOP;
                                FOR I IN 0 TO 6 LOOP
                                    BS_reg(i) <= BS_reg(i+1);
                                END LOOP;
                                BS_reg(7) <= BS_reg(24);
                                BS_reg(31) <= (((BS_reg(25) XOR BS_reg(0))
                                             XOR BS_reg(4)) XOR BS_reg(7));
                            WHEN PSA =>
                                --inputs
                                FOR I IN 24 TO 30 LOOP
                                    BS_reg(i) <= (BS_reg(i+1) XOR (AIn(i-24)
                                                  AND not(mask(i-24))));
                                END LOOP;
                                BS_reg(31) <= ((((BS_reg(25) XOR BS_psa(0))
                                             XOR BS_psa(4)) XOR BS_psa(7))
                                             XOR (AIn(7)
                                             AND not(mask(7))));
                                FOR I IN 0 TO 6 LOOP
                                    BS_psa(i) <= BS_psa(i+1);
                                END LOOP;
                                BS_psa(7) <= BS_reg(24);
                            WHEN PSA_PRPG =>
                                --inputs
                                FOR I IN 24 TO 30 LOOP
                                    BS_reg(i) <= (BS_reg(i+1) XOR (AIn(i-24)
                                                  AND not(mask(i-24))));
                                END LOOP;
                                BS_reg(31) <= ((((BS_reg(16) XOR BS_reg(28))
                                             XOR BS_reg(29)) XOR BS_reg(30))
                                             XOR (AIn(7)
                                             AND not(mask(7))));
                                -- outputs
                                FOR I IN 0 TO 6 LOOP
                                    BS_reg(i) <= BS_reg(i+1);
                                END LOOP;
                                BS_reg(7) <= (((BS_reg(0) XOR BS_reg(4))
                                             XOR BS_reg(5)) XOR BS_reg(6));
                            WHEN PSA_COUNT =>
                                --inputs
                                FOR I IN 24 TO 30 LOOP
                                    BS_reg(i) <= (BS_reg(i+1) XOR (AIn(i-24)
                                                  AND not(mask(i-24))));
                                END LOOP;
                                BS_reg(31) <= ((((BS_reg(16) XOR BS_reg(28))
                                             XOR BS_reg(29)) XOR BS_reg(30))
                                             XOR (AIn(7)
                                             AND not(mask(7))));
                                -- outputs
                                count := to_nat(BS_reg(7 downto 0));
                                IF count = 255 THEN
                                    count := 0;
                                ELSE
                                    count := count + 1;
                                END IF;
                                BS_reg(7 downto 0) <= to_slv(count, 8);
                            WHEN others =>
                                NULL;
                        END CASE;
                    ELSIF Instruct = tophip THEN
                        -- toggle outputs
                        FOR I IN 7 downto 0 LOOP
                                BS_reg(i) <= not(BS_reg(i));
                        END LOOP;
                    END IF;
                ELSIF OEABNeg = '1' AND OEBANeg = '0' THEN
                    IF Instruct = runt THEN
                        CASE opcode IS
                            WHEN TOPSIP =>
                                --sample inputs
                                BS_reg(15 downto 8)  <= BIn;
                                -- toggle outputs
                                FOR I IN 23 downto 16 LOOP
                                    BS_reg(i) <= not(BS_reg(i));
                                END LOOP;
                            WHEN PRPG =>
                                FOR I IN 8 TO 14 LOOP
                                    BS_reg(i) <= BS_reg(i+1);
                                END LOOP;
                                FOR I IN 16 TO 22 LOOP
                                    BS_reg(i) <= BS_reg(i+1);
                                END LOOP;
                                BS_reg(23) <= BS_reg(8);
                                BS_reg(15) <= (((BS_reg(16) XOR BS_reg(9))
                                               XOR BS_reg(20)) XOR BS_reg(23));
                            WHEN PSA =>
                                --inputs
                                FOR I IN 8 TO 14 LOOP
                                    BS_reg(i) <= (BS_reg(i+1) XOR (BIn(i-8)
                                                  AND not(mask(i-8))));
                                END LOOP;
                                BS_reg(15) <= ((((BS_psa(16) XOR BS_reg(9))
                                               XOR BS_psa(20)) XOR BS_psa(23))
                                               XOR (BIn(7) AND not(mask(7))));
                                FOR I IN 16 TO 22 LOOP
                                    BS_psa(i) <= BS_psa(i+1);
                                END LOOP;
                                BS_psa(23) <= BS_reg(8);
                            WHEN PSA_PRPG =>
                                 --inputs
                                FOR I IN 8 TO 14 LOOP
                                    BS_reg(i) <= (BS_reg(i+1) XOR (BIn(i-8)
                                                  AND not(mask(i-8))));
                                END LOOP;
                                BS_reg(15) <= ((((BS_reg(8) XOR BS_reg(12))
                                             XOR BS_reg(13)) XOR BS_reg(14))
                                             XOR (BIn(7)
                                             AND not(mask(7))));
                                -- outputs
                                FOR I IN 16 TO 22 LOOP
                                    BS_reg(i) <= BS_reg(i+1);
                                END LOOP;
                                BS_reg(23) <= (((BS_reg(16) XOR BS_reg(20))
                                             XOR BS_reg(21)) XOR BS_reg(22));
                            WHEN PSA_COUNT =>
                                --inputs
                                FOR I IN 8 TO 14 LOOP
                                    BS_reg(i) <= (BS_reg(i+1) XOR (BIn(i-8)
                                                  AND not(mask(i-8))));
                                END LOOP;
                                BS_reg(15) <= ((((BS_reg(8) XOR BS_reg(12))
                                             XOR BS_reg(13)) XOR BS_reg(14))
                                             XOR (BIn(7)
                                             AND not(mask(7))));
                                -- outputs
                                count := to_nat(BS_reg(23 downto 16));
                                IF count = 255 THEN
                                    count := 0;
                                ELSE
                                    count := count + 1;
                                END IF;
                                BS_reg(23 downto 16) <= to_slv(count, 8);
                            WHEN others =>
                                NULL;
                        END CASE;
                    ELSIF Instruct = tophip THEN
                        -- toggle outputs
                        FOR I IN 23 downto 16 LOOP
                            BS_reg(i) <= not(BS_reg(i));
                        END LOOP;
                    END IF;
                END IF;
            END IF;
        END IF;

        -- FALLING EDGE TCK
        IF falling_edge(TCK) THEN
            IF Shift = true THEN
                TDO_zd := TDOTmp;
            ELSIF UpdateIR = true THEN
                TDO_zd := 'Z';
                IReg:= ITmp;
                CASE IReg IS
                    WHEN "00000000" | "00000011" =>
                        Instruct <= extest;
                    WHEN "10000010" =>
                        Instruct <= sample_preload;
                    WHEN "00000110" =>
                        Instruct <= highz;
                    WHEN "10000111" =>
                        Instruct <= clamp;
                    WHEN "00001001" =>
                        Instruct <= runt;
                    WHEN "00001010" =>
                        Instruct <= readbn;
                    WHEN "10001011" =>
                        Instruct <= readbt;
                    WHEN "00001100" =>
                        Instruct <= celltst;
                    WHEN "10001101" =>
                        Instruct <= tophip;
                    WHEN "10001110" =>
                        Instruct <= scancn;
                    WHEN "00001111" =>
                        Instruct <= scanct;
                    WHEN others =>
                        Instruct <= bypass;
                END CASE;
                UpdateIR := false;
                BS_psa <= BS_reg;
            ELSIF UpdateDR = true THEN
                TDO_zd := 'Z';
                UpdateDR := false;
                CASE Instruct IS
                    WHEN extest =>
                        BS_reg <= BSTmp;
                    WHEN bypass =>
                        BYReg := BYTmp;
                    WHEN highz =>
                        BYReg := BYTmp;
                    WHEN sample_preload =>
                        BS_reg <= BSTmp;
                    WHEN clamp =>
                        BYReg := BYTmp;
                    WHEN runt =>
                        BYReg := BYTmp;
                    WHEN readbn =>
                        BS_reg <= BSTmp;
                    WHEN readbt =>
                        BS_reg <= BSTmp;
                    WHEN celltst =>
                        BS_reg <= BSTmp;
                    WHEN tophip =>
                        BYReg := BYTmp;
                    WHEN scancn =>
                        BC_reg := BC_tmp;
                    WHEN scanct =>
                        BC_reg := BC_tmp;
                    WHEN others =>
                        NULL;
                END CASE;
                BS_psa <= BS_reg;
            ELSE
                TDO_zd := 'Z';
            END IF;
        END IF;

        --boundary-control register opcodes
        CASE BC_reg(2 downto 0) IS
            WHEN "000" | "100" =>
                opcode <= TOPSIP;
            WHEN "001" | "101" =>
                opcode <= PRPG;
            WHEN "010" | "110" =>
                opcode <= PSA;
            WHEN "011" =>
                opcode <= PSA_PRPG;
            WHEN "111" =>
                opcode <= PSA_COUNT;
            WHEN others =>
                NULL;
        END CASE;

        mask := BC_reg(10 downto 3);

        ------------------------------------------------------------------------
        -- JTAG Path Delay Section
        ------------------------------------------------------------------------

        VitalPathDelay01Z (
            OutSignal       => TDO,
            OutSignalName   => "TDO",
            OutTemp         => TDO_zd,
            GlitchData      => TDO_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => TCK'LAST_EVENT,
                      PathDelay         => tpd_TCK_TDO,
                      PathCondition     => TRUE)
            )
        );

    END PROCESS JTAG;

    END BLOCK;

END vhdl_behavioral;
