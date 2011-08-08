--------------------------------------------------------------------------------
--  File Name: stdh16269.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1999 Free Model Foundry; http://www.FreeModelFoundry.com
-- 
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
-- 
--  MODIFICATION HISTORY:
-- 
--  version: |  author:  | mod date: | changes made:
--    V1.0     R. Munden   99 JAN 29   Initial release
-- 
--------------------------------------------------------------------------------
--  PART DESCRIPTION:
-- 
--  Library:    STNDH
--  Technology: 54/74XXXX
--  Part:       STDH16269
-- 
--  Desciption: Registered Bus Exchanger with 3-State Outputs and Bus Hold
--------------------------------------------------------------------------------

LIBRARY IEEE;   USE IEEE.std_logic_1164.ALL;
                USE IEEE.VITAL_timing.ALL;
                USE IEEE.VITAL_primitives.ALL;
LIBRARY FMF;    USE FMF.gen_utils.ALL;
                USE FMF.ff_package.ALL;

--------------------------------------------------------------------------------
-- ENTITY DECLARATION
--------------------------------------------------------------------------------
ENTITY stdh16269 IS
    GENERIC (
        -- tipd delays: interconnect path delays
        tipd_CLK                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKE1Neg            : VitalDelayType01 := VitalZeroDelay01;
        tipd_CLKE2Neg            : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEANeg              : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEB1Neg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_OEB2Neg             : VitalDelayType01 := VitalZeroDelay01;
        tipd_SEL                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_A                   : VitalDelayType01 := VitalZeroDelay01;
        tipd_N1B                 : VitalDelayType01 := VitalZeroDelay01;
        tipd_N2B                 : VitalDelayType01 := VitalZeroDelay01;
        -- tpd delays
        tpd_CLK_A                : VitalDelayType01Z := UnitDelay01Z;
        tpd_CLK_N1B              : VitalDelayType01Z := UnitDelay01Z;
        -- tsetup values: setup times
        tsetup_A_CLK             : VitalDelayType := UnitDelay;
        tsetup_N1B_CLK           : VitalDelayType := UnitDelay;
        tsetup_SEL_CLK           : VitalDelayType := UnitDelay;
        tsetup_CLKE1Neg_CLK      : VitalDelayType := UnitDelay;
        tsetup_OEANeg_CLK        : VitalDelayType := UnitDelay;
        -- thold values: hold times
        thold_A_CLK              : VitalDelayType := UnitDelay;
        thold_N1B_CLK            : VitalDelayType := UnitDelay;
        thold_SEL_CLK            : VitalDelayType := UnitDelay;
        thold_CLKE1Neg_CLK       : VitalDelayType := UnitDelay;
        thold_OEANeg_CLK         : VitalDelayType := UnitDelay;
        -- tperiod_min: minimum clock period = 1/max freq
        tperiod_CLK_posedge : VitalDelayType := UnitDelay;
        -- tpw values: pulse widths
        tpw_CLK_posedge          : VitalDelayType := UnitDelay;
        tpw_CLK_negedge          : VitalDelayType := UnitDelay;
        -- generic control parameters
        InstancePath        : STRING    := DefaultInstancePath;
        TimingChecksOn      : BOOLEAN   := DefaultTimingChecks;
        MsgOn               : BOOLEAN   := DefaultMsgOn;
        XOn                 : BOOLEAN   := DefaultXon;
        -- For FMF SDF technology file usage
        TimingModel         : STRING    := DefaultTimingModel
    );
    PORT (
        CLK             : IN    std_logic := 'U';
        OEANeg          : IN    std_logic := 'U';
        OEB2Neg         : IN    std_logic := 'U';
        CLKE1Neg        : IN    std_logic := 'U';
        CLKE2Neg        : IN    std_logic := 'U';
        SEL             : IN    std_logic := 'U';
        OEB1Neg         : IN    std_logic := 'U';
        N2B             : INOUT std_logic := 'U';
        A               : INOUT std_logic := 'U';
        N1B             : INOUT std_logic := 'U'
    );
    ATTRIBUTE VITAL_LEVEL0 of stdh16269 : ENTITY IS TRUE;
END stdh16269;

