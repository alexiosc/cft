--------------------------------------------------------------------------------
--  File Name: std8996.vhd
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
--   V1.0    M.Radmanovic  04 Mar 12   Initial release
--
--
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
--
--  Library:    STD
--  Technology: 54/74XXX
--  Part:       STD8996
--  Description: 10-Bit Addressable Scan Ports Multidrop-Addressable JTAG Tap
--               Transceivers
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;

LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.conversions.ALL;
--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std8996 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A4                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A5                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A6                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A7                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A8                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A9                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_BYPNeg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_PTDI                : VitalDelayType01 := VitalZeroDelay01;
        tipd_STDI                : VitalDelayType01 := VitalZeroDelay01;
        tipd_PTCK                : VitalDelayType01 := VitalZeroDelay01;
        tipd_PTMS                : VitalDelayType01 := VitalZeroDelay01;
        tipd_PTRSTNeg            : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_PTCK_STCK            : VitalDelayType01 := UnitDelay01;
        tpd_PTRSTNeg_STRSTNeg    : VitalDelayType01 := UnitDelay01;
        tpd_BYPNeg_CONNeg        : VitalDelayType01 := UnitDelay01;
        tpd_BYPNeg_STMS          : VitalDelayType01 := UnitDelay01;
        tpd_PTCK_CONNeg          : VitalDelayType01 := UnitDelay01;
        tpd_PTCK_PTDO            : VitalDelayType01Z := UnitDelay01Z;
        tpd_PTCK_STMS            : VitalDelayType01 := UnitDelay01;
        tpd_PTDI_STDO            : VitalDelayType01 := UnitDelay01;
        tpd_PTMS_STMS            : VitalDelayType01 := UnitDelay01;
        tpd_PTRSTNeg_STMS        : VitalDelayType01 := UnitDelay01;
        tpd_STDI_PTDO            : VitalDelayType01 := UnitDelay01;
        tpd_BYPNeg_PTDO          : VitalDelayType01Z := UnitDelay01Z;
        tpd_BYPNeg_STDO          : VitalDelayType01Z := UnitDelay01Z;
        tpd_PTCK_STDO            : VitalDelayType01Z := UnitDelay01Z;
        tpd_PTRSTNeg_PTDO        : VitalDelayType01Z := UnitDelay01Z;
        tpd_PTRSTNeg_STDO        : VitalDelayType01Z := UnitDelay01Z;
        -- tsetup values: setup times
        tsetup_PTDI_PTCK         : VitalDelayType := UnitDelay;
        tsetup_PTMS_PTCK         : VitalDelayType := UnitDelay;
        tsetup_A0_PTCK           : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_PTDI_PTCK          : VitalDelayType := UnitDelay;
        thold_PTMS_PTCK          : VitalDelayType := UnitDelay;
        thold_A0_PTCK            : VitalDelayType := UnitDelay;
        -- tperiod min (calculated as 1/max freq)
        tperiod_PTCK             : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_PTCK_posedge         : VitalDelayType := UnitDelay;
        tpw_PTCK_negedge         : VitalDelayType := UnitDelay;
        tpw_PTRSTNeg_negedge     : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        A0              : IN    std_logic := 'U';
        A1              : IN    std_logic := 'U';
        A2              : IN    std_logic := 'U';
        A3              : IN    std_logic := 'U';
        A4              : IN    std_logic := 'U';
        A5              : IN    std_logic := 'U';
        A6              : IN    std_logic := 'U';
        A7              : IN    std_logic := 'U';
        A8              : IN    std_logic := 'U';
        A9              : IN    std_logic := 'U';
        BYPNeg          : IN    std_logic := 'U';
        CONNeg          : OUT   std_logic := 'U';
        PTDI            : IN    std_logic := 'U';
        PTCK            : IN    std_logic := 'U';
        PTDO            : OUT   std_logic := 'U';
        PTMS            : IN    std_logic := 'U';
        PTRSTNeg        : IN    std_logic := 'U';
        STDI            : IN    std_logic := 'U';
        STCK            : OUT   std_logic := 'U';
        STDO            : OUT   std_logic := 'U';
        STMS            : OUT   std_logic := 'U';
        STRSTNeg        : OUT   std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std8996 : ENTITY IS TRUE;
