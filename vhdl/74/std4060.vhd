-------------------------------------------------------------------------------
-- File Name: std4060.vhd
-------------------------------------------------------------------------------
-- Copyright (C) 2005 Free Model Foundry; http://www.FreeModelFoundry.com
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License version 2 as
-- published by the Free Software Foundation.
--
-- MODIFICATION HISTORY:
--
-- version: |    author:    |  mod date: | changes made:
--  V1.0     Dj.Tanasijevic   05 Aug 05   Initial release
-------------------------------------------------------------------------------
-- PART DESCRIPTION:
--
-- Library:     STND
-- Technology:  CMOS
-- Part:        std4060
-- Description: 14-Stage Asynchronous Binary Counters and Oscillators
-------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;

LIBRARY FMF;    USE FMF.gen_utils.ALL;

-------------------------------------------------------------------------------
-- ENTITY DECLARATION
-------------------------------------------------------------------------------
ENTITY std4060 IS

    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_CLKI       : VitalDelayType01  :=  VitalZeroDelay01;
        tipd_CLR        : VitalDelayType01  :=  VitalZeroDelay01;

        -- tpd delays: propagation from input to output
        tpd_CLKI_QD     : VitalDelayType01  :=  UnitDelay01;
        tpd_CLR_QD      : VitalDelayType01  :=  UnitDelay01;

        -- tsetup: setup time, CLR inactive before CLKI low transition
        tsetup_CLR_CLKI : VitalDelayType    := UnitDelay;

        -- tpw values: pulse widths
        tpw_CLKI_posedge   : VitalDelayType := UnitDelay;
        tpw_CLKI_negedge   : VitalDelayType := UnitDelay;
        tpw_CLR_posedge    : VitalDelayType := UnitDelay;

        -- tperiod_min - minimum clock period - 1/max freq
        tperiod_CLKI       : VitalDelayType :=  UnitDelay;   -- 1/fMAX

        -- generic control parameters
        InstancePath    : STRING    :=  DefaultInstancePath;
        TimingChecksOn  : BOOLEAN   :=  DefaultTimingChecks;
        MsgOn           : BOOLEAN   :=  DefaultMsgOn;
        XOn             : BOOLEAN   :=  DefaultXon;

        -- For FMF SDF technology file usage
        TimingModel     : STRING    :=  DefaultTimingModel
    );

    PORT (
        CLKI            : IN  std_ulogic    :=  'U';
        CLR             : IN  std_ulogic    :=  'U';
        CLKO            : OUT std_ulogic    :=  'U';
        CLKONeg         : OUT std_ulogic    :=  'U';
        QD              : OUT std_ulogic    :=  'U';
        QE              : OUT std_ulogic    :=  'U';
        QF              : OUT std_ulogic    :=  'U';
        QG              : OUT std_ulogic    :=  'U';
        QH              : OUT std_ulogic    :=  'U';
        QI              : OUT std_ulogic    :=  'U';
        QJ              : OUT std_ulogic    :=  'U';
        QL              : OUT std_ulogic    :=  'U';
        QM              : OUT std_ulogic    :=  'U';
        QN              : OUT std_ulogic    :=  'U'
    );

    ATTRIBUTE VITAL_LEVEL0 of std4060 : ENTITY IS TRUE;

END std4060;

-------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
-------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std4060 IS

    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    CONSTANT partID     : STRING     := "std4060";

    SIGNAL CLKI_ipd     : std_ulogic := 'X';
    SIGNAL CLR_ipd      : std_ulogic := 'X';

