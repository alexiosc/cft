--------------------------------------------------------------------------------
--  File Name: std154.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2005 Free Model Foundry; http://www.FreeModelFoundry.com
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--  MODIFICATION HISTORY:
--
--  version: |  author:         | mod date: | changes made:
--    V1.0     M.Milanovic        05 Sep 20   Initial release
--
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
--
--  Library:    STND
--  Technology: 54/74XXXX
--  Part:       74xx154
--
--  Description: 4-to-16 line decoder/demultiplexer
--------------------------------------------------------------------------------
--  Comments :
--      For modeling MM74HC154 port names E0Neg, E1Neg, A0, A1, A2 and A3 should
--      be changed to G1Neg, G2Neg, A, B, C and D, respectively
--------------------------------------------------------------------------------

LIBRARY IEEE;      USE IEEE.std_logic_1164.ALL;
                   USE IEEE.VITAL_timing.ALL;
                   USE IEEE.VITAL_primitives.ALL;
                   USE STD.textio.ALL;

LIBRARY FMF;       USE FMF.gen_utils.ALL;
                   USE FMF.conversions.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std154 IS
    GENERIC(
        -- tipd delays: interconnect path delays
        tipd_E0Neg               : VitalDelayType01 := VitalZeroDelay01;
        tipd_E1Neg               : VitalDelayType01 := VitalZeroDelay01;
        tipd_A0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_A3                  : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_E0Neg_Y0Neg          : VitalDelayType01  := UnitDelay01;
        tpd_A0_Y0Neg             : VitalDelayType01  := UnitDelay01;
        -- generic control parameters
        InstancePath        : string    := DefaultInstancePath;
        TimingChecksOn      : boolean   := DefaultTimingChecks;
        MsgOn               : boolean   := DefaultMsgOn;
        XOn                 : boolean   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : string    := DefaultTimingModel
    );
    PORT(
        E0Neg           : IN    std_logic := 'U';
        E1Neg           : IN    std_logic := 'U';
        A0              : IN    std_logic := 'U';
        A1              : IN    std_logic := 'U';
        A2              : IN    std_logic := 'U';
        A3              : IN    std_logic := 'U';
        Y0Neg           : OUT   std_logic := 'U';
        Y1Neg           : OUT   std_logic := 'U';
        Y2Neg           : OUT   std_logic := 'U';
        Y3Neg           : OUT   std_logic := 'U';
        Y4Neg           : OUT   std_logic := 'U';
        Y5Neg           : OUT   std_logic := 'U';
        Y6Neg           : OUT   std_logic := 'U';
        Y7Neg           : OUT   std_logic := 'U';
        Y8Neg           : OUT   std_logic := 'U';
        Y9Neg           : OUT   std_logic := 'U';
        Y10Neg          : OUT   std_logic := 'U';
        Y11Neg          : OUT   std_logic := 'U';
        Y12Neg          : OUT   std_logic := 'U';
        Y13Neg          : OUT   std_logic := 'U';
        Y14Neg          : OUT   std_logic := 'U';
        Y15Neg          : OUT   std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 OF std154 : ENTITY IS TRUE;
END std154;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std154 IS
    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    CONSTANT PartID        : STRING := "74HC154";

    -- ipd
    SIGNAL E0Neg_ipd       : std_ulogic := 'U';
    SIGNAL E1Neg_ipd       : std_ulogic := 'U';
    SIGNAL A0_ipd          : std_ulogic := 'U';
    SIGNAL A1_ipd          : std_ulogic := 'U';
    SIGNAL A2_ipd          : std_ulogic := 'U';
    SIGNAL A3_ipd          : std_ulogic := 'U';
    -- nwv
    SIGNAL E0Neg_nwv       : std_ulogic := 'U';
    SIGNAL E1Neg_nwv       : std_ulogic := 'U';
    SIGNAL A0_nwv          : std_ulogic := 'U';
    SIGNAL A1_nwv          : std_ulogic := 'U';
    SIGNAL A2_nwv          : std_ulogic := 'U';
    SIGNAL A3_nwv          : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN
        w_01 : VitalWireDelay(E0Neg_ipd, E0Neg, tipd_E0Neg);
        w_02 : VitalWireDelay(E1Neg_ipd, E1Neg, tipd_E1Neg);
        w_03 : VitalWireDelay(A0_ipd, A0, tipd_A0);
        w_04 : VitalWireDelay(A1_ipd, A1, tipd_A1);
        w_05 : VitalWireDelay(A2_ipd, A2, tipd_A2);
        w_06 : VitalWireDelay(A3_ipd, A3, tipd_A3);

    END BLOCK;
    -- sig_nwv <= To_UX01(sig_ipd);
    E0Neg_nwv       <= To_UX01(E0Neg_ipd);
    E1Neg_nwv       <= To_UX01(E1Neg_ipd);
    A0_nwv          <= To_UX01(A0_ipd);
    A1_nwv          <= To_UX01(A1_ipd);
    A2_nwv          <= To_UX01(A2_ipd);
    A3_nwv          <= To_UX01(A3_ipd);

    ----------------------------------------------------------------------------
    -- Main Behavior Block
    ----------------------------------------------------------------------------
    Behavior: BLOCK

        PORT(
            E0Neg         : IN  std_ulogic := 'U';
            E1Neg         : IN  std_ulogic := 'U';
            AIn           : IN  std_logic_vector(3 DOWNTO 0) := (OTHERS => 'U');
            YOut          : OUT std_logic_vector(15 DOWNTO 0) := (OTHERS => '1')
        );

        PORT MAP(
             E0Neg    => E0Neg_nwv,
             E1Neg    => E1Neg_nwv,
             AIn(0)   => A0_nwv,
             AIn(1)   => A1_nwv,
             AIn(2)   => A2_nwv,
             AIn(3)   => A3_nwv,
             YOut(0)  => Y0Neg,
             YOut(1)  => Y1Neg,
             YOut(2)  => Y2Neg,
             YOut(3)  => Y3Neg,
             YOut(4)  => Y4Neg,
             YOut(5)  => Y5Neg,
             YOut(6)  => Y6Neg,
             YOut(7)  => Y7Neg,
             YOut(8)  => Y8Neg,
             YOut(9)  => Y9Neg,
             YOut(10) => Y10Neg,
             YOut(11) => Y11Neg,
             YOut(12) => Y12Neg,
             YOut(13) => Y13Neg,
             YOut(14) => Y14Neg,
             YOut(15) => Y15Neg
        );

        --zero delay signals
        SIGNAL YOut_zd : std_logic_vector(15 DOWNTO 0) := (OTHERS => '1');

    BEGIN

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VITALBehaviour: PROCESS(E0Neg, E1Neg, AIn)

        VARIABLE Y_temp : std_logic_vector(15 DOWNTO 0) := (OTHERS => '1');

    BEGIN

    ----------------------------------------------------------------------------
    -- Functionality Section
    ----------------------------------------------------------------------------

    IF rising_edge(E0Neg) OR rising_edge(E1Neg) THEN
        Y_temp(15 DOWNTO 0) := (OTHERS => '1');
        YOut_zd(15 DOWNTO 0) <= Y_temp(15 DOWNTO 0);
    END IF;

    IF (falling_edge(E0Neg) OR falling_edge(E1Neg) OR AIn'EVENT) AND
    E0Neg = '0' AND E1Neg = '0' THEN
        Y_temp(15 DOWNTO 0) := (OTHERS => '1');
        Y_temp(to_nat(AIn)) := '0';
        YOut_zd(15 DOWNTO 0) <= Y_temp(15 DOWNTO 0);
    END IF;

    END PROCESS VITALBehaviour;

    ----------------------------------------------------------------------------
    -- Path Delay Section
    ----------------------------------------------------------------------------

    YOut_PathDelay_Gen : FOR I IN YOut_zd'RANGE GENERATE
        PROCESS(YOut_zd(I))
            VARIABLE YOut_GlitchData     : VitalGlitchDataType;
        BEGIN
            VitalPathDelay01(
                OutSignal     => YOut(I),
                OutSignalName => "YOut",
                OutTemp       => YOut_zd(I),
                GlitchData    => YOut_GlitchData,
                Paths         => (
                0 => (InputChangeTime => E0Neg'LAST_EVENT,
                      PathDelay       => tpd_E0Neg_Y0Neg,
                      PathCondition   => TRUE),
                1 => (InputChangeTime => E1Neg'LAST_EVENT,
                      PathDelay       => tpd_E0Neg_Y0Neg,
                      PathCondition   => TRUE),
                2 => (InputChangeTime => AIn'LAST_EVENT,
                      PathDelay       => tpd_A0_Y0Neg,
                      PathCondition   => TRUE)
                    )
                );
        END PROCESS;
    END GENERATE YOut_PathDelay_Gen;

    END BLOCK Behavior;
END vhdl_behavioral;
