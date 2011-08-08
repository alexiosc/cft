--------------------------------------------------------------------------------
--  File Name: stdh1655.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1998-2008 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0    R. Munden    99 JAN 04   Initial release
--    V1.1    R. Munden    08 SEP 24   Removed unused generic, added nwv's
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STNDH
--  Technology: LVTTL - GTL/GTL+
--  Part:       STDH1655
-- 
--  Description: Universal Bus Transceiver with bus hold
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;
--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stdh1655 IS
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
        tipd_B0                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B1                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B2                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B3                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B4                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B5                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B6                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_B7                  : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEABNeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_LEAB                : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEBANeg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_LEBA                : VitalDelayType01 := VitalZeroDelay01;
        tipd_OENeg               : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLK                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_VERC                : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_A0_B0_VERC_EQ_0      : VitalDelayType01 := UnitDelay01;
        tpd_A0_B0_VERC_EQ_1      : VitalDelayType01 := UnitDelay01;
        tpd_B0_A0                : VitalDelayType01 := UnitDelay01;
        tpd_OEABNeg_B0_VERC_EQ_0 : VitalDelayType01Z := UnitDelay01Z;
        tpd_OEABNeg_B0_VERC_EQ_1 : VitalDelayType01Z := UnitDelay01Z;
        tpd_OENeg_B0_VERC_EQ_0   : VitalDelayType01Z := UnitDelay01Z;
        tpd_OENeg_B0_VERC_EQ_1   : VitalDelayType01Z := UnitDelay01Z;
        tpd_OENeg_A0             : VitalDelayType01Z := UnitDelay01Z;
        tpd_OEBANeg_A0           : VitalDelayType01Z := UnitDelay01Z;
        tpd_LEAB_B0_VERC_EQ_0    : VitalDelayType01 := UnitDelay01;
        tpd_LEAB_B0_VERC_EQ_1    : VitalDelayType01 := UnitDelay01;
        tpd_LEBA_A0              : VitalDelayType01 := UnitDelay01;
        tpd_CLK_A0               : VitalDelayType01 := UnitDelay01;
        tpd_CLK_B0_VERC_EQ_0     : VitalDelayType01 := UnitDelay01;
        tpd_CLK_B0_VERC_EQ_1     : VitalDelayType01 := UnitDelay01;
        -- tsetup values: setup times
        tsetup_A0_CLK             : VitalDelayType := UnitDelay;
        tsetup_A0_LEAB_CLK_EQ_0   : VitalDelayType := UnitDelay;
        tsetup_A0_LEAB_CLK_EQ_1   : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_A0_CLK              : VitalDelayType := UnitDelay;
        thold_A0_LEAB             : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_LEBA_posedge         : VitalDelayType := UnitDelay;
        tpw_LEAB_posedge         : VitalDelayType := UnitDelay;
        tpw_CLK_posedge          : VitalDelayType := UnitDelay;
        tpw_CLK_negedge          : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLK_posedge      : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        A0              : INOUT std_logic := 'U';
        A1              : INOUT std_logic := 'U';
        A2              : INOUT std_logic := 'U';
        A3              : INOUT std_logic := 'U';
        A4              : INOUT std_logic := 'U';
        A5              : INOUT std_logic := 'U';
        A6              : INOUT std_logic := 'U';
        A7              : INOUT std_logic := 'U';
        B0              : INOUT std_logic := 'U';
        B1              : INOUT std_logic := 'U';
        B2              : INOUT std_logic := 'U';
        B3              : INOUT std_logic := 'U';
        B4              : INOUT std_logic := 'U';
        B5              : INOUT std_logic := 'U';
        B6              : INOUT std_logic := 'U';
        B7              : INOUT std_logic := 'U';
        OEABNeg         : IN    std_logic := 'U';
        LEAB            : IN    std_logic := 'U';
        OEBANeg         : IN    std_logic := 'U';
        LEBA            : IN    std_logic := 'U';
        OENeg           : IN    std_logic := 'U';
        CLK             : IN    std_logic := 'U';
        VERC            : IN    std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of stdh1655 : ENTITY IS TRUE;