BEGIN
    ---------------------------------------------------------------------------
    -- Wire Delays
    ---------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1: VitalWireDelay (CLKI_ipd, CLKI, tipd_CLKI);
        w_2: VitalWireDelay (CLR_ipd, CLR, tipd_CLR);

    END BLOCK;

    Behavior : BLOCK
        PORT (
            CLKI        : IN  std_ulogic    :=  'U';
            CLR         : IN  std_ulogic    :=  'U';
            CLKO        : OUT std_ulogic    :=  'U';
            CLKONeg     : OUT std_ulogic    :=  'U';
            QD          : OUT std_ulogic    :=  'U';
            QE          : OUT std_ulogic    :=  'U';
            QF          : OUT std_ulogic    :=  'U';
            QG          : OUT std_ulogic    :=  'U';
            QH          : OUT std_ulogic    :=  'U';
            QI          : OUT std_ulogic    :=  'U';
            QJ          : OUT std_ulogic    :=  'U';
            QL          : OUT std_ulogic    :=  'U';
            QM          : OUT std_ulogic    :=  'U';
            QN          : OUT std_ulogic    :=  'U'
            );
        PORT MAP (
            CLKI        => CLKI_ipd,
            CLR         => CLR_ipd,
            CLKO        => CLKO,
            CLKONeg     => CLKONeg,
            QD          => QD,
            QE          => QE,
            QF          => QF,
            QG          => QG,
            QH          => QH,
            QI          => QI,
            QJ          => QJ,
            QL          => QL,
            QM          => QM,
            QN          => QN
            );

        SIGNAL CLKO_zd      : std_logic;
        SIGNAL CLKONeg_zd   : std_logic;

        SIGNAL Q0           : std_ulogic := 'X';
        SIGNAL Q1           : std_ulogic := 'X';
        SIGNAL Q2           : std_ulogic := 'X';
        SIGNAL Q3           : std_ulogic := 'X';
        SIGNAL Q4           : std_ulogic := 'X';
        SIGNAL Q5           : std_ulogic := 'X';
        SIGNAL Q6           : std_ulogic := 'X';
        SIGNAL Q7           : std_ulogic := 'X';
        SIGNAL Q8           : std_ulogic := 'X';
        SIGNAL Q9           : std_ulogic := 'X';
        SIGNAL Q10          : std_ulogic := 'X';
        SIGNAL Q11          : std_ulogic := 'X';
        SIGNAL Q12          : std_ulogic := 'X';
        SIGNAL Q13          : std_ulogic := 'X';
        SIGNAL Q14          : std_ulogic := 'X';

    BEGIN
        Q0 <= CLKI;

    ---------------------------------------------------------------------------
    -- VITAL Timing Checks Procedures
    ---------------------------------------------------------------------------
    VITALTimingCheck : PROCESS (CLKI_ipd, CLR_ipd)
        VARIABLE Tviol_CLR_CLKI : X01                 := '0';
        VARIABLE TD_CLR_CLKI    : VitalTimingDataType;
        VARIABLE Pviol_CLKI     : X01                 := '0';
        VARIABLE PD_CLKI        : VitalPeriodDataType := VitalPeriodDataInit;
        VARIABLE Pviol_CLR      : X01                 := '0';
        VARIABLE PD_CLR         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation             : X01 := '0';

    BEGIN
        IF TimingChecksOn THEN

            Violation := '0';

            -- Setup/Hold Check
            VitalSetupHoldCheck (
                TestSignal      => CLR_ipd,
                TestSignalName  => "CLR_ipd",
                RefSignal       => CLKI_ipd,
                RefSignalName   => "CLKI_ipd",
                SetupLow        => tsetup_CLR_CLKI,
                CheckEnabled    => TRUE,
                RefTransition   => '\',
                HeaderMsg       => InstancePath,
                TimingData      => TD_CLR_CLKI,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLR_CLKI
            );

            -- Pulse Period Checks
            VitalPeriodPulseCheck (
                TestSignal      => CLKI_ipd,
                TestSignalName  => "CLKI_ipd",
                Period          => tperiod_CLKI,
                PulseWidthHigh  => tpw_CLKI_posedge,
                PulseWidthLow   => tpw_CLKI_negedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath,
                PeriodData      => PD_CLKI,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLKI
            );
            VitalPeriodPulseCheck (
                TestSignal      => CLR_ipd,
                TestSignalName  => "CLR_ipd",
                PulseWidthHigh  => tpw_CLR_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath,
                PeriodData      => PD_CLR,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLR
            );

            Violation := Tviol_CLR_CLKI or Pviol_CLKI or Pviol_CLR;

            ASSERT Violation = '0'
                REPORT InstancePath & partID & ": simulation may be" &
                       " inaccurate due to timing violations"
                SEVERITY Warning;

        END IF;
    END PROCESS VITALTimingCheck;

    ------------------------------------------------------------------------
    -- Oscillator Functionality Section
    ------------------------------------------------------------------------
    Oscillator : PROCESS (CLKI, CLR)
    BEGIN
        IF (CLR = '0') THEN
            CLKO_zd    <= CLKI;
            CLKONeg_zd <= NOT CLKI;
        ELSE
            CLKO_zd    <= '0';
            CLKONeg_zd <= '1';
        END IF;
    END PROCESS Oscillator;

    ------------------------------------------------------------------------
    -- Counter Functionality Section
    ------------------------------------------------------------------------

    Cntr1 : PROCESS (Q0, CLR)
    BEGIN
        IF (CLR = '1') THEN
            Q1 <= '0';
        ELSE
            IF falling_edge(Q0) THEN
                Q1 <= NOT Q1;
            END IF;
        END IF;
    END PROCESS Cntr1;

    Cntr2 : PROCESS (Q1, CLR)
    BEGIN
        IF (CLR = '1') THEN
            Q2 <= '0';
        ELSE
            IF falling_edge(Q1) THEN
                Q2 <= NOT Q2;
            END IF;
        END IF;
    END PROCESS Cntr2;

    Cntr3 : PROCESS (Q2, CLR)
    BEGIN
        IF (CLR = '1') THEN
            Q3 <= '0';
        ELSE
            IF falling_edge(Q2) THEN
                Q3 <= NOT Q3;
            END IF;
        END IF;
    END PROCESS Cntr3;

    Cntr4 : PROCESS (Q3, CLR)
    BEGIN
        IF (CLR = '1') THEN
            Q4 <= '0';
        ELSE
            IF falling_edge(Q3) THEN
                Q4 <= NOT Q4;
            END IF;
        END IF;
    END PROCESS Cntr4;

    Cntr5 : PROCESS (Q4, CLR)
    BEGIN
        IF (CLR = '1') THEN
            Q5 <= '0';
        ELSE
            IF falling_edge(Q4) THEN
                Q5 <= NOT Q5;
            END IF;
        END IF;
    END PROCESS Cntr5;

    Cntr6 : PROCESS (Q5, CLR)
    BEGIN
        IF (CLR = '1') THEN
            Q6 <= '0';
        ELSE
            IF falling_edge(Q5) THEN
                Q6 <= NOT Q6;
            END IF;
        END IF;
    END PROCESS Cntr6;

    Cntr7 : PROCESS (Q6, CLR)
    BEGIN
        IF (CLR = '1') THEN
            Q7 <= '0';
        ELSE
            IF falling_edge(Q6) THEN
                Q7 <= NOT Q7;
            END IF;
        END IF;
    END PROCESS Cntr7;

    Cntr8 : PROCESS (Q7, CLR)
    BEGIN
        IF (CLR = '1') THEN
            Q8 <= '0';
        ELSE
            IF falling_edge(Q7) THEN
                Q8 <= NOT Q8;
            END IF;
        END IF;
    END PROCESS Cntr8;

    Cntr9 : PROCESS (Q8, CLR)
    BEGIN
        IF (CLR = '1') THEN
            Q9 <= '0';
        ELSE
            IF falling_edge(Q8) THEN
                Q9 <= NOT Q9;
            END IF;
        END IF;
    END PROCESS Cntr9;

    Cntr10 : PROCESS (Q9, CLR)
    BEGIN
        IF (CLR = '1') THEN
            Q10 <= '0';
        ELSE
            IF falling_edge(Q9) THEN
                Q10 <= NOT Q10;
            END IF;
        END IF;
    END PROCESS Cntr10;

    Cntr11 : PROCESS (Q10, CLR)
    BEGIN
        IF (CLR = '1') THEN
            Q11 <= '0';
        ELSE
            IF falling_edge(Q10) THEN
                Q11 <= NOT Q11;
            END IF;
        END IF;
    END PROCESS Cntr11;

    Cntr12 : PROCESS (Q11, CLR)
    BEGIN
        IF (CLR = '1') THEN
            Q12 <= '0';
        ELSE
            IF falling_edge(Q11) THEN
                Q12 <= NOT Q12;
            END IF;
        END IF;
    END PROCESS Cntr12;

    Cntr13 : PROCESS (Q12, CLR)
    BEGIN
        IF (CLR = '1') THEN
            Q13 <= '0';
        ELSE
            IF falling_edge(Q12) THEN
                Q13 <= NOT Q13;
            END IF;
        END IF;
    END PROCESS Cntr13;

    Cntr14 : PROCESS (Q13, CLR)
    BEGIN
        IF (CLR = '1') THEN
            Q14 <= '0';
        ELSE
            IF falling_edge(Q13) THEN
                Q14 <= NOT Q14;
            END IF;
        END IF;
    END PROCESS Cntr14;

    ------------------------------------------------------------------------
    -- Path Delay Process
    ------------------------------------------------------------------------

    CLKO_Delay : PROCESS (CLKO_zd)
            VARIABLE CLKO_GlitchData:VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                OutSignal       => CLKO,
                OutSignalName   => "CLKO",
                OutTemp         => CLKO_zd,
                Mode            => VitalTransport,
                GlitchData      => CLKO_GlitchData,
                Paths           => (
                    1 => (InputChangeTime => CLKI'LAST_EVENT,
                          PathDelay => UnitDelay01,
                          PathCondition => TRUE),
                    2 => (InputChangeTime => CLR'LAST_EVENT,
                          PathDelay => UnitDelay01,
                          PathCondition => TRUE)
               )
            );
    END PROCESS;

    CLKONeg_Delay : PROCESS (CLKONeg_zd)
            VARIABLE CLKONeg_GlitchData:VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                OutSignal       => CLKONeg,
                OutSignalName   => "CLKONeg",
                OutTemp         => CLKONeg_zd,
                Mode            => VitalTransport,
                GlitchData      => CLKONeg_GlitchData,
                Paths           => (
                    1 => (InputChangeTime => CLKI'LAST_EVENT,
                          PathDelay => UnitDelay01,
                          PathCondition => TRUE),
                    2 => (InputChangeTime => CLR'LAST_EVENT,
                          PathDelay => UnitDelay01,
                          PathCondition => TRUE)
               )
            );
    END PROCESS;

    QD_Delay : PROCESS (Q4)
            VARIABLE QD_GlitchData:VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                OutSignal       => QD,
                OutSignalName   => "QD",
                OutTemp         => Q4,
                Mode            => VitalTransport,
                GlitchData      => QD_GlitchData,
                Paths           => (
                    1 => (InputChangeTime => CLKI'LAST_EVENT,
                          PathDelay => tpd_CLKI_QD,
                          PathCondition => TRUE),
                    2 => (InputChangeTime => CLR'LAST_EVENT,
                          PathDelay => tpd_CLR_QD,
                          PathCondition => TRUE)
               )
            );
    END PROCESS;

    QE_Delay : PROCESS (Q5)
            VARIABLE QE_GlitchData:VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                OutSignal       => QE,
                OutSignalName   => "QE",
                OutTemp         => Q5,
                Mode            => VitalTransport,
                GlitchData      => QE_GlitchData,
                Paths           => (
                    1 => (InputChangeTime => CLKI'LAST_EVENT,
                          PathDelay => tpd_CLKI_QD,
                          PathCondition => TRUE),
                    2 => (InputChangeTime => CLR'LAST_EVENT,
                          PathDelay => tpd_CLR_QD,
                          PathCondition => TRUE)
               )
            );
    END PROCESS;

    QF_Delay : PROCESS (Q6)
            VARIABLE QF_GlitchData:VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                OutSignal       => QF,
                OutSignalName   => "QF",
                OutTemp         => Q6,
                Mode            => VitalTransport,
                GlitchData      => QF_GlitchData,
                Paths           => (
                    1 => (InputChangeTime => CLKI'LAST_EVENT,
                          PathDelay => tpd_CLKI_QD,
                          PathCondition => TRUE),
                    2 => (InputChangeTime => CLR'LAST_EVENT,
                          PathDelay => tpd_CLR_QD,
                          PathCondition => TRUE)
               )
            );
    END PROCESS;

    QG_Delay : PROCESS (Q7)
            VARIABLE QG_GlitchData:VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                OutSignal       => QG,
                OutSignalName   => "QG",
                OutTemp         => Q7,
                Mode            => VitalTransport,
                GlitchData      => QG_GlitchData,
                Paths           => (
                    1 => (InputChangeTime => CLKI'LAST_EVENT,
                          PathDelay => tpd_CLKI_QD,
                          PathCondition => TRUE),
                    2 => (InputChangeTime => CLR'LAST_EVENT,
                          PathDelay => tpd_CLR_QD,
                          PathCondition => TRUE)
               )
            );
    END PROCESS;

    QH_Delay : PROCESS (Q8)
            VARIABLE QH_GlitchData:VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                OutSignal       => QH,
                OutSignalName   => "QH",
                OutTemp         => Q8,
                Mode            => VitalTransport,
                GlitchData      => QH_GlitchData,
                Paths           => (
                    1 => (InputChangeTime => CLKI'LAST_EVENT,
                          PathDelay => tpd_CLKI_QD,
                          PathCondition => TRUE),
                    2 => (InputChangeTime => CLR'LAST_EVENT,
                          PathDelay => tpd_CLR_QD,
                          PathCondition => TRUE)
               )
            );
    END PROCESS;

    QI_Delay : PROCESS (Q9)
            VARIABLE QI_GlitchData:VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                OutSignal       => QI,
                OutSignalName   => "QI",
                OutTemp         => Q9,
                Mode            => VitalTransport,
                GlitchData      => QI_GlitchData,
                Paths           => (
                    1 => (InputChangeTime => CLKI'LAST_EVENT,
                          PathDelay => tpd_CLKI_QD,
                          PathCondition => TRUE),
                    2 => (InputChangeTime => CLR'LAST_EVENT,
                          PathDelay => tpd_CLR_QD,
                          PathCondition => TRUE)
               )
            );
    END PROCESS;

    QJ_Delay : PROCESS (Q10)
            VARIABLE QJ_GlitchData:VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                OutSignal       => QJ,
                OutSignalName   => "QJ",
                OutTemp         => Q10,
                Mode            => VitalTransport,
                GlitchData      => QJ_GlitchData,
                Paths           => (
                    1 => (InputChangeTime => CLKI'LAST_EVENT,
                          PathDelay => tpd_CLKI_QD,
                          PathCondition => TRUE),
                    2 => (InputChangeTime => CLR'LAST_EVENT,
                          PathDelay => tpd_CLR_QD,
                          PathCondition => TRUE)
               )
            );
    END PROCESS;

    QL_Delay : PROCESS (Q12)
            VARIABLE QL_GlitchData:VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                OutSignal       => QL,
                OutSignalName   => "QL",
                OutTemp         => Q12,
                Mode            => VitalTransport,
                GlitchData      => QL_GlitchData,
                Paths           => (
                    1 => (InputChangeTime => CLKI'LAST_EVENT,
                          PathDelay => tpd_CLKI_QD,
                          PathCondition => TRUE),
                    2 => (InputChangeTime => CLR'LAST_EVENT,
                          PathDelay => tpd_CLR_QD,
                          PathCondition => TRUE)
               )
            );
    END PROCESS;

    QM_Delay : PROCESS (Q13)
            VARIABLE QM_GlitchData:VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                OutSignal       => QM,
                OutSignalName   => "QM",
                OutTemp         => Q13,
                Mode            => VitalTransport,
                GlitchData      => QM_GlitchData,
                Paths           => (
                    1 => (InputChangeTime => CLKI'LAST_EVENT,
                          PathDelay => tpd_CLKI_QD,
                          PathCondition => TRUE),
                    2 => (InputChangeTime => CLR'LAST_EVENT,
                          PathDelay => tpd_CLR_QD,
                          PathCondition => TRUE)
               )
            );
    END PROCESS;

    QN_Delay : PROCESS (Q14)
            VARIABLE QN_GlitchData:VitalGlitchDataType;
        BEGIN
            VitalPathDelay01 (
                OutSignal       => QN,
                OutSignalName   => "QN",
                OutTemp         => Q14,
                Mode            => VitalTransport,
                GlitchData      => QN_GlitchData,
                Paths           => (
                    1 => (InputChangeTime => CLKI'LAST_EVENT,
                          PathDelay => tpd_CLKI_QD,
                          PathCondition => TRUE),
                    2 => (InputChangeTime => CLR'LAST_EVENT,
                          PathDelay => tpd_CLR_QD,
                          PathCondition => TRUE)
               )
            );
    END PROCESS;

    END BLOCK;
END vhdl_behavioral;