--------------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
--------------------------------------------------------------------------------
ARCHITECTURE vhdl_behavioral of stdh16269 IS
    ATTRIBUTE VITAL_LEVEL1 of vhdl_behavioral : ARCHITECTURE IS False;

    SIGNAL CLK_ipd             : std_ulogic := 'X';
    SIGNAL OEANeg_ipd          : std_ulogic := 'X';
    SIGNAL OEB2Neg_ipd         : std_ulogic := 'X';
    SIGNAL CLKE1Neg_ipd        : std_ulogic := 'X';
    SIGNAL CLKE2Neg_ipd        : std_ulogic := 'X';
    SIGNAL SEL_ipd             : std_ulogic := 'X';
    SIGNAL OEB1Neg_ipd         : std_ulogic := 'X';
    SIGNAL N2B_ipd             : std_ulogic := 'X';
    SIGNAL A_ipd               : std_ulogic := 'X';
    SIGNAL N1B_ipd             : std_ulogic := 'X';
    SIGNAL Amux                : std_ulogic := 'X';
    SIGNAL A1int               : std_ulogic := 'X';
    SIGNAL A2int               : std_ulogic := 'X';
    SIGNAL Abh                 : std_logic  := 'X';
    SIGNAL N1Bbh               : std_logic  := 'X';
    SIGNAL N2Bbh               : std_logic  := 'X';
    SIGNAL AbhNeg              : std_ulogic := 'X';
    SIGNAL N1BbhNeg            : std_ulogic := 'X';
    SIGNAL N2BbhNeg            : std_ulogic := 'X';

