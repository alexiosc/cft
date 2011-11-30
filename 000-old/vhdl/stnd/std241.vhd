--------------------------------------------------------------------------------
--   File Name : std241.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 2005-2008 Free Model Foundation; http://FreeModelFoundry.com
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--  MODIFICATION HISTORY :
--
--  version no: |   author:   |  mod. date: |   changes made:
--    V1.0        D. Lukovic     05 Jun 28     Initial release
--    V1.1        R. Munden      08 Aug 16     Corrected timing generic names
--
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
--
--  Library:     STD
--  Technology:  54/74XXXX
--  Part:        STD241
--
--  Desciption:  BUFFER/DRIVER WITH 3-STATE OUTPUTS
--------------------------------------------------------------------------------

LIBRARY IEEE;    USE IEEE.std_logic_1164.ALL;
                 USE IEEE.VITAL_primitives.all;
                 USE IEEE.VITAL_timing.all;
LIBRARY FMF;     USE FMF.gen_utils.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY std241 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_A1          : VitalDelayType01  := VitalZeroDelay01;
        tipd_OE1Neg      : VitalDelayType01  := VitalZeroDelay01;
        tipd_A2          : VitalDelayType01  := VitalZeroDelay01;
        tipd_OE2         : VitalDelayType01  := VitalZeroDelay01;
        -- tpd delays:
        tpd_A1_Y1         : VitalDelayType01  := UnitDelay01;
        tpd_OE1Neg_Y1     : VitalDelayType01Z := UnitDelay01Z;
        -- generic control parameters
        TimingChecksOn  : BOOLEAN   := DefaultTimingChecks;
        MsgOn           : BOOLEAN   := DefaultMsgOn;
        XOn             : Boolean   := DefaultXOn;
        InstancePath    : STRING    := DefaultInstancePath;
        -- For FMF SDF techonology file usage
        TimingModel     : STRING    := DefaultTimingModel
        );
    PORT (
        A1               : IN    STD_LOGIC := 'U';
        Y1               : OUT   STD_LOGIC := 'U';
        OE1Neg           : IN    STD_LOGIC := 'U';
        A2               : IN    STD_LOGIC := 'U';
        Y2               : OUT   STD_LOGIC := 'U';
        OE2              : IN    STD_LOGIC := 'U'
    );

    ATTRIBUTE VITAL_LEVEL0 of std241 : ENTITY IS TRUE;
END std241;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of std241 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS TRUE;

    SIGNAL A1_ipd            : std_ulogic := 'U';
    SIGNAL OE1Neg_ipd        : std_ulogic := 'U';
    SIGNAL A2_ipd            : std_ulogic := 'U';
    SIGNAL OE2_ipd           : std_ulogic := 'U';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w1: VitalWireDelay (A1_ipd, A1, tipd_A1);
        w2: VitalWireDelay (A2_ipd, A2, tipd_A2);
        w3: VitalWireDelay (OE1Neg_ipd, OE1Neg, tipd_OE1Neg);
        w4: VitalWireDelay (OE2_ipd, OE2, tipd_OE2);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- VITALBehavior Process
    ----------------------------------------------------------------------------
    VITALBehavior1 : PROCESS(A1_ipd,OE1Neg_ipd,A2_ipd,OE2_ipd)

        -- Functionality Results Variables
        VARIABLE Y1_zd               : std_ulogic;
        VARIABLE Y2_zd               : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE Y1_GlitchData       : VitalGlitchDataType;
        VARIABLE Y2_GlitchData       : VitalGlitchDataType;

    BEGIN

        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------

         Y1_zd := VitalBUFIF0 (data => A1_ipd, enable => OE1Neg_ipd );
         Y2_zd := VitalBUFIF0 (data => A2_ipd, enable => NOT(OE2_ipd));

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       => Y1,
            OutSignalName   => "Y1",
            OutTemp         => Y1_zd,
            GlitchData      => Y1_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A1_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A1_Y1),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => OE1Neg_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_Y1,
                      PathCondition     => TRUE)
            )
        );

        VitalPathDelay01Z (
            OutSignal       => Y2,
            OutSignalName   => "Y2",
            OutTemp         => Y2_zd,
            GlitchData      => Y2_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => A2_ipd'LAST_EVENT,
                      PathDelay         => VitalExtendToFillDelay(tpd_A1_Y1),
                      PathCondition     => TRUE),
                1 => (InputChangeTime   => OE2_ipd'LAST_EVENT,
                      PathDelay         => tpd_OE1Neg_Y1,
                      PathCondition     => TRUE)
            )
        );
       
    END PROCESS;

END vhdl_behavioral;