END stdh1655;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdh1655 IS
    ATTRIBUTE VITAL_LEVEL0 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL A0_ipd              : std_ulogic := 'X';
    SIGNAL A1_ipd              : std_ulogic := 'X';
    SIGNAL A2_ipd              : std_ulogic := 'X';
    SIGNAL A3_ipd              : std_ulogic := 'X';
    SIGNAL A4_ipd              : std_ulogic := 'X';
    SIGNAL A5_ipd              : std_ulogic := 'X';
    SIGNAL A6_ipd              : std_ulogic := 'X';
    SIGNAL A7_ipd              : std_ulogic := 'X';
    SIGNAL B0_ipd              : std_ulogic := 'X';
    SIGNAL B1_ipd              : std_ulogic := 'X';
    SIGNAL B2_ipd              : std_ulogic := 'X';
    SIGNAL B3_ipd              : std_ulogic := 'X';
    SIGNAL B4_ipd              : std_ulogic := 'X';
    SIGNAL B5_ipd              : std_ulogic := 'X';
    SIGNAL B6_ipd              : std_ulogic := 'X';
    SIGNAL B7_ipd              : std_ulogic := 'X';
    SIGNAL OEABNeg_ipd         : std_ulogic := 'X';
    SIGNAL LEAB_ipd            : std_ulogic := 'X';
    SIGNAL OEBANeg_ipd         : std_ulogic := 'X';
    SIGNAL LEBA_ipd            : std_ulogic := 'X';
    SIGNAL OENeg_ipd           : std_ulogic := 'X';
    SIGNAL CLK_ipd             : std_ulogic := 'X';
    SIGNAL VERC_ipd            : std_ulogic := 'X';
    SIGNAL A0int               : std_logic  := 'X';
    SIGNAL B0int               : std_logic  := 'X';
    SIGNAL A1int               : std_logic  := 'X';
    SIGNAL B1int               : std_logic  := 'X';
    SIGNAL A2int               : std_logic  := 'X';
    SIGNAL B2int               : std_logic  := 'X';
    SIGNAL A3int               : std_logic  := 'X';
    SIGNAL B3int               : std_logic  := 'X';
    SIGNAL A4int               : std_logic  := 'X';
    SIGNAL B4int               : std_logic  := 'X';
    SIGNAL A5int               : std_logic  := 'X';
    SIGNAL B5int               : std_logic  := 'X';
    SIGNAL A6int               : std_logic  := 'X';
    SIGNAL B6int               : std_logic  := 'X';
    SIGNAL A7int               : std_logic  := 'X';
    SIGNAL B7int               : std_logic  := 'X';
    SIGNAL A0bh                : std_logic  := 'X';
    SIGNAL B0bh                : std_logic  := 'X';
    SIGNAL A0bhNeg             : std_ulogic := 'X';
    SIGNAL B0bhNeg             : std_ulogic := 'X';
    SIGNAL A1bh                : std_logic  := 'X';
    SIGNAL B1bh                : std_logic  := 'X';
    SIGNAL A1bhNeg             : std_ulogic := 'X';
    SIGNAL B1bhNeg             : std_ulogic := 'X';
    SIGNAL A2bh                : std_logic  := 'X';
    SIGNAL B2bh                : std_logic  := 'X';
    SIGNAL A2bhNeg             : std_ulogic := 'X';
    SIGNAL B2bhNeg             : std_ulogic := 'X';
    SIGNAL A3bh                : std_logic  := 'X';
    SIGNAL B3bh                : std_logic  := 'X';
    SIGNAL A3bhNeg             : std_ulogic := 'X';
    SIGNAL B3bhNeg             : std_ulogic := 'X';
    SIGNAL A4bh                : std_logic  := 'X';
    SIGNAL B4bh                : std_logic  := 'X';
    SIGNAL A4bhNeg             : std_ulogic := 'X';
    SIGNAL B4bhNeg             : std_ulogic := 'X';
    SIGNAL A5bh                : std_logic  := 'X';
    SIGNAL B5bh                : std_logic  := 'X';
    SIGNAL A5bhNeg             : std_ulogic := 'X';
    SIGNAL B5bhNeg             : std_ulogic := 'X';
    SIGNAL A6bh                : std_logic  := 'X';
    SIGNAL B6bh                : std_logic  := 'X';
    SIGNAL A6bhNeg             : std_ulogic := 'X';
    SIGNAL B6bhNeg             : std_ulogic := 'X';
    SIGNAL A7bh                : std_logic  := 'X';
    SIGNAL B7bh                : std_logic  := 'X';
    SIGNAL A7bhNeg             : std_ulogic := 'X';
    SIGNAL B7bhNeg             : std_ulogic := 'X';
    SIGNAL Aenable             : std_ulogic := 'X';
    SIGNAL Benable             : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (A0_ipd, A0, tipd_A0);
        w_2 : VitalWireDelay (A1_ipd, A1, tipd_A1);
        w_3 : VitalWireDelay (A2_ipd, A2, tipd_A2);
        w_4 : VitalWireDelay (A3_ipd, A3, tipd_A3);
        w_5 : VitalWireDelay (A4_ipd, A4, tipd_A4);
        w_6 : VitalWireDelay (A5_ipd, A5, tipd_A5);
        w_7 : VitalWireDelay (A6_ipd, A6, tipd_A6);
        w_8 : VitalWireDelay (A7_ipd, A7, tipd_A7);
        w_9 : VitalWireDelay (B0_ipd, B0, tipd_B0);
        w_10 : VitalWireDelay (B1_ipd, B1, tipd_B1);
        w_11 : VitalWireDelay (B2_ipd, B2, tipd_B2);
        w_12 : VitalWireDelay (B3_ipd, B3, tipd_B3);
        w_13 : VitalWireDelay (B4_ipd, B4, tipd_B4);
        w_14 : VitalWireDelay (B5_ipd, B5, tipd_B5);
        w_15 : VitalWireDelay (B6_ipd, B6, tipd_B6);
        w_16 : VitalWireDelay (B7_ipd, B7, tipd_B7);
        w_17 : VitalWireDelay (OEABNeg_ipd, OEABNeg, tipd_OEABNeg);
        w_18 : VitalWireDelay (LEAB_ipd, LEAB, tipd_LEAB);
        w_19 : VitalWireDelay (OEBANeg_ipd, OEBANeg, tipd_OEBANeg);
        w_20 : VitalWireDelay (LEBA_ipd, LEBA, tipd_LEBA);
        w_21 : VitalWireDelay (OENeg_ipd, OENeg, tipd_OENeg);
        w_22 : VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_23 : VitalWireDelay (VERC_ipd, VERC, tipd_VERC);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    a_1: VitalBUF (q => A0bh, a => A0_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_2: VitalINV (q => A0bhNeg, a => A0bh);
    a_3: VitalINV (q => A0bh, a => A0bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_4: VitalBUF (q => B0bh, a => B0_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_5: VitalINV (q => B0bhNeg, a => B0bh);
    a_6: VitalINV (q => B0bh, a => B0bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_7: VitalBUF (q => A1bh, a => A1_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_8: VitalINV (q => A1bhNeg, a => A1bh);
    a_9: VitalINV (q => A1bh, a => A1bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_10: VitalBUF (q => B1bh, a => B1_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_11: VitalINV (q => B1bhNeg, a => B1bh);
    a_12: VitalINV (q => B1bh, a => B1bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_13: VitalBUF (q => A2bh, a => A2_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_14: VitalINV (q => A2bhNeg, a => A2bh);
    a_15: VitalINV (q => A2bh, a => A2bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_16: VitalBUF (q => B2bh, a => B2_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_17: VitalINV (q => B2bhNeg, a => B2bh);
    a_18: VitalINV (q => B2bh, a => B2bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_19: VitalBUF (q => A3bh, a => A3_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_20: VitalINV (q => A3bhNeg, a => A3bh);
    a_21: VitalINV (q => A3bh, a => A3bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_22: VitalBUF (q => B3bh, a => B3_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_23: VitalINV (q => B3bhNeg, a => B3bh);
    a_24: VitalINV (q => B3bh, a => B3bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_25: VitalBUF (q => A4bh, a => A4_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_26: VitalINV (q => A4bhNeg, a => A4bh);
    a_27: VitalINV (q => A4bh, a => A4bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_28: VitalBUF (q => B4bh, a => B4_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_29: VitalINV (q => B4bhNeg, a => B4bh);
    a_30: VitalINV (q => B4bh, a => B4bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_31: VitalBUF (q => A5bh, a => A5_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_32: VitalINV (q => A5bhNeg, a => A5bh);
    a_33: VitalINV (q => A5bh, a => A5bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_34: VitalBUF (q => B5bh, a => B5_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_35: VitalINV (q => B5bhNeg, a => B5bh);
    a_36: VitalINV (q => B5bh, a => B5bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_37: VitalBUF (q => A6bh, a => A6_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_38: VitalINV (q => A6bhNeg, a => A6bh);
    a_39: VitalINV (q => A6bh, a => A6bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_40: VitalBUF (q => B6bh, a => B6_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_41: VitalINV (q => B6bhNeg, a => B6bh);
    a_42: VitalINV (q => B6bh, a => B6bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_43: VitalBUF (q => A7bh, a => A7_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_44: VitalINV (q => A7bhNeg, a => A7bh);
    a_45: VitalINV (q => A7bh, a => A7bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_46: VitalBUF (q => B7bh, a => B7_ipd, ResultMap => ('U', 'Z', '0', '1'));
    a_47: VitalINV (q => B7bhNeg, a => B7bh);
    a_48: VitalINV (q => B7bh, a => B7bhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    a_49: VitalNOR2 (q => Benable, a => OEABNeg_ipd, b => OENeg_ipd);
    a_50: VitalNOR2 (q => Aenable, a => OEBANeg_ipd, b => OENeg_ipd);

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalOutput1 : PROCESS (B0int, B1int, B2int, B3int, B4int, B5int, B6int, 
                            B7int, Benable, OEABNeg_ipd, OENeg_ipd)

        -- Functionality Results Variables
        VARIABLE B0_zd           : std_ulogic;
        VARIABLE B1_zd           : std_ulogic;
        VARIABLE B2_zd           : std_ulogic;
        VARIABLE B3_zd           : std_ulogic;
        VARIABLE B4_zd           : std_ulogic;
        VARIABLE B5_zd           : std_ulogic;
        VARIABLE B6_zd           : std_ulogic;
        VARIABLE B7_zd           : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE B0_GlitchData   : VitalGlitchDataType;
        VARIABLE B1_GlitchData   : VitalGlitchDataType;
        VARIABLE B2_GlitchData   : VitalGlitchDataType;
        VARIABLE B3_GlitchData   : VitalGlitchDataType;
        VARIABLE B4_GlitchData   : VitalGlitchDataType;
        VARIABLE B5_GlitchData   : VitalGlitchDataType;
        VARIABLE B6_GlitchData   : VitalGlitchDataType;
        VARIABLE B7_GlitchData   : VitalGlitchDataType;

        VARIABLE OEABNeg_nwv  : UX01 := 'X';
        VARIABLE OENeg_nwv    : UX01 := 'X';
        VARIABLE VERC_nwv     : UX01 := 'X';

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        B0_zd := VitalBUFIF1 (data => B0int, enable => Benable);
        B1_zd := VitalBUFIF1 (data => B1int, enable => Benable);
        B2_zd := VitalBUFIF1 (data => B2int, enable => Benable);
        B3_zd := VitalBUFIF1 (data => B3int, enable => Benable);
        B4_zd := VitalBUFIF1 (data => B4int, enable => Benable);
        B5_zd := VitalBUFIF1 (data => B5int, enable => Benable);
        B6_zd := VitalBUFIF1 (data => B6int, enable => Benable);
        B7_zd := VitalBUFIF1 (data => B7int, enable => Benable);

        ------------------------------------------------------------------------
        -- no weak values
        ------------------------------------------------------------------------
        OEABNeg_nwv  := To_UX01(OEABNeg_ipd);
        OENeg_nwv    := To_UX01(OENeg_ipd);
        VERC_nwv     := To_UX01(VERC_ipd);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
         VitalPathDelay01Z (
            OutSignal       =>  B0,
            OutSignalName   =>  "B0",
            OutTemp         =>  B0_zd,
            GlitchData      => B0_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => B0int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_0),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => B0int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_1),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                3 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'),
                4 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                5 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'))
        );

         VitalPathDelay01Z (
            OutSignal       =>  B1,
            OutSignalName   =>  "B1",
            OutTemp         =>  B1_zd,
            GlitchData      => B1_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => B1int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_0),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => B1int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_1),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                3 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'),
                4 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                5 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'))
        );

         VitalPathDelay01Z (
            OutSignal       =>  B2,
            OutSignalName   =>  "B2",
            OutTemp         =>  B2_zd,
            GlitchData      => B2_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => B2int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_0),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => B2int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_1),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                3 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'),
                4 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                5 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'))
        );

         VitalPathDelay01Z (
            OutSignal       =>  B3,
            OutSignalName   =>  "B3",
            OutTemp         =>  B3_zd,
            GlitchData      => B3_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => B3int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_0),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => B3int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_1),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                3 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'),
                4 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                5 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'))
        );

         VitalPathDelay01Z (
            OutSignal       =>  B4,
            OutSignalName   =>  "B4",
            OutTemp         =>  B4_zd,
            GlitchData      => B4_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => B4int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_0),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => B4int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_1),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                3 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'),
                4 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                5 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'))
        );

         VitalPathDelay01Z (
            OutSignal       =>  B5,
            OutSignalName   =>  "B5",
            OutTemp         =>  B5_zd,
            GlitchData      => B5_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => B5int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_0),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => B5int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_1),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                3 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'),
                4 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                5 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'))
        );

         VitalPathDelay01Z (
            OutSignal       =>  B6,
            OutSignalName   =>  "B6",
            OutTemp         =>  B6_zd,
            GlitchData      => B6_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => B6int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_0),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => B6int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_1),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                3 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'),
                4 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                5 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'))
        );

         VitalPathDelay01Z (
            OutSignal       =>  B7,
            OutSignalName   =>  "B7",
            OutTemp         =>  B7_zd,
            GlitchData      => B7_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => B7int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_0),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => B7int'LAST_EVENT,
                      PathDelay         => 
                           VitalExtendToFillDelay(tpd_A0_B0_VERC_EQ_1),
                      PathCondition     => (Benable = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                3 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'),
                4 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_0,
                      PathCondition     => VERC_nwv = '0'),
                5 => (InputChangeTime   => OEABNeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEABNeg_B0_VERC_EQ_1,
                      PathCondition     => VERC_nwv = '1'))
        );

    END PROCESS VitalOutput1;

    VitalOutput2 : PROCESS (A0int, A1int, A2int, A3int, A4int, A5int, A6int,
                            A7int, Aenable, OEBANeg_ipd, OENeg_ipd)

        -- Functionality Results Variables
        VARIABLE A0_zd           : std_ulogic;
        VARIABLE A1_zd           : std_ulogic;
        VARIABLE A2_zd           : std_ulogic;
        VARIABLE A3_zd           : std_ulogic;
        VARIABLE A4_zd           : std_ulogic;
        VARIABLE A5_zd           : std_ulogic;
        VARIABLE A6_zd           : std_ulogic;
        VARIABLE A7_zd           : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE A0_GlitchData   : VitalGlitchDataType;
        VARIABLE A1_GlitchData   : VitalGlitchDataType;
        VARIABLE A2_GlitchData   : VitalGlitchDataType;
        VARIABLE A3_GlitchData   : VitalGlitchDataType;
        VARIABLE A4_GlitchData   : VitalGlitchDataType;
        VARIABLE A5_GlitchData   : VitalGlitchDataType;
        VARIABLE A6_GlitchData   : VitalGlitchDataType;
        VARIABLE A7_GlitchData   : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        A0_zd := VitalBUFIF1 (data => A0int, enable => Aenable);
        A1_zd := VitalBUFIF1 (data => A1int, enable => Aenable);
        A2_zd := VitalBUFIF1 (data => A2int, enable => Aenable);
        A3_zd := VitalBUFIF1 (data => A3int, enable => Aenable);
        A4_zd := VitalBUFIF1 (data => A4int, enable => Aenable);
        A5_zd := VitalBUFIF1 (data => A5int, enable => Aenable);
        A6_zd := VitalBUFIF1 (data => A6int, enable => Aenable);
        A7_zd := VitalBUFIF1 (data => A7int, enable => Aenable);

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
         VitalPathDelay01Z (
            OutSignal       =>  A0,
            OutSignalName   =>  "A0",
            OutTemp         =>  A0_zd,
            GlitchData      => A0_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A0int'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_B0_A0),
                      PathCondition     => Aenable = '1'),
                1 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_A0,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => OEBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEBANeg_A0,
                      PathCondition     => TRUE))
        );

         VitalPathDelay01Z (
            OutSignal       =>  A1,
            OutSignalName   =>  "A1",
            OutTemp         =>  A1_zd,
            GlitchData      => A1_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A1int'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_B0_A0),
                      PathCondition     => Aenable = '1'),
                1 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_A0,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => OEBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEBANeg_A0,
                      PathCondition     => TRUE))
        );

         VitalPathDelay01Z (
            OutSignal       =>  A2,
            OutSignalName   =>  "A2",
            OutTemp         =>  A2_zd,
            GlitchData      => A2_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A2int'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_B0_A0),
                      PathCondition     => Aenable = '1'),
                1 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_A0,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => OEBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEBANeg_A0,
                      PathCondition     => TRUE))
        );

         VitalPathDelay01Z (
            OutSignal       =>  A3,
            OutSignalName   =>  "A3",
            OutTemp         =>  A3_zd,
            GlitchData      => A3_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A3int'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_B0_A0),
                      PathCondition     => Aenable = '1'),
                1 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_A0,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => OEBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEBANeg_A0,
                      PathCondition     => TRUE))
        );

         VitalPathDelay01Z (
            OutSignal       =>  A4,
            OutSignalName   =>  "A4",
            OutTemp         =>  A4_zd,
            GlitchData      => A4_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A4int'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_B0_A0),
                      PathCondition     => Aenable = '1'),
                1 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_A0,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => OEBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEBANeg_A0,
                      PathCondition     => TRUE))
        );

         VitalPathDelay01Z (
            OutSignal       =>  A5,
            OutSignalName   =>  "A5",
            OutTemp         =>  A5_zd,
            GlitchData      => A5_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A5int'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_B0_A0),
                      PathCondition     => Aenable = '1'),
                1 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_A0,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => OEBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEBANeg_A0,
                      PathCondition     => TRUE))
        );

         VitalPathDelay01Z (
            OutSignal       =>  A6,
            OutSignalName   =>  "A6",
            OutTemp         =>  A6_zd,
            GlitchData      => A6_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A6int'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_B0_A0),
                      PathCondition     => Aenable = '1'),
                1 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_A0,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => OEBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEBANeg_A0,
                      PathCondition     => TRUE))
        );

         VitalPathDelay01Z (
            OutSignal       =>  A7,
            OutSignalName   =>  "A7",
            OutTemp         =>  A7_zd,
            GlitchData      => A7_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A7int'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_B0_A0),
                      PathCondition     => Aenable = '1'),
                1 => (InputChangeTime   => OENeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OENeg_A0,
                      PathCondition     => TRUE),
                2 => (InputChangeTime   => OEBANeg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OEBANeg_A0,
                      PathCondition     => TRUE))
        );

    END PROCESS VitalOutput2;

    VitalBehavior1 : PROCESS (CLK_ipd, LEAB_ipd, A0bh, A1bh, A2bh, A3bh, A4bh, 
                              A5bh, A6bh, A7bh)

        -- Timing Check Variables
        VARIABLE Tviol_A0_CLK    : X01 := '0';
        VARIABLE TD_A0_CLK       : VitalTimingDataType;

        VARIABLE Tviol_A1_CLK    : X01 := '0';
        VARIABLE TD_A1_CLK       : VitalTimingDataType;

        VARIABLE Tviol_A2_CLK    : X01 := '0';
        VARIABLE TD_A2_CLK       : VitalTimingDataType;

        VARIABLE Tviol_A3_CLK    : X01 := '0';
        VARIABLE TD_A3_CLK       : VitalTimingDataType;

        VARIABLE Tviol_A4_CLK    : X01 := '0';
        VARIABLE TD_A4_CLK       : VitalTimingDataType;

        VARIABLE Tviol_A5_CLK    : X01 := '0';
        VARIABLE TD_A5_CLK       : VitalTimingDataType;

        VARIABLE Tviol_A6_CLK    : X01 := '0';
        VARIABLE TD_A6_CLK       : VitalTimingDataType;

        VARIABLE Tviol_A7_CLK    : X01 := '0';
        VARIABLE TD_A7_CLK       : VitalTimingDataType;

        VARIABLE Tviol_A0_LEAB   : X01 := '0';
        VARIABLE TD_A0_LEAB      : VitalTimingDataType;

        VARIABLE Tviol_A1_LEAB   : X01 := '0';
        VARIABLE TD_A1_LEAB      : VitalTimingDataType;

        VARIABLE Tviol_A2_LEAB   : X01 := '0';
        VARIABLE TD_A2_LEAB      : VitalTimingDataType;

        VARIABLE Tviol_A3_LEAB   : X01 := '0';
        VARIABLE TD_A3_LEAB      : VitalTimingDataType;

        VARIABLE Tviol_A4_LEAB   : X01 := '0';
        VARIABLE TD_A4_LEAB      : VitalTimingDataType;

        VARIABLE Tviol_A5_LEAB   : X01 := '0';
        VARIABLE TD_A5_LEAB      : VitalTimingDataType;

        VARIABLE Tviol_A6_LEAB   : X01 := '0';
        VARIABLE TD_A6_LEAB      : VitalTimingDataType;

        VARIABLE Tviol_A7_LEAB   : X01 := '0';
        VARIABLE TD_A7_LEAB      : VitalTimingDataType;

        VARIABLE Pviol_CLK       : X01 := '0';
        VARIABLE PD_CLK          : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Pviol_LEAB      : X01 := '0';
        VARIABLE PD_LEAB         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation       : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q0_zd             : std_ulogic;
        VARIABLE Q1_zd             : std_ulogic;
        VARIABLE Q2_zd             : std_ulogic;
        VARIABLE Q3_zd             : std_ulogic;
        VARIABLE Q4_zd             : std_ulogic;
        VARIABLE Q5_zd             : std_ulogic;
        VARIABLE Q6_zd             : std_ulogic;
        VARIABLE Q7_zd             : std_ulogic;
        VARIABLE PrevData0         : std_logic_vector(0 to 3);
        VARIABLE PrevData1         : std_logic_vector(0 to 3);
        VARIABLE PrevData2         : std_logic_vector(0 to 3);
        VARIABLE PrevData3         : std_logic_vector(0 to 3);
        VARIABLE PrevData4         : std_logic_vector(0 to 3);
        VARIABLE PrevData5         : std_logic_vector(0 to 3);
        VARIABLE PrevData6         : std_logic_vector(0 to 3);
        VARIABLE PrevData7         : std_logic_vector(0 to 3);

        -- Output Glitch Detection Variables
        VARIABLE Q0_GlitchData      : VitalGlitchDataType;
        VARIABLE Q1_GlitchData      : VitalGlitchDataType;
        VARIABLE Q2_GlitchData      : VitalGlitchDataType;
        VARIABLE Q3_GlitchData      : VitalGlitchDataType;
        VARIABLE Q4_GlitchData      : VitalGlitchDataType;
        VARIABLE Q5_GlitchData      : VitalGlitchDataType;
        VARIABLE Q6_GlitchData      : VitalGlitchDataType;
        VARIABLE Q7_GlitchData      : VitalGlitchDataType;

        VARIABLE LEAB_nwv     : UX01 := 'X';
        VARIABLE VERC_nwv     : UX01 := 'X';

    BEGIN

        ------------------------------------------------------------------------
        -- no weak values
        ------------------------------------------------------------------------
        LEAB_nwv  := To_UX01(LEAB_ipd);
        VERC_nwv  := To_UX01(VERC_ipd);

        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => A0bh,
                TestSignalName  => "A0bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEAB = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A0_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A0_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => A0bh,
                TestSignalName  => "A0bh",
                RefSignal       => LEAB_ipd,
                RefSignalName   => "LEAB_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A0_LEAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A0_LEAB
            );

            VitalSetupHoldCheck (
                TestSignal      => A1bh,
                TestSignalName  => "A1bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEAB = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A1_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A1_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => A1bh,
                TestSignalName  => "A1bh",
                RefSignal       => LEAB_ipd,
                RefSignalName   => "LEAB_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A1_LEAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A1_LEAB
            );

            VitalSetupHoldCheck (
                TestSignal      => A2bh,
                TestSignalName  => "A2bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEAB = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A2_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A2_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => A2bh,
                TestSignalName  => "A2bh",
                RefSignal       => LEAB_ipd,
                RefSignalName   => "LEAB_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A2_LEAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A2_LEAB
            );

            VitalSetupHoldCheck (
                TestSignal      => A3bh,
                TestSignalName  => "A3bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEAB = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A3_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A3_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => A3bh,
                TestSignalName  => "A3bh",
                RefSignal       => LEAB_ipd,
                RefSignalName   => "LEAB_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A3_LEAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A3_LEAB
            );

            VitalSetupHoldCheck (
                TestSignal      => A4bh,
                TestSignalName  => "A4bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEAB = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A4_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A4_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => A4bh,
                TestSignalName  => "A4bh",
                RefSignal       => LEAB_ipd,
                RefSignalName   => "LEAB_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A4_LEAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A4_LEAB
            );

            VitalSetupHoldCheck (
                TestSignal      => A5bh,
                TestSignalName  => "A5bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEAB = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A5_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A5_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => A5bh,
                TestSignalName  => "A5bh",
                RefSignal       => LEAB_ipd,
                RefSignalName   => "LEAB_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A5_LEAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A5_LEAB
            );

            VitalSetupHoldCheck (
                TestSignal      => A6bh,
                TestSignalName  => "A6bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEAB = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A6_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A6_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => A6bh,
                TestSignalName  => "A6bh",
                RefSignal       => LEAB_ipd,
                RefSignalName   => "LEAB_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A6_LEAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A6_LEAB
            );

            VitalSetupHoldCheck (
                TestSignal      => A7bh,
                TestSignalName  => "A7bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEAB = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A7_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A7_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => A7bh,
                TestSignalName  => "A7bh",
                RefSignal       => LEAB_ipd,
                RefSignalName   => "LEAB_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_A7_LEAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A7_LEAB
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLK_ipd,
                TestSignalName  => "CLK_ipd",
                PulseWidthHigh  => tpw_CLK_posedge,
                PulseWidthLow   => tpw_CLK_negedge,
                CheckEnabled    => LEAB = '0',
                HeaderMsg       => InstancePath & "/stdh1655",
                PeriodData      => PD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLK
            );

            VitalPeriodPulseCheck (
                TestSignal      => LEAB_ipd,
                TestSignalName  => "LEAB_ipd",
                PulseWidthHigh  => tpw_LEAB_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/stdh1655",
                PeriodData      => PD_LEAB,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LEAB
            );

        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_A0_LEAB OR Tviol_A0_CLK OR Tviol_A1_LEAB OR 
                     Tviol_A1_CLK OR Tviol_A2_LEAB OR Tviol_A2_CLK OR 
                     Tviol_A3_LEAB OR Tviol_A3_CLK OR Tviol_A4_LEAB OR 
                     Tviol_A4_CLK OR Tviol_A5_LEAB OR Tviol_A5_CLK OR 
                     Tviol_A6_LEAB OR Tviol_A6_CLK OR Tviol_A7_LEAB OR 
                     Tviol_A7_CLK OR Pviol_LEAB OR Pviol_CLK;

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEAB_ipd, CLK_ipd, A0bh),
            Result          => Q0_zd,
            PreviousDataIn  => PrevData0
        );

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEAB_ipd, CLK_ipd, A1bh),
            Result          => Q1_zd,
            PreviousDataIn  => PrevData1
        );

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEAB_ipd, CLK_ipd, A2bh),
            Result          => Q2_zd,
            PreviousDataIn  => PrevData2
        );

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEAB_ipd, CLK_ipd, A3bh),
            Result          => Q3_zd,
            PreviousDataIn  => PrevData3
        );

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEAB_ipd, CLK_ipd, A4bh),
            Result          => Q4_zd,
            PreviousDataIn  => PrevData4
        );

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEAB_ipd, CLK_ipd, A5bh),
            Result          => Q5_zd,
            PreviousDataIn  => PrevData5
        );

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEAB_ipd, CLK_ipd, A6bh),
            Result          => Q6_zd,
            PreviousDataIn  => PrevData6
        );

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEAB_ipd, CLK_ipd, A7bh),
            Result          => Q7_zd,
            PreviousDataIn  => PrevData7
        );

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => B0int,
            OutSignalName   => "B0int",
            OutTemp         => Q0_zd,
            GlitchData      => Q0_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => A0bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                3 => (InputChangeTime   => A0bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                4 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '0')),
                5 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '1'))
            )
        );

        VitalPathDelay01 (
            OutSignal       => B1int,
            OutSignalName   => "B1int",
            OutTemp         => Q1_zd,
            GlitchData      => Q1_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => A1bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                3 => (InputChangeTime   => A1bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                4 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '0')),
                5 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '1'))
            )
        );

        VitalPathDelay01 (
            OutSignal       => B2int,
            OutSignalName   => "B2int",
            OutTemp         => Q2_zd,
            GlitchData      => Q2_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => A2bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                3 => (InputChangeTime   => A2bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                4 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '0')),
                5 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '1'))
            )
        );

        VitalPathDelay01 (
            OutSignal       => B3int,
            OutSignalName   => "B3int",
            OutTemp         => Q3_zd,
            GlitchData      => Q3_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => A3bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                3 => (InputChangeTime   => A3bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                4 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '0')),
                5 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '1'))
            )
        );

        VitalPathDelay01 (
            OutSignal       => B4int,
            OutSignalName   => "B4int",
            OutTemp         => Q4_zd,
            GlitchData      => Q4_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => A4bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                3 => (InputChangeTime   => A4bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                4 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '0')),
                5 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '1'))
            )
        );

        VitalPathDelay01 (
            OutSignal       => B5int,
            OutSignalName   => "B5int",
            OutTemp         => Q5_zd,
            GlitchData      => Q5_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => A5bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                3 => (InputChangeTime   => A5bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                4 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '0')),
                5 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '1'))
            )
        );

        VitalPathDelay01 (
            OutSignal       => B6int,
            OutSignalName   => "B6int",
            OutTemp         => Q6_zd,
            GlitchData      => Q6_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => A6bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                3 => (InputChangeTime   => A6bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                4 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '0')),
                5 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '1'))
            )
        );

        VitalPathDelay01 (
            OutSignal       => B7int,
            OutSignalName   => "B7int",
            OutTemp         => Q7_zd,
            GlitchData      => Q7_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                1 => (InputChangeTime   => LEAB_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEAB_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                2 => (InputChangeTime   => A7bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '0')),
                3 => (InputChangeTime   => A7bh'LAST_EVENT,
                      PathDelay         => tpd_A0_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '1' AND VERC_nwv = '1')),
                4 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_0,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '0')),
                5 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_B0_VERC_EQ_1,
                      PathCondition     => (LEAB_nwv = '0' AND VERC_nwv = '1'))
            )
        );

    END PROCESS VitalBehavior1;

    VitalBehavior2 : PROCESS (CLK_ipd, LEBA_ipd, B0bh, B1bh, B2bh, B3bh, B4bh, 
                              B5bh, B6bh, B7bh)

        -- Timing Check Variables
        VARIABLE Tviol_B0_CLK    : X01 := '0';
        VARIABLE TD_B0_CLK       : VitalTimingDataType;

        VARIABLE Tviol_B1_CLK    : X01 := '0';
        VARIABLE TD_B1_CLK       : VitalTimingDataType;

        VARIABLE Tviol_B2_CLK    : X01 := '0';
        VARIABLE TD_B2_CLK       : VitalTimingDataType;

        VARIABLE Tviol_B3_CLK    : X01 := '0';
        VARIABLE TD_B3_CLK       : VitalTimingDataType;

        VARIABLE Tviol_B4_CLK    : X01 := '0';
        VARIABLE TD_B4_CLK       : VitalTimingDataType;

        VARIABLE Tviol_B5_CLK    : X01 := '0';
        VARIABLE TD_B5_CLK       : VitalTimingDataType;

        VARIABLE Tviol_B6_CLK    : X01 := '0';
        VARIABLE TD_B6_CLK       : VitalTimingDataType;

        VARIABLE Tviol_B7_CLK    : X01 := '0';
        VARIABLE TD_B7_CLK       : VitalTimingDataType;

        VARIABLE Tviol_B0_LEBA   : X01 := '0';
        VARIABLE TD_B0_LEBA      : VitalTimingDataType;

        VARIABLE Tviol_B1_LEBA   : X01 := '0';
        VARIABLE TD_B1_LEBA      : VitalTimingDataType;

        VARIABLE Tviol_B2_LEBA   : X01 := '0';
        VARIABLE TD_B2_LEBA      : VitalTimingDataType;

        VARIABLE Tviol_B3_LEBA   : X01 := '0';
        VARIABLE TD_B3_LEBA      : VitalTimingDataType;

        VARIABLE Tviol_B4_LEBA   : X01 := '0';
        VARIABLE TD_B4_LEBA      : VitalTimingDataType;

        VARIABLE Tviol_B5_LEBA   : X01 := '0';
        VARIABLE TD_B5_LEBA      : VitalTimingDataType;

        VARIABLE Tviol_B6_LEBA   : X01 := '0';
        VARIABLE TD_B6_LEBA      : VitalTimingDataType;

        VARIABLE Tviol_B7_LEBA   : X01 := '0';
        VARIABLE TD_B7_LEBA      : VitalTimingDataType;

        VARIABLE Pviol_LEBA      : X01 := '0';
        VARIABLE PD_LEBA         : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation       : X01 := '0';

        -- Functionality Results Variables
        VARIABLE Q0_zd             : std_ulogic;
        VARIABLE Q1_zd             : std_ulogic;
        VARIABLE Q2_zd             : std_ulogic;
        VARIABLE Q3_zd             : std_ulogic;
        VARIABLE Q4_zd             : std_ulogic;
        VARIABLE Q5_zd             : std_ulogic;
        VARIABLE Q6_zd             : std_ulogic;
        VARIABLE Q7_zd             : std_ulogic;
        VARIABLE PrevData0         : std_logic_vector(0 to 3);
        VARIABLE PrevData1         : std_logic_vector(0 to 3);
        VARIABLE PrevData2         : std_logic_vector(0 to 3);
        VARIABLE PrevData3         : std_logic_vector(0 to 3);
        VARIABLE PrevData4         : std_logic_vector(0 to 3);
        VARIABLE PrevData5         : std_logic_vector(0 to 3);
        VARIABLE PrevData6         : std_logic_vector(0 to 3);
        VARIABLE PrevData7         : std_logic_vector(0 to 3);

        -- Output Glitch Detection Variables
        VARIABLE Q0_GlitchData      : VitalGlitchDataType;
        VARIABLE Q1_GlitchData      : VitalGlitchDataType;
        VARIABLE Q2_GlitchData      : VitalGlitchDataType;
        VARIABLE Q3_GlitchData      : VitalGlitchDataType;
        VARIABLE Q4_GlitchData      : VitalGlitchDataType;
        VARIABLE Q5_GlitchData      : VitalGlitchDataType;
        VARIABLE Q6_GlitchData      : VitalGlitchDataType;
        VARIABLE Q7_GlitchData      : VitalGlitchDataType;

        VARIABLE LEBA_nwv     : UX01 := 'X';

    BEGIN

        ------------------------------------------------------------------------
        -- no weak values
        ------------------------------------------------------------------------
        LEBA_nwv  := To_UX01(LEBA_ipd);

        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => B0bh,
                TestSignalName  => "B0bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEBA = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B0_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B0_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => B0bh,
                TestSignalName  => "B0bh",
                RefSignal       => LEBA_ipd,
                RefSignalName   => "LEBA_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B0_LEBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B0_LEBA
            );

            VitalSetupHoldCheck (
                TestSignal      => B1bh,
                TestSignalName  => "B1bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEBA = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B1_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B1_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => B1bh,
                TestSignalName  => "B1bh",
                RefSignal       => LEBA_ipd,
                RefSignalName   => "LEBA_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B1_LEBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B1_LEBA
            );

            VitalSetupHoldCheck (
                TestSignal      => B2bh,
                TestSignalName  => "B2bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEBA = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B2_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B2_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => B2bh,
                TestSignalName  => "B2bh",
                RefSignal       => LEBA_ipd,
                RefSignalName   => "LEBA_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B2_LEBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B2_LEBA
            );

            VitalSetupHoldCheck (
                TestSignal      => B3bh,
                TestSignalName  => "B3bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEBA = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B3_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B3_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => B3bh,
                TestSignalName  => "B3bh",
                RefSignal       => LEBA_ipd,
                RefSignalName   => "LEBA_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B3_LEBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B3_LEBA
            );

            VitalSetupHoldCheck (
                TestSignal      => B4bh,
                TestSignalName  => "B4bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEBA = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B4_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B4_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => B4bh,
                TestSignalName  => "B4bh",
                RefSignal       => LEBA_ipd,
                RefSignalName   => "LEBA_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B4_LEBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B4_LEBA
            );

            VitalSetupHoldCheck (
                TestSignal      => B5bh,
                TestSignalName  => "B5bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEBA = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B5_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B5_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => B5bh,
                TestSignalName  => "B5bh",
                RefSignal       => LEBA_ipd,
                RefSignalName   => "LEBA_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B5_LEBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B5_LEBA
            );

            VitalSetupHoldCheck (
                TestSignal      => B6bh,
                TestSignalName  => "B6bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEBA = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B6_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B6_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => B6bh,
                TestSignalName  => "B6bh",
                RefSignal       => LEBA_ipd,
                RefSignalName   => "LEBA_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B6_LEBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B6_LEBA
            );

            VitalSetupHoldCheck (
                TestSignal      => B7bh,
                TestSignalName  => "B7bh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_A0_CLK,
                SetupLow        => tsetup_A0_CLK,
                HoldHigh        => thold_A0_CLK,
                HoldLow         => thold_A0_CLK,
                CheckEnabled    => LEBA = '0',
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B7_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B7_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => B7bh,
                TestSignalName  => "B7bh",
                RefSignal       => LEBA_ipd,
                RefSignalName   => "LEBA_ipd",
                SetupHigh       => tsetup_A0_LEAB_CLK_EQ_1,
                SetupLow        => tsetup_A0_LEAB_CLK_EQ_0,
                HoldHigh        => thold_A0_LEAB,
                HoldLow         => thold_A0_LEAB,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh1655",
                TimingData      => TD_B7_LEBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_B7_LEBA
            );

            VitalPeriodPulseCheck (
                TestSignal      => LEBA_ipd,
                TestSignalName  => "LEBA_ipd",
                PulseWidthHigh  => tpw_LEBA_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/stdh1655",
                PeriodData      => PD_LEBA,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_LEBA
            );

        END IF;

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_B0_LEBA OR Tviol_B0_CLK OR Tviol_B1_LEBA OR 
                     Tviol_B1_CLK OR Tviol_B2_LEBA OR Tviol_B2_CLK OR 
                     Tviol_B3_LEBA OR Tviol_B3_CLK OR Tviol_B4_LEBA OR 
                     Tviol_B4_CLK OR Tviol_B5_LEBA OR Tviol_B5_CLK OR 
                     Tviol_B6_LEBA OR Tviol_B6_CLK OR Tviol_B7_LEBA OR 
                     Tviol_B7_CLK OR Pviol_LEBA;

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEBA_ipd, CLK_ipd, B0bh),
            Result          => Q0_zd,
            PreviousDataIn  => PrevData0
        );

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEBA_ipd, CLK_ipd, B1bh),
            Result          => Q1_zd,
            PreviousDataIn  => PrevData1
        );

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEBA_ipd, CLK_ipd, B2bh),
            Result          => Q2_zd,
            PreviousDataIn  => PrevData2
        );

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEBA_ipd, CLK_ipd, B3bh),
            Result          => Q3_zd,
            PreviousDataIn  => PrevData3
        );

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEBA_ipd, CLK_ipd, B4bh),
            Result          => Q4_zd,
            PreviousDataIn  => PrevData4
        );

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEBA_ipd, CLK_ipd, B5bh),
            Result          => Q5_zd,
            PreviousDataIn  => PrevData5
        );

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEBA_ipd, CLK_ipd, B6bh),
            Result          => Q6_zd,
            PreviousDataIn  => PrevData6
        );

        VitalStateTable (
            StateTable      => LATNDFF_tab,
            DataIn          => (Violation, LEBA_ipd, CLK_ipd, B7bh),
            Result          => Q7_zd,
            PreviousDataIn  => PrevData7
        );

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01 (
            OutSignal       => A0int,
            OutSignalName   => "A0int",
            OutTemp         => Q0_zd,
            GlitchData      => Q0_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEBA_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEBA_A0,
                      PathCondition     => LEBA_nwv = '1'),
                1 => (InputChangeTime   => A0bh'LAST_EVENT,
                      PathDelay         => tpd_B0_A0,
                      PathCondition     => LEBA_nwv = '1'),
                2 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_A0,
                      PathCondition     => LEBA_nwv = '0')
            )
        );

        VitalPathDelay01 (
            OutSignal       => A1int,
            OutSignalName   => "A1int",
            OutTemp         => Q1_zd,
            GlitchData      => Q1_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEBA_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEBA_A0,
                      PathCondition     => LEBA_nwv = '1'),
                1 => (InputChangeTime   => A0bh'LAST_EVENT,
                      PathDelay         => tpd_B0_A0,
                      PathCondition     => LEBA_nwv = '1'),
                2 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_A0,
                      PathCondition     => LEBA_nwv = '0')
            )
        );

        VitalPathDelay01 (
            OutSignal       => A2int,
            OutSignalName   => "A2int",
            OutTemp         => Q2_zd,
            GlitchData      => Q2_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEBA_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEBA_A0,
                      PathCondition     => LEBA_nwv = '1'),
                1 => (InputChangeTime   => A0bh'LAST_EVENT,
                      PathDelay         => tpd_B0_A0,
                      PathCondition     => LEBA_nwv = '1'),
                2 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_A0,
                      PathCondition     => LEBA_nwv = '0')
            )
        );

        VitalPathDelay01 (
            OutSignal       => A3int,
            OutSignalName   => "A3int",
            OutTemp         => Q3_zd,
            GlitchData      => Q3_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEBA_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEBA_A0,
                      PathCondition     => LEBA_nwv = '1'),
                1 => (InputChangeTime   => A0bh'LAST_EVENT,
                      PathDelay         => tpd_B0_A0,
                      PathCondition     => LEBA_nwv = '1'),
                2 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_A0,
                      PathCondition     => LEBA_nwv = '0')
            )
        );

        VitalPathDelay01 (
            OutSignal       => A4int,
            OutSignalName   => "A4int",
            OutTemp         => Q4_zd,
            GlitchData      => Q4_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEBA_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEBA_A0,
                      PathCondition     => LEBA_nwv = '1'),
                1 => (InputChangeTime   => A0bh'LAST_EVENT,
                      PathDelay         => tpd_B0_A0,
                      PathCondition     => LEBA_nwv = '1'),
                2 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_A0,
                      PathCondition     => LEBA_nwv = '0')
            )
        );

        VitalPathDelay01 (
            OutSignal       => A5int,
            OutSignalName   => "A5int",
            OutTemp         => Q5_zd,
            GlitchData      => Q5_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEBA_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEBA_A0,
                      PathCondition     => LEBA_nwv = '1'),
                1 => (InputChangeTime   => A0bh'LAST_EVENT,
                      PathDelay         => tpd_B0_A0,
                      PathCondition     => LEBA_nwv = '1'),
                2 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_A0,
                      PathCondition     => LEBA_nwv = '0')
            )
        );

        VitalPathDelay01 (
            OutSignal       => A6int,
            OutSignalName   => "A6int",
            OutTemp         => Q6_zd,
            GlitchData      => Q6_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEBA_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEBA_A0,
                      PathCondition     => LEBA_nwv = '1'),
                1 => (InputChangeTime   => A0bh'LAST_EVENT,
                      PathDelay         => tpd_B0_A0,
                      PathCondition     => LEBA_nwv = '1'),
                2 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_A0,
                      PathCondition     => LEBA_ipd = '0')
            )
        );

        VitalPathDelay01 (
            OutSignal       => A7int,
            OutSignalName   => "A7int",
            OutTemp         => Q7_zd,
            GlitchData      => Q7_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => LEBA_ipd'LAST_EVENT,
                      PathDelay         => tpd_LEBA_A0,
                      PathCondition     => LEBA_ipd = '1'),
                1 => (InputChangeTime   => A0bh'LAST_EVENT,
                      PathDelay         => tpd_B0_A0,
                      PathCondition     => LEBA_ipd = '1'),
                2 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_A0,
                      PathCondition     => LEBA_ipd = '0')
            )
        );

    END PROCESS VitalBehavior2;

END vhdl_behavioral;