BEGIN

    ----------------------------------------------------------------------------
    -- Wire Delays
    ----------------------------------------------------------------------------
    WireDelay : BLOCK
    BEGIN

        w_1 : VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
        w_2 : VitalWireDelay (OEANeg_ipd, OEANeg, tipd_OEANeg);
        w_3 : VitalWireDelay (OEB2Neg_ipd, OEB2Neg, tipd_OEB2Neg);
        w_4 : VitalWireDelay (CLKE1Neg_ipd, CLKE1Neg, tipd_CLKE1Neg);
        w_5 : VitalWireDelay (CLKE2Neg_ipd, CLKE2Neg, tipd_CLKE2Neg);
        w_6 : VitalWireDelay (SEL_ipd, SEL, tipd_SEL);
        w_7 : VitalWireDelay (OEB1Neg_ipd, OEB1Neg, tipd_OEB1Neg);
        w_8 : VitalWireDelay (N2B_ipd, N2B, tipd_N2B);
        w_9 : VitalWireDelay (A_ipd, A, tipd_A);
        w_10 : VitalWireDelay (N1B_ipd, N1B, tipd_N1B);

    END BLOCK;

    ----------------------------------------------------------------------------
    -- Concurrent procedure calls
    ----------------------------------------------------------------------------
    bh_1: VitalBUF (q => Abh, a => A_ipd, ResultMap => ('U', 'Z', '0', '1'));
    bh_2: VitalINV (q => AbhNeg, a => Abh);
    bh_3: VitalINV (q => Abh, a => AbhNeg, ResultMap => ('Z', 'Z', '0', '1'));

    bh_4: VitalBUF (q => N1Bbh, a => N1B_ipd, 
                    ResultMap => ('U', 'Z', '0', '1'));
    bh_5: VitalINV (q => N1BbhNeg, a => N1Bbh);
    bh_6: VitalINV (q => N1Bbh, a => N1BbhNeg,
                    ResultMap => ('Z', 'Z', '0', '1'));

    bh_7: VitalBUF (q => N2Bbh, a => N2B_ipd, 
                    ResultMap => ('U', 'Z', '0', '1'));
    bh_8: VitalINV (q => N2BbhNeg, a => N2Bbh);
    bh_9: VitalINV (q => N2Bbh, a => N2BbhNeg, 
                    ResultMap => ('Z', 'Z', '0', '1'));

    a_1: VitalMUX2 (
            q            => Amux,
            d1           => N1Bbh,
            d0           => N2Bbh,
            dsel         => SEL_ipd);

    ----------------------------------------------------------------------------
    -- Main Behavior Process
    ----------------------------------------------------------------------------
    VitalBehavior1 : PROCESS (CLK_ipd, N1Bbh, N2Bbh, OEANeg_ipd, OEB2Neg_ipd, 
                              CLKE1Neg_ipd, CLKE2Neg_ipd, SEL_ipd, OEB1Neg_ipd)

        -- Timing Check Variables
        VARIABLE Tviol_A_CLK        : X01 := '0';
        VARIABLE TD_A_CLK           : VitalTimingDataType;

        VARIABLE Tviol_N1B_CLK      : X01 := '0';
        VARIABLE TD_N1B_CLK         : VitalTimingDataType;

        VARIABLE Tviol_N2B_CLK      : X01 := '0';
        VARIABLE TD_N2B_CLK         : VitalTimingDataType;

        VARIABLE Tviol_SEL_CLK      : X01 := '0';
        VARIABLE TD_SEL_CLK         : VitalTimingDataType;

        VARIABLE Tviol_CLKE1_CLK    : X01 := '0';
        VARIABLE TD_CLKE1_CLK       : VitalTimingDataType;

        VARIABLE Tviol_CLKE2_CLK    : X01 := '0';
        VARIABLE TD_CLKE2_CLK       : VitalTimingDataType;

        VARIABLE Tviol_OEB1_CLK     : X01 := '0';
        VARIABLE TD_OEB1_CLK        : VitalTimingDataType;

        VARIABLE Tviol_OEB2_CLK     : X01 := '0';
        VARIABLE TD_OEB2_CLK        : VitalTimingDataType;

        VARIABLE Tviol_OEA_CLK      : X01 := '0';
        VARIABLE TD_OEA_CLK         : VitalTimingDataType;

        VARIABLE Pviol_CLK          : X01 := '0';
        VARIABLE PD_CLK             : VitalPeriodDataType := VitalPeriodDataInit;

        VARIABLE Violation          : X01 := '0';

        -- Functionality Results Variables
        VARIABLE OEB1int            : std_ulogic;
        VARIABLE OEB2int            : std_ulogic;
        VARIABLE OEAint             : std_ulogic;
        VARIABLE SELint             : std_ulogic;
        VARIABLE PrevData1          : std_logic_vector(0 to 2);
        VARIABLE PrevData2          : std_logic_vector(0 to 2);
        VARIABLE PrevData3          : std_logic_vector(0 to 2);
        VARIABLE PrevData4          : std_logic_vector(0 to 2);
        VARIABLE PrevData5          : std_logic_vector(0 to 2);
        VARIABLE PrevData6          : std_logic_vector(0 to 3);
        VARIABLE PrevData7          : std_logic_vector(0 to 3);
        VARIABLE A_zd               : std_ulogic;
        VARIABLE Aint               : std_ulogic;
        VARIABLE N1Bint             : std_ulogic;
        VARIABLE N2Bint             : std_ulogic;
        VARIABLE N1B_zd             : std_ulogic;
        VARIABLE N2B_zd             : std_ulogic;

        -- Output Glitch Detection Variables
        VARIABLE A_GlitchData       : VitalGlitchDataType;
        VARIABLE N1B_GlitchData     : VitalGlitchDataType;
        VARIABLE N2B_GlitchData     : VitalGlitchDataType;

    BEGIN
        ------------------------------------------------------------------------
        -- Timing Check Section
        ------------------------------------------------------------------------
        IF (TimingChecksOn) THEN

            VitalSetupHoldCheck (
                TestSignal      => OEANeg_ipd,
                TestSignalName  => "OEANeg",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_OEANeg_CLK,
                SetupLow        => tsetup_OEANeg_CLK,
                HoldHigh        => thold_OEANeg_CLK,
                HoldLow         => thold_OEANeg_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16269",
                TimingData      => TD_OEA_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_OEA_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => OEB1Neg_ipd,
                TestSignalName  => "OEB1Neg",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_OEANeg_CLK,
                SetupLow        => tsetup_OEANeg_CLK,
                HoldHigh        => thold_OEANeg_CLK,
                HoldLow         => thold_OEANeg_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16269",
                TimingData      => TD_OEB1_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_OEB1_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => OEB2Neg_ipd,
                TestSignalName  => "OEB2Neg",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_OEANeg_CLK,
                SetupLow        => tsetup_OEANeg_CLK,
                HoldHigh        => thold_OEANeg_CLK,
                HoldLow         => thold_OEANeg_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16269",
                TimingData      => TD_OEB2_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_OEB2_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => CLKE1Neg_ipd,
                TestSignalName  => "CLKE1Neg",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_CLKE1Neg_CLK,
                SetupLow        => tsetup_CLKE1Neg_CLK,
                HoldHigh        => thold_CLKE1Neg_CLK,
                HoldLow         => thold_CLKE1Neg_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16269",
                TimingData      => TD_CLKE1_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLKE1_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => CLKE2Neg_ipd,
                TestSignalName  => "CLKE2Neg",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_CLKE1Neg_CLK,
                SetupLow        => tsetup_CLKE1Neg_CLK,
                HoldHigh        => thold_CLKE1Neg_CLK,
                HoldLow         => thold_CLKE1Neg_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16269",
                TimingData      => TD_CLKE2_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_CLKE2_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => SEL_ipd,
                TestSignalName  => "SEL",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_SEL_CLK,
                SetupLow        => tsetup_SEL_CLK,
                HoldHigh        => thold_SEL_CLK,
                HoldLow         => thold_SEL_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16269",
                TimingData      => TD_SEL_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_SEL_CLK
            );

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
                HeaderMsg       => InstancePath & "/stdh16269",
                TimingData      => TD_A_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_A_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => N1Bbh,
                TestSignalName  => "N1Bbh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_N1B_CLK,
                SetupLow        => tsetup_N1B_CLK,
                HoldHigh        => thold_N1B_CLK,
                HoldLow         => thold_N1B_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16269",
                TimingData      => TD_N1B_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_N1B_CLK
            );

            VitalSetupHoldCheck (
                TestSignal      => N2Bbh,
                TestSignalName  => "N2Bbh",
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK_ipd",
                SetupHigh       => tsetup_N1B_CLK,
                SetupLow        => tsetup_N1B_CLK,
                HoldHigh        => thold_N1B_CLK,
                HoldLow         => thold_N1B_CLK,
                CheckEnabled    => TRUE,
                RefTransition   => '/',
                HeaderMsg       => InstancePath & "/stdh16269",
                TimingData      => TD_N2B_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Tviol_N2B_CLK
            );

            VitalPeriodPulseCheck (
                TestSignal      => CLK_ipd,
                TestSignalName  => "CLK_ipd",
                Period          => tperiod_CLK_posedge,
                PulseWidthHigh  => tpw_CLK_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "/stdh16269",
                PeriodData      => PD_CLK,
                XOn             => XOn,
                MsgOn           => MsgOn,
                Violation       => Pviol_CLK
            );

        END IF;
 
        ------------------------------------------------------------------------
        -- Functionality Section
        ------------------------------------------------------------------------
        Violation := Tviol_A_CLK OR Tviol_N1B_CLK OR Pviol_CLK OR Tviol_N2B_CLK
                     OR Tviol_SEL_CLK OR Tviol_CLKE1_CLK OR Tviol_CLKE2_CLK OR
                     Tviol_OEB1_CLK OR Tviol_OEB2_CLK OR Tviol_OEA_CLK;

        VitalStateTable (                    
            StateTable      => DFF_tab,
            DataIn          => (Violation, CLK_ipd, OEB1Neg_ipd),
            Result          => OEB1int,
            PreviousDataIn  => PrevData1
        );

        VitalStateTable (                    
            StateTable      => DFF_tab,
            DataIn          => (Violation, CLK_ipd, OEB2Neg_ipd),
            Result          => OEB2int,
            PreviousDataIn  => PrevData2
        );

        VitalStateTable (                    
            StateTable      => DFF_tab,
            DataIn          => (Violation, CLK_ipd, SEL_ipd),
            Result          => SELint,
            PreviousDataIn  => PrevData3
        );

        VitalStateTable (                    
            StateTable      => DFF_tab,
            DataIn          => (Violation, CLK_ipd, OEANeg_ipd),
            Result          => OEAint,
            PreviousDataIn  => PrevData4
        );

        VitalStateTable (                    
            StateTable      => DFF_tab,
            DataIn          => (Violation, CLK_ipd, Amux),
            Result          => Aint,
            PreviousDataIn  => PrevData5
        );

        VitalStateTable (                    
            StateTable      => DFFCEN_tab,
            DataIn          => (Violation, CLKE1Neg_ipd, CLK_ipd, A_ipd),
            Result          => N1Bint,
            PreviousDataIn  => PrevData6
        );

        VitalStateTable (                    
            StateTable      => DFFCEN_tab,
            DataIn          => (Violation, CLKE2Neg_ipd, CLK_ipd, A_ipd),
            Result          => N2Bint,
            PreviousDataIn  => PrevData7
        );

        A_zd := VitalBUFIF0 (data => Aint, enable => OEAint );
        N1B_zd := VitalBUFIF0 (data => N1Bint, enable => OEB1int );
        N2B_zd := VitalBUFIF0 (data => N2Bint, enable => OEB2int );

        ------------------------------------------------------------------------
        -- Path Delay Section
        ------------------------------------------------------------------------
        VitalPathDelay01Z (
            OutSignal       => A,
            OutSignalName   => "A",
            OutTemp         => A_zd,
            GlitchData      => A_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_A,
                      PathCondition     => TRUE)
            )
        );

        VitalPathDelay01Z (
            OutSignal       => N1B,
            OutSignalName   => "N1B",
            OutTemp         => N1B_zd,
            GlitchData      => N1B_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_N1B,
                      PathCondition     => TRUE)
            )
        );

        VitalPathDelay01Z (
            OutSignal       => N2B,
            OutSignalName   => "N2B",
            OutTemp         => N2B_zd,
            GlitchData      => N2B_GlitchData,
            XOn             => XOn,
            MsgOn           => MsgOn,
            Paths           => (
                0 => (InputChangeTime   => CLK_ipd'LAST_EVENT,
                      PathDelay         => tpd_CLK_N1B,
                      PathCondition     => TRUE)
            )
        );

    END PROCESS;

END vhdl_behavioral;