END std8996;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std8996 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS FALSE;

    CONSTANT partID             : STRING := "std8996";
    CONSTANT RSA                : std_logic_vector(9 downto 0) := "0000000000";
    CONSTANT DSA                : std_logic_vector(9 downto 0) := "1111111110";
    CONSTANT TSA                : std_logic_vector(9 downto 0) := "1111111111";

    SIGNAL A0_ipd              : std_ulogic := 'U';
    SIGNAL A1_ipd              : std_ulogic := 'U';
    SIGNAL A2_ipd              : std_ulogic := 'U';
    SIGNAL A3_ipd              : std_ulogic := 'U';
    SIGNAL A4_ipd              : std_ulogic := 'U';
    SIGNAL A5_ipd              : std_ulogic := 'U';
    SIGNAL A6_ipd              : std_ulogic := 'U';
    SIGNAL A7_ipd              : std_ulogic := 'U';
    SIGNAL A8_ipd              : std_ulogic := 'U';
    SIGNAL A9_ipd              : std_ulogic := 'U';
    SIGNAL BYPNeg_ipd          : std_ulogic := 'U';
    SIGNAL PTDI_ipd            : std_ulogic := 'U';
    SIGNAL STDI_ipd            : std_ulogic := 'U';
    SIGNAL PTCK_ipd            : std_ulogic := 'U';
    SIGNAL PTMS_ipd            : std_ulogic := 'U';
    SIGNAL PTRSTNeg_ipd        : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_0  : VitalWireDelay (A0_ipd, A0, tipd_A0);
        w_1  : VitalWireDelay (A1_ipd, A1, tipd_A1);
        w_2  : VitalWireDelay (A2_ipd, A2, tipd_A2);
        w_3  : VitalWireDelay (A3_ipd, A3, tipd_A3);
        w_4  : VitalWireDelay (A4_ipd, A4, tipd_A4);
        w_5  : VitalWireDelay (A5_ipd, A5, tipd_A5);
        w_6  : VitalWireDelay (A6_ipd, A6, tipd_A6);
        w_7  : VitalWireDelay (A7_ipd, A7, tipd_A7);
        w_8  : VitalWireDelay (A8_ipd, A8, tipd_A8);
        w_9  : VitalWireDelay (A9_ipd, A9, tipd_A9);
        w_10 : VitalWireDelay (BYPNeg_ipd, BYPNeg, tipd_BYPNeg);
        w_12 : VitalWireDelay (PTDI_ipd, PTDI, tipd_PTDI);
        w_13 : VitalWireDelay (PTCK_ipd, PTCK, tipd_PTCK);
        w_15 : VitalWireDelay (PTMS_ipd, PTMS, tipd_PTMS);
        w_16 : VitalWireDelay (PTRSTNeg_ipd, PTRSTNeg, tipd_PTRSTNeg);
        w_17 : VitalWireDelay (STDI_ipd, STDI, tipd_STDI);

    END BLOCK;

    ---------------------------------------------------------------------------
    -- Main Behavior Block
    ---------------------------------------------------------------------------
    Behavior: BLOCK

        PORT (
            A              : IN    std_logic_vector(9 downto 0);
            BYPNeg         : IN    std_ulogic := 'U';
            CONNeg         : OUT   std_ulogic := 'U';
            PTDI           : IN    std_ulogic := '1';
            PTCK           : IN    std_ulogic := 'U';
            PTMS           : IN    std_ulogic := 'U';
            PTDO           : OUT   std_ulogic := 'U';
            PTRSTNeg       : IN    std_ulogic := 'U';
            STDI           : IN    std_ulogic := 'U';
            STCK           : OUT   std_ulogic := 'U';
            STMS           : OUT   std_ulogic := 'U';
            STDO           : OUT   std_ulogic := 'U';
            STRSTNeg       : OUT   std_ulogic := 'U'
        );
        PORT MAP (
             A(9)       => A9_ipd,
             A(8)       => A8_ipd,
             A(7)       => A7_ipd,
             A(6)       => A6_ipd,
             A(5)       => A5_ipd,
             A(4)       => A4_ipd,
             A(3)       => A3_ipd,
             A(2)       => A2_ipd,
             A(1)       => A1_ipd,
             A(0)       => A0_ipd,
             BYPNeg     => BYPNeg_ipd,
             CONNeg     => CONNeg,
             PTDI       => PTDI_ipd,
             PTCK       => PTCK_ipd,
             PTMS       => PTMS_ipd,
             PTDO       => PTDO,
             PTRSTNeg   => PTRSTNeg_ipd,
             STDI       => STDI_ipd,
             STCK       => STCK,
             STMS       => STMS,
             STDO       => STDO,
             STRSTNeg   => STRSTNeg
        );

        SIGNAL PTDI_int       : std_logic := 'U';
        SIGNAL PTMS_int       : std_logic := 'U';
        SIGNAL STDI_int       : std_logic := 'U';
        SIGNAL PTRSTNeg_int   : std_logic := 'U';
        SIGNAL BYPNeg_int     : std_logic := 'U';
        SIGNAL A_int          : std_logic_vector(9 downto 0);

        -- Functionality Results Variables
        SIGNAL STCK_zd        : std_logic := 'U';
        SIGNAL STRSTNeg_zd    : std_logic := 'U';
        SIGNAL CONNeg_zd      : std_logic := 'U';
        SIGNAL STDO_zd        : std_logic := 'U';
        SIGNAL STMS_zd        : std_logic := 'U';
        SIGNAL PTDO_zd        : std_logic := 'U';
        SIGNAL PTDO_ack       : std_logic := 'U';
        SIGNAL STMS0          : std_logic := 'U';

        TYPE status_type IS (RESET,
                             DISCONNECTED,
                             CONNECTED,
                             ACKNOWLEDGE,
                             MULTICAST
                             );

        SIGNAL STATUS         : status_type;

    BEGIN

        --pull-up
        PTDI_int <= '1' WHEN PTDI = 'Z' ELSE PTDI;
        PTMS_int <= '1' WHEN PTMS = 'Z' ELSE PTMS;
        STDI_int <= '1' WHEN STDI = 'Z' ELSE STDI;
        PTRSTNeg_int <= '1' WHEN PTRSTNeg = 'Z' ELSE PTRSTNeg;
        BYPNeg_int <= '1' WHEN BYPNeg = 'Z' ELSE BYPNeg;
        A_int(0) <= '1' WHEN A(0) = 'Z' ELSE A(0);
        A_int(1) <= '1' WHEN A(1) = 'Z' ELSE A(1);
        A_int(2) <= '1' WHEN A(2) = 'Z' ELSE A(2);
        A_int(3) <= '1' WHEN A(3) = 'Z' ELSE A(3);
        A_int(4) <= '1' WHEN A(4) = 'Z' ELSE A(4);
        A_int(5) <= '1' WHEN A(5) = 'Z' ELSE A(5);
        A_int(6) <= '1' WHEN A(6) = 'Z' ELSE A(6);
        A_int(7) <= '1' WHEN A(7) = 'Z' ELSE A(7);
        A_int(8) <= '1' WHEN A(8) = 'Z' ELSE A(8);
        A_int(9) <= '1' WHEN A(9) = 'Z' ELSE A(9);

        STCK_zd <= PTCK;
        STRSTNeg_zd <= PTRSTNeg_int;

        STDO_zd <= PTDI_int WHEN BYPNeg_int = '0' ELSE
                   'Z' WHEN PTRSTNeg_int = '0' ELSE
                   'Z' WHEN STATUS = DISCONNECTED ELSE
                   'Z' WHEN STATUS = RESET ELSE
                   'Z' WHEN STATUS = ACKNOWLEDGE ELSE
                   PTDI_int WHEN STATUS = CONNECTED ELSE
                   PTDI_int WHEN STATUS = MULTICAST;

        PTDO_zd <= STDI_int WHEN BYPNeg_int = '0' ELSE
                   'Z' WHEN PTRSTNeg_int = '0' ELSE
                   'Z' WHEN STATUS = DISCONNECTED ELSE
                   PTDO_ack WHEN STATUS = ACKNOWLEDGE ELSE
                   'Z' WHEN STATUS = RESET ELSE
                   STDI_int WHEN STATUS = CONNECTED ELSE
                   'Z' WHEN STATUS = MULTICAST;

        STMS_zd <= 'H' WHEN (BYPNeg_int = '0' AND PTRSTNeg_int = '0') ELSE
                   PTMS_int WHEN (BYPNeg_int = '0' AND
                                  PTRSTNeg_int = '1') ELSE
                   'H' WHEN PTRSTNeg = '0' ELSE
                   'H' WHEN STATUS = RESET ELSE
                   STMS0 WHEN STATUS = ACKNOWLEDGE ELSE
                   PTMS_int WHEN STATUS = CONNECTED ELSE
                   STMS0 WHEN STATUS = DISCONNECTED ELSE
                   PTMS_int WHEN STATUS = MULTICAST;

        CONNeg_zd <= 'L' WHEN BYPNeg_int = '0' ELSE
                     'H' WHEN PTRSTNeg_int = '0' ELSE
                     'H' WHEN STATUS = DISCONNECTED ELSE
                     'H' WHEN STATUS = ACKNOWLEDGE ELSE
                     'H' WHEN STATUS = RESET ELSE
                     'L' WHEN STATUS = CONNECTED ELSE
                     'L' WHEN STATUS = MULTICAST;

    ------------------------------------------------------------------------
    -- Main Behaviour Process
    ------------------------------------------------------------------------
    Behaviour : PROCESS (PTCK, PTRSTNeg, PTMS, BYPNeg, PTDI)

        -- Type definitions
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
                                Update_IR,
                                IDLE_0_in,
                                SELECT_0_in,
                                SELECT_1_in,
                                data_in,
                                IDLE_0_out,
                                IDLE_1_out,
                                SELECT_0_out,
                                SELECT_1_out,
                                A0_A9_out
                                );

        TYPE connect_status_type IS (RESET,
                                     DISCONNECTED,
                                     CONNECTED,
                                     ACKNOWLEDGE,
                                     MULTICAST
                                     );

        VARIABLE TAP_state     : tap_state_type;
        VARIABLE stable_state  : tap_state_type;
        VARIABLE next_state    : tap_state_type;

        VARIABLE connect_status : connect_status_type;

        VARIABLE cnt_idle      : INTEGER:= 0;
        VARIABLE cnt_select    : INTEGER:= 0;
        VARIABLE addr_cnt      : INTEGER:= 0;

        VARIABLE addr_reg      : std_logic_vector(9 downto 0);
        VARIABLE MATCH         : std_logic_vector(19 downto 0);
        VARIABLE bit_pair      : std_ulogic_vector(1 downto 0);
        VARIABLE TMS_prev      : std_logic;
        VARIABLE hard_error    : std_logic := '0';
        VARIABLE soft_error    : std_logic := '0';
        VARIABLE Select_protocol    : std_logic := '0';

        -- Timing Check Variables
        VARIABLE Tviol_PTDI_PTCK         : X01 := '0';
        VARIABLE TD_PTDI_PTCK            : VitalTimingDataType;

        VARIABLE Tviol_PTMS_PTCK         : X01 := '0';
        VARIABLE TD_PTMS_PTCK            : VitalTimingDataType;

        VARIABLE Tviol_A0_PTCK           : X01 := '0';
        VARIABLE TD_A0_PTCK              : VitalTimingDataType;

        VARIABLE Pviol_PTCK              : X01 := '0';
        VARIABLE PD_PTCK      : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_PTRSTNeg          : X01 := '0';
        VARIABLE PD_PTRSTNeg  : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation               : X01 := '0';

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

                VitalSetupHoldCheck (
                    TestSignal      => PTDI,
                    TestSignalName  => "PTDI",
                    RefSignal       => PTCK,
                    RefSignalName   => "PTCK",
                    SetupHigh       => tsetup_PTDI_PTCK,
                    SetupLow        => tsetup_PTDI_PTCK,
                    HoldHigh        => thold_PTDI_PTCK,
                    HoldLow         => thold_PTDI_PTCK,
                    CheckEnabled    => true,
                    RefTransition   => '/',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_PTDI_PTCK,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_PTDI_PTCK );

                VitalSetupHoldCheck (
                    TestSignal      => PTMS,
                    TestSignalName  => "PTMS",
                    RefSignal       => PTCK,
                    RefSignalName   => "PTCK",
                    SetupHigh       => tsetup_PTMS_PTCK,
                    SetupLow        => tsetup_PTMS_PTCK,
                    HoldHigh        => thold_PTMS_PTCK,
                    HoldLow         => thold_PTMS_PTCK,
                    CheckEnabled    => true,
                    RefTransition   => '/',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_PTMS_PTCK,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_PTMS_PTCK );

                VitalSetupHoldCheck (
                    TestSignal      => A,
                    TestSignalName  => "A",
                    RefSignal       => PTCK,
                    RefSignalName   => "PTCK",
                    SetupHigh       => tsetup_A0_PTCK,
                    SetupLow        => tsetup_A0_PTCK,
                    HoldHigh        => thold_A0_PTCK,
                    HoldLow         => thold_A0_PTCK,
                    CheckEnabled    => true,
                    RefTransition   => '\',
                    HeaderMsg       => InstancePath & PartID,
                    TimingData      => TD_A0_PTCK,
                    XOn             => XOn,
                    MsgOn           => MsgOn,
                    Violation       => Tviol_A0_PTCK );

                VitalPeriodPulseCheck (
                    TestSignal      =>  PTCK,
                    TestSignalName  =>  "PTCK",
                    Period          =>  tperiod_PTCK,
                    PulseWidthLow   =>  tpw_PTCK_negedge,
                    PulseWidthHigh  =>  tpw_PTCK_posedge,
                    PeriodData      =>  PD_PTCK,
                    XOn             =>  XOn,
                    MsgOn           =>  MsgOn,
                    Violation       =>  Pviol_PTCK,
                    HeaderMsg       =>  InstancePath & PartID,
                    CheckEnabled    =>  true );

                VitalPeriodPulseCheck (
                    TestSignal      =>  PTRSTNeg,
                    TestSignalName  =>  "PTRSTNeg",
                    PulseWidthLow   =>  tpw_PTRSTNeg_negedge,
                    PeriodData      =>  PD_PTRSTNeg,
                    XOn             =>  XOn,
                    MsgOn           =>  MsgOn,
                    Violation       =>  Pviol_PTRSTNeg,
                    HeaderMsg       =>  InstancePath & PartID,
                    CheckEnabled    =>  true );

                Violation := Tviol_PTDI_PTCK OR Tviol_PTMS_PTCK OR
                             Tviol_A0_PTCK OR Pviol_PTCK OR Pviol_PTRSTNeg;

                ASSERT Violation = '0'
                    REPORT InstancePath & partID & ": simulation may be" &
                           " inaccurate due to timing violations"
                    SEVERITY Warning;

        END IF; -- Timing Check Section

        --------------------------------------------------------------------
        -- Functional Section
        --------------------------------------------------------------------

        -- Power Up & Reset JTAG
        IF NOW = 0 ns OR PTRSTNeg_int = '0' OR BYPNeg_int = '0' THEN
            TAP_state := Test_Logic_Reset;
        END IF;

        -- TAP State Machine
        IF rising_edge(PTCK) AND PTRSTNeg_int = '1'
           AND BYPNeg_int = '1' THEN
            CASE TAP_state IS
                WHEN Test_Logic_Reset =>
                    IF PTMS_int = '1' THEN
                        IF PTDI_int = '1' THEN

                            IF cnt_idle = 1 THEN
                                TAP_state := IDLE_0_in;
                                cnt_idle := 0;
                                stable_state := Test_Logic_Reset;
                                next_state := Run_Test_Idle;
                                TMS_prev := PTMS_int;
                                Select_protocol := '1';
                                addr_cnt := 0;
                                soft_error := '0';
                                hard_error := '0';
                            ELSE
                                cnt_idle := 1;
                                TAP_state := Test_Logic_Reset;
                            END IF;
                        ELSE
                            cnt_idle := 0;
                        END IF;
                    ELSE
                        TAP_state := Run_Test_Idle;
                        cnt_idle := 0;
                        IF PTDI_int = '1' THEN
                            cnt_idle := 1;
                        END IF;
                    END IF;
                WHEN Run_Test_Idle =>
                    IF PTMS_int = '1' THEN
                        TAP_state := Select_DR_Scan;
                        cnt_idle := 0;
                    ELSE
                        IF PTDI_int = '1' THEN

                            IF cnt_idle = 1 THEN
                                TAP_state := IDLE_0_in;
                                cnt_idle := 0;
                                stable_state := Run_Test_Idle;
                                next_state := Select_DR_Scan;
                                TMS_prev := PTMS_int;
                                Select_protocol := '1';
                                addr_cnt := 0;
                                soft_error := '0';
                                hard_error := '0';
                            ELSE
                                cnt_idle := 1;
                                TAP_state := Run_Test_Idle;
                            END IF;
                        ELSE
                            cnt_idle := 0;
                        END IF;
                    END IF;
                WHEN Select_DR_Scan =>
                    IF PTMS_int = '1' THEN
                        TAP_state := Select_IR_Scan;
                    ELSE
                        TAP_state := Capture_DR;
                    END IF;
                WHEN Capture_DR =>
                    IF PTMS_int = '1' THEN
                        TAP_state := Exit1_DR;
                    ELSE
                        TAP_state := Shift_DR;
                    END IF;
                WHEN Shift_DR =>
                    IF PTMS_int = '1' THEN
                        TAP_state := Exit1_DR;
                    ELSE
                        TAP_state := Shift_DR;
                    END IF;
                WHEN Exit1_DR =>
                    IF PTMS_int = '1' THEN
                        TAP_state := Update_DR;
                    ELSE
                        TAP_state := Pause_DR;
                        IF PTDI_int = '1' THEN
                            cnt_idle := 1;
                        END IF;
                    END IF;
                WHEN Pause_DR =>
                    IF PTMS_int = '1' THEN
                        TAP_state := Exit2_DR;
                        cnt_idle := 0;
                    ELSE
                        IF PTDI_int = '1' THEN

                            IF cnt_idle = 1 THEN
                                TAP_state := IDLE_0_in;
                                cnt_idle := 0;
                                addr_cnt := 0;
                                stable_state := Pause_DR;
                                next_state := Exit2_DR;
                                TMS_prev := PTMS_int;
                                Select_protocol := '1';
                                soft_error := '0';
                                hard_error := '0';
                            ELSE
                                cnt_idle := 1;
                                TAP_state := Pause_DR;
                            END IF;
                        ELSE
                            cnt_idle := 0;
                        END IF;
                    END IF;
                WHEN Exit2_DR =>
                    IF PTMS_int = '1' THEN
                        TAP_state := Update_DR;
                    ELSE
                        TAP_state := Shift_DR;
                    END IF;
                WHEN Update_DR =>
                    IF PTMS_int = '1' THEN
                        TAP_state := Select_DR_Scan;
                    ELSE
                        TAP_state := Run_Test_Idle;
                        IF PTDI_int = '1' THEN
                            cnt_idle := 1;
                        END IF;
                    END IF;
                WHEN Select_IR_Scan =>
                    IF PTMS_int = '1' THEN
                        IF PTDI_int = '1' THEN
                            cnt_idle := 1;
                        END IF;
                        TAP_state := Test_Logic_Reset;
                    ELSE
                        TAP_state := Capture_IR;
                    END IF;
                WHEN Capture_IR =>
                    IF PTMS_int = '1' THEN
                        TAP_state := Exit1_IR;
                    ELSE
                        TAP_state := Shift_IR;
                    END IF;
                WHEN Shift_IR =>
                    IF PTMS_int = '1' THEN
                        TAP_state := Exit1_IR;
                    ELSE
                        TAP_state := Shift_IR;
                    END IF;
                WHEN Exit1_IR =>
                    IF PTMS_int = '1' THEN
                        TAP_state := Update_IR;
                    ELSE
                        TAP_state := Pause_IR;
                        IF PTDI_int = '1' THEN
                            cnt_idle := 1;
                        END IF;
                    END IF;
                WHEN Pause_IR =>
                    IF PTMS_int = '1' THEN
                        TAP_state := Exit2_IR;
                        cnt_idle := 0;
                    ELSE
                        IF PTDI_int = '1' THEN
                            IF cnt_idle = 1 THEN
                                TAP_state := IDLE_0_in;
                                cnt_idle := 0;
                                addr_cnt := 0;
                                stable_state := Pause_IR;
                                next_state := Exit2_IR;
                                TMS_prev := PTMS_int;
                                Select_protocol := '1';
                                soft_error := '0';
                                hard_error := '0';
                            ELSE
                                cnt_idle := 1;
                                TAP_state := Pause_IR;
                            END IF;
                        ELSE
                            cnt_idle := 0;
                        END IF;
                    END IF;
                WHEN Exit2_IR =>
                    IF PTMS_int = '1' THEN
                        TAP_state := Update_IR;
                    ELSE
                        TAP_state := Shift_IR;
                    END IF;
                WHEN Update_IR =>
                    IF PTMS_int = '1' THEN
                        TAP_state := Select_DR_Scan;
                    ELSE
                        TAP_state := Run_Test_Idle;
                        IF PTDI_int = '1' THEN
                            cnt_idle := 1;
                        END IF;
                    END IF;
                WHEN IDLE_0_in =>
                    IF PTMS_int = TMS_prev THEN

                        IF cnt_idle = 1 THEN
                            cnt_idle := 0;
                            bit_pair(1) := PTDI_int;
                            IF bit_pair = "00" THEN
                                TAP_state := SELECT_0_in;
                            ELSE
                                TAP_state := data_in;
                                soft_error := '1';
                            END IF;
                        ELSE
                            bit_pair(0) := PTDI_int;
                            cnt_idle := 1;
                            TAP_state := IDLE_0_in;
                        END IF;
                    ELSE
                        TAP_state := next_state;
                        cnt_idle := 0;
                        Select_protocol := '0';
                    END IF;
                WHEN IDLE_0_out =>
                    IF PTMS_int = TMS_prev THEN
                        IF cnt_idle = 1 THEN
                            TAP_state := SELECT_0_out;
                            cnt_idle := 0;
                        ELSE
                            cnt_idle := 1;
                            TAP_state := IDLE_0_out;
                        END IF;
                    ELSE
                        TAP_state := next_state;
                        cnt_idle := 0;
                        hard_error := '1';
                        connect_status := DISCONNECTED;--hard error
                    END IF;
                WHEN IDLE_1_out =>
                    IF PTMS_int = TMS_prev THEN
                        IF cnt_idle = 1 THEN
                            TAP_state := stable_state;
                            cnt_idle := 0;
                            --end of acknowledge protocol
                            connect_status := CONNECTED;
                        ELSE
                            cnt_idle := 1;
                            TAP_state := IDLE_1_out;
                        END IF;
                    ELSE
                        TAP_state := next_state;
                        hard_error := '1';
                        cnt_idle := 0;
                        connect_status := DISCONNECTED;--hard error
                    END IF;
                WHEN SELECT_0_in =>
                    IF PTMS_int = TMS_prev THEN
                        IF cnt_idle = 1 THEN
                            cnt_idle := 0;
                            bit_pair(1) := PTDI_int;
                            CASE bit_pair IS
                                WHEN "00" =>
                                    TAP_state := SELECT_0_in;
                                    soft_error := '1';
                                WHEN "01" =>
                                    TAP_state := data_in;
                                    addr_reg(0) := '0';
                                    addr_cnt := 1;
                                WHEN "10" =>
                                    TAP_state := data_in;
                                    addr_reg(0) := '1';
                                    addr_cnt := 1;
                                WHEN "11" =>
                                    --I(S)I
                                    TAP_state := stable_state;
                                    soft_error := '1';
                                    Select_protocol := '0';
                                WHEN others =>
                                    null;
                            END CASE;
                        ELSE
                            bit_pair(0) := PTDI_int;
                            cnt_idle := 1;
                            TAP_state := SELECT_0_in;
                        END IF;
                    ELSE
                        TAP_state := next_state;
                        cnt_idle := 0;
                        Select_protocol := '0';
                    END IF;
                WHEN SELECT_1_in =>
                    IF PTMS_int = TMS_prev THEN
                        IF cnt_idle = 1 THEN
                            cnt_idle := 0;
                            bit_pair(1) := PTDI_int;
                            CASE bit_pair IS
                                WHEN "00" =>
                                    TAP_state := SELECT_1_in;
                                    IF soft_error = '0' THEN
                                        hard_error := '1';
                                        soft_error := '1';
                                        connect_status := DISCONNECTED;
                                    END IF;
                                WHEN "01" =>
                                    TAP_state := data_in;
                                    IF soft_error = '0'
                                       AND hard_error = '0' THEN
                                        hard_error := '1';
                                        connect_status := DISCONNECTED;
                                    END IF;
                                WHEN "10" =>
                                    TAP_state := data_in;
                                    IF soft_error = '0'
                                       AND hard_error = '0' THEN
                                        hard_error := '1';
                                        connect_status := DISCONNECTED;
                                    END IF;
                                WHEN "11" =>
                                    --IS(S)(D)(S)I
                                    IF soft_error = '0'
                                       AND hard_error = '0' THEN
                                        IF (addr_reg = RSA) THEN
                                            connect_status := RESET;
                                            TAP_state := stable_state;
                                        ELSIF (addr_reg = TSA) THEN
                                            IF stable_state = Pause_IR OR
                                               stable_state = Pause_DR THEN
                                                connect_status := MULTICAST;
                                            ELSE
                                                connect_status := DISCONNECTED;
                                            END IF;
                                            TAP_state := stable_state;
                                        ELSIF (addr_reg /= A_int) OR
                                            (addr_reg = DSA) THEN -- no match
                                            connect_status := DISCONNECTED;
                                            TAP_state := stable_state;
                                        ELSE
                                            TAP_state := IDLE_0_out;
                                            connect_status := ACKNOWLEDGE;
                                        END IF;
                                    ELSE
                                        TAP_state := stable_state;
                                    END IF;
                                WHEN others =>
                                    null;
                            END CASE;
                        ELSE
                            bit_pair(0) := PTDI_int;
                            cnt_idle := 1;
                            TAP_state := SELECT_1_in;
                        END IF;

                    ELSE
                        TAP_state := next_state;
                        cnt_idle := 0;
                        IF soft_error = '0' THEN
                            hard_error := '1';
                            connect_status := DISCONNECTED;--hard error
                        END IF;
                    END IF;
                WHEN SELECT_0_out =>
                    IF PTMS_int = TMS_prev THEN
                        IF cnt_select = 1 THEN
                            TAP_state := A0_A9_out;
                            cnt_select := 0;
                        ELSE
                            cnt_select := 1;
                            TAP_state := SELECT_0_out;
                        END IF;
                    ELSE
                        TAP_state := next_state;
                        cnt_idle := 0;
                        hard_error := '1';
                        connect_status := DISCONNECTED;--hard error
                    END IF;
                WHEN SELECT_1_out =>
                    IF PTMS_int = TMS_prev THEN
                        IF cnt_select = 1 THEN
                            TAP_state := IDLE_1_out;
                            cnt_select := 0;
                        ELSE
                            cnt_select := 1;
                            TAP_state := SELECT_1_out;
                        END IF;
                    ELSE
                        TAP_state := next_state;
                        hard_error := '1';
                        cnt_idle := 0;
                        connect_status := DISCONNECTED;--hard error
                    END IF;
                WHEN data_in =>
                    IF PTMS_int = TMS_prev THEN
                        IF cnt_idle = 1 THEN
                            cnt_idle := 0;
                            bit_pair(1) := PTDI_int;
                            CASE bit_pair IS
                                WHEN "00" =>
                                    TAP_state := SELECT_1_in;
                                    IF addr_cnt /= 10 AND
                                       soft_error = '0' THEN
                                        hard_error := '1';
                                        connect_status := DISCONNECTED;
                                    END IF;
                                WHEN "01" =>
                                    TAP_state := data_in;
                                    IF addr_cnt = 10 THEN
                                        IF addr_reg = RSA THEN
                                            addr_cnt := 9;
                                        ELSE
                                            IF soft_error = '0' THEN
                                                hard_error := '1';
                                                connect_status := DISCONNECTED;
                                            END IF;
                                            addr_cnt := 9;
                                        END IF;
                                    END IF;
                                    addr_reg(addr_cnt) := '0';
                                    addr_cnt := addr_cnt+1;
                                WHEN "10" =>
                                    TAP_state := data_in;
                                    IF addr_cnt = 10 THEN
                                        IF addr_reg = TSA THEN
                                            addr_cnt := 9;
                                        ELSE
                                            IF soft_error = '0' THEN
                                                hard_error := '1';
                                                connect_status := DISCONNECTED;
                                            END IF;
                                            addr_cnt := 9;
                                        END IF;
                                    END IF;
                                    addr_reg(addr_cnt) := '1';
                                    addr_cnt :=addr_cnt+1;
                                WHEN "11" =>
                                    --IS(S)(D)I
                                    TAP_state := stable_state;
                                    IF soft_error = '0' THEN
                                        soft_error := '1';
                                        Select_protocol := '0';
                                        hard_error := '1';
                                        connect_status := DISCONNECTED;
                                    END IF;
                                WHEN others =>
                                    null;
                            END CASE;
                        ELSE
                            bit_pair(0) := PTDI_int;
                            cnt_idle := 1;
                            TAP_state := data_in;
                        END IF;

                    ELSE
                        TAP_state := next_state;
                        IF soft_error = '0' THEN
                            hard_error := '1';
                            cnt_idle := 0;
                            connect_status := DISCONNECTED;--hard error
                        END IF;
                    END IF;
                WHEN A0_A9_out =>
                    IF PTMS_int = TMS_prev THEN
                        IF addr_cnt < 19 THEN
                            addr_cnt := addr_cnt + 1;
                            TAP_state := A0_A9_out;
                        ELSIF addr_cnt = 19 THEN
                            addr_cnt := 0;
                            TAP_state := SELECT_1_out;
                        END IF;
                    ELSE
                        TAP_state := next_state;
                        hard_error := '1';
                        cnt_idle := 0;
                        connect_status := DISCONNECTED;--hard error
                    END IF;
            END CASE;
        END IF;

        FOR I IN 0 TO 9 LOOP
            IF A_int(I) = '1' THEN
                MATCH(2*I) := '0';
                MATCH(2*I + 1) := '1';
            ELSE
                MATCH(2*I) := '1';
                MATCH(2*I + 1) := '0';
            END IF;
        END LOOP;

        IF falling_edge(PTCK) AND PTRSTNeg_int = '1' AND
           BYPNeg_int = '1' THEN
            STMS0 <= STMS_zd;
            CASE connect_status IS
                WHEN CONNECTED =>
                    STATUS <= CONNECTED;
                WHEN DISCONNECTED =>
                    STATUS <= DISCONNECTED;
                WHEN RESET =>
                    STATUS <= RESET;
                WHEN MULTICAST =>
                    STATUS <= MULTICAST;
                WHEN ACKNOWLEDGE =>
                    IF TAP_state = IDLE_0_out OR
                       TAP_state = IDLE_1_out THEN
                        PTDO_ack <= '1';
                    ELSIF TAP_state = SELECT_0_out OR
                       TAP_state = SELECT_1_out THEN
                        PTDO_ack <= '0';
                        addr_cnt := 0;
                    ELSIF TAP_state = A0_A9_out THEN
                        PTDO_ack <= MATCH(addr_cnt);
                    END IF;
                    STATUS <= ACKNOWLEDGE;
            END CASE;
        ELSIF PTRSTNeg_int = '0' AND BYPNeg_int = '1' THEN
            STATUS <= RESET;
            connect_status := RESET;
        END IF;

    END PROCESS Behaviour;

    ---------------------------------------------------------------------------
    -- Path Delay Section
    ---------------------------------------------------------------------------
    STCK_OUT: PROCESS(STCK_zd)

        VARIABLE STCK_GlitchData : VitalGlitchDataType;
    BEGIN
        VitalPathDelay01(
            OutSignal     => STCK,
            OutSignalName => "STCK",
            OutTemp       => STCK_zd,
            GlitchData    => STCK_GlitchData,
            Paths         => (
            0 => (InputChangeTime   => PTCK'LAST_EVENT,
                  PathDelay         => tpd_PTCK_STCK,
                  PathCondition     => true)
            )
        );
    END PROCESS STCK_OUT;

    STRST_OUT: PROCESS(STRSTNeg_zd)

        VARIABLE STRSTNeg_GlitchData : VitalGlitchDataType;
    BEGIN
        VitalPathDelay01(
            OutSignal     => STRSTNeg,
            OutSignalName => "STRSTNeg",
            OutTemp       => STRSTNeg_zd,
            GlitchData    => STRSTNeg_GlitchData,
            Paths         => (
            0 => (InputChangeTime   => PTRSTNeg'LAST_EVENT,
                  PathDelay         => tpd_PTRSTNeg_STRSTNeg,
                  PathCondition     => true)
            )
        );
    END PROCESS STRST_OUT;

    STDO_OUT: PROCESS(STDO_zd)

        VARIABLE STDO_GlitchData : VitalGlitchDataType;
    BEGIN
        VitalPathDelay01Z (
            OutSignal       => STDO,
            OutSignalName   => "STDO",
            OutTemp         => STDO_zd,
            GlitchData      => STDO_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime => BYPNeg'LAST_EVENT,
                      PathDelay       => tpd_BYPNeg_STDO,
                      PathCondition   => BYPNeg = '0'),
                1 => (InputChangeTime => PTDI'LAST_EVENT,
                      PathDelay       => VitalExtendtofillDelay(tpd_PTDI_STDO),
                      PathCondition   => TRUE),
                2 => (InputChangeTime => PTCK'LAST_EVENT,
                      PathDelay       => tpd_PTCK_STDO,
                      PathCondition   => TRUE),
                3 => (InputChangeTime => PTRSTNeg'LAST_EVENT,
                      PathDelay       => tpd_PTRSTNeg_STDO,
                      PathCondition   => PTRSTNeg = '0')
            )
        );
    END PROCESS STDO_OUT;

    PTDO_OUT: PROCESS(PTDO_zd)

        VARIABLE PTDO_GlitchData : VitalGlitchDataType;
    BEGIN
        VitalPathDelay01Z (
            OutSignal       => PTDO,
            OutSignalName   => "PTDO",
            OutTemp         => PTDO_zd,
            GlitchData      => PTDO_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime => BYPNeg'LAST_EVENT,
                      PathDelay       => tpd_BYPNeg_PTDO,
                      PathCondition   => BYPNeg = '0'),
                1 => (InputChangeTime => STDI'LAST_EVENT,
                      PathDelay       => VitalExtendtofillDelay(tpd_STDI_PTDO),
                      PathCondition   => TRUE),
                2 => (InputChangeTime => PTCK'LAST_EVENT,
                      PathDelay       => tpd_PTCK_PTDO,
                      PathCondition   => TRUE),
                3 => (InputChangeTime => PTRSTNeg'LAST_EVENT,
                      PathDelay       => tpd_PTRSTNeg_PTDO,
                      PathCondition   => PTRSTNeg = '0')
            )
        );
    END PROCESS PTDO_OUT;

    STMS_OUT: PROCESS(STMS_zd)

        VARIABLE STMS_GlitchData : VitalGlitchDataType;
    BEGIN
        VitalPathDelay01 (
            OutSignal       => STMS,
            OutSignalName   => "STMS",
            OutTemp         => STMS_zd,
            GlitchData      => STMS_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => BYPNeg'LAST_EVENT,
                      PathDelay         => tpd_BYPNeg_STMS,
                      PathCondition     => BYPNeg = '0'),
                1 => (InputChangeTime   => PTCK'LAST_EVENT,
                      PathDelay         => tpd_PTCK_STMS,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => PTMS'LAST_EVENT,
                      PathDelay         => tpd_PTMS_STMS,
                      PathCondition     => TRUE),
                3 => (InputChangeTime   => PTRSTNeg'LAST_EVENT,
                      PathDelay         => tpd_PTRSTNeg_STMS,
                      PathCondition     => PTRSTNeg = '0')
            )
        );
    END PROCESS STMS_OUT;

    CONNeg_OUT: PROCESS(CONNeg_zd)

        VARIABLE CONNeg_GlitchData : VitalGlitchDataType;
    BEGIN
        VitalPathDelay01 (
            OutSignal       => CONNeg,
            OutSignalName   => "CONNeg",
            OutTemp         => CONNeg_zd,
            GlitchData      => CONNeg_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => BYPNeg'LAST_EVENT,
                      PathDelay         => tpd_BYPNeg_CONNeg,
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => PTCK'LAST_EVENT,
                      PathDelay         => tpd_PTCK_CONNeg,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => PTRSTNeg'LAST_EVENT,
                      PathDelay         => tpd_PTRSTNeg_STMS,
                      PathCondition     => PTRSTNeg = '0')
            )
        );
    END PROCESS CONNeg_OUT;

    END BLOCK;

END vhdl_behavioral;
