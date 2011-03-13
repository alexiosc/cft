--------------------------------------------------------------------------------
--  File Name: std863.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2000 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0    R. Munden    00 Nov 08   Initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STND
--  Technology: TTL
--  Part:       STD863
-- 
--  Description: Bus Transceiver with 3-State Outputs
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std863 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_B                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEBA2Neg            : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEBA1Neg            : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEAB2Neg            : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEAB1Neg            : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A_B                 : VitalDelayType01  := UnitDelay01;
        tpd_OEAB1Neg_A          : VitalDelayType01Z := UnitDelay01Z;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        B               : INOUT std_ulogic := 'U';
        A               : INOUT std_ulogic := 'U';
        OEBA2Neg        : IN    std_ulogic := 'U';
        OEBA1Neg        : IN    std_ulogic := 'U';
        OEAB2Neg        : IN    std_ulogic := 'U';
        OEAB1Neg        : IN    std_ulogic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of std863 : ENTITY IS TRUE;
END std863;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std863 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL B_ipd               : std_ulogic := 'U';
    SIGNAL A_ipd               : std_ulogic := 'U';
    SIGNAL OEBA2Neg_ipd        : std_ulogic := 'U';
    SIGNAL OEBA1Neg_ipd        : std_ulogic := 'U';
    SIGNAL OEAB2Neg_ipd        : std_ulogic := 'U';
    SIGNAL OEAB1Neg_ipd        : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (B_ipd, B, tipd_B);
        w_2 : VitalWireDelay (A_ipd, A, tipd_A);
        w_3 : VitalWireDelay (OEBA2Neg_ipd, OEBA2Neg, tipd_OEBA2Neg);
        w_4 : VitalWireDelay (OEBA1Neg_ipd, OEBA1Neg, tipd_OEBA1Neg);
        w_5 : VitalWireDelay (OEAB2Neg_ipd, OEAB2Neg, tipd_OEAB2Neg);
        w_6 : VitalWireDelay (OEAB1Neg_ipd, OEAB1Neg, tipd_OEAB1Neg);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- VITALBehavior Process
    ----------------------------------------------------------------------------
    VITALBehavior1 : PROCESS(A_ipd, B_ipd, OEBA2Neg_ipd, OEBA1Neg_ipd,
                             OEAB2Neg_ipd, OEAB1Neg_ipd)

        -- Functionality Results Variables
        VARIABLE A_zd           : std_ulogic := 'U';
        VARIABLE B_zd           : std_ulogic := 'U';
        VARIABLE Aen_int        : std_ulogic := 'U';
        VARIABLE Ben_int        : std_ulogic := 'U';

        -- Output Glitch Detection Variables
        VARIABLE A_GlitchData : VitalGlitchDataType;
        VARIABLE B_GlitchData : VitalGlitchDataType;

    BEGIN

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
                Aen_int := VitalNOR2(a=> OEBA1Neg_ipd, b => OEBA2Neg_ipd);
                Ben_int := VitalNOR2(a=> OEAB1Neg_ipd, b => OEAB2Neg_ipd);

                A_zd := VitalBUFIF1 (data => B_ipd, enable => Aen_int );
                B_zd := VitalBUFIF1 (data => A_ipd, enable => Ben_int );

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       =>  A,
            OutSignalName   =>  "A",
            OutTemp         =>  A_zd,
                        Paths           => (
                0 => (InputChangeTime   => B_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_B),
                      PathCondition     => (Aen_int = '1')),
                1 => (InputChangeTime   => OEBA1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEAB1Neg_A,
                      PathCondition     => TRUE ),
                2 => (InputChangeTime   => OEBA2Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEAB1Neg_A,
                      PathCondition     => TRUE ) ),
            GlitchData      => A_GlitchData );

        VitalPathDelay01Z (
            OutSignal       =>  B,
            OutSignalName   =>  "B",
            OutTemp         =>  B_zd,
                        Paths           => (
                0 => (InputChangeTime   => A_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A_B),
                      PathCondition     => (Ben_int = '1')),
                1 => (InputChangeTime   => OEAB1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEAB1Neg_A,
                      PathCondition     => TRUE ),
                2 => (InputChangeTime   => OEAB2Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEAB1Neg_A,
                      PathCondition     => TRUE ) ),
            GlitchData      => B_GlitchData );

    END PROCESS;

END vhdl_behavioral;
