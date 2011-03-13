library STD;
use STD.STANDARD.all, STD.TEXTIO.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.bv_arithmetic.all;
use work.utils.all;

ENTITY counter_74x561 IS
  GENERIC (
    delay : time    := 15 ns
  );

  PORT(
    -- INPUTS
    oe      : IN   bit;
    aclr    : IN   bit;                -- Active low
    aload   : IN   bit;                -- Active low
    sclr    : IN   bit;                -- Active low
    sload   : IN   bit;                -- Active low

    ent     : IN   bit;
    enp     : IN   bit;

    clk     : IN   bit;
    
    d       : IN   bit_vector (3 downto 0);

    -- OUTPUTS
    q       : OUT  std_logic_vector (3 downto 0);
    cco     : OUT  bit;
    rco     : OUT  bit
    );
END counter_74x561;

ARCHITECTURE behav OF counter_74x561 IS
BEGIN
    -- The 74x561 counter.
    --
    -- -OE  -ACLR  -ALOAD   -SCLR  -SLOAD  ENT  ENP CLK   Result
    -- ----------------------------------------------------------------------
    --   1      X       X       X       X    X    X   X   Q outputs disabled.
    --   0      0       X       X       X    X    X   X   Async clear.
    --   0      1       1       X       X    X    X   X   Async load.
    --   0      1       1       0       X    X    X   /   Sync clear.
    --   0      1       1       1       0    X    X   /   Sync load.
    --   0      1       1       1       1    1    1   /   count++
    --   0      1       1       1       1    0    X   X   inhibit counting
    --   0      1       1       1       1    X    0   X   inhibit counting
    -- ----------------------------------------------------------------------
    PROCESS (clk, oe, aclr, aload)
         VARIABLE count : bit_vector(3 downto 0); 
    BEGIN
      -- Synchronous operation
      IF (clk'EVENT AND clk = '1') THEN
        if (sclr = '0') then              -- Synchronous clear
          count := "0000";
        elsif (sload = '0') then     
          count := d;                   -- Synchronous load
        elsif (ent = '1' and enp = '1') then
          -- Allow counting to be inhibited if ent or enp are low.
          count := integer_to_bv(bv_to_integer(count) + 1, 4);
        end if;
      END IF;

      -- Asynchronous stuff.
      if (aclr = '0') then
        count := "0000";
      elsif (aload = '0') then
        count := d;
      end if;

      -- Output value (if enabled)
      if (oe = '0') then
        q <= To_StdLogicVector(count) after delay;
      else
        q <= "ZZZZ" after delay;        -- High impendance if OE is high.
      end if;

      -- Calculate RCO and CCO (these are independent of -OE).
      if (count = "1111") then
        rco <= '1' after delay;

        -- Set CCO on the clock's falling edge.
        if (clk'event and clk = '0') then
          cco <= '1' after delay;
        end if;
      else
        rco <= '0' after delay;
        cco <= '0' after delay;         -- But clear CCO immediately.
      end if;
      
    End PROCESS;
END behav;
