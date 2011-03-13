library STD;
use STD.STANDARD.all, STD.TEXTIO.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.utils.all;
use work.bv_arithmetic.all;


ENTITY pc IS
  PORT(   
    d       : IN    bit_vector (15 downto 0);
    clock   : IN    bit;
    clear   : IN    bit;
    load    : IN    bit;
    q       : OUT   std_logic_vector (15 downto 0)
    );
END counter;


architecture behavioural of pc is

  for ALL : counter_74x561
    use entity work.counter_74x561(behav);

  component counter_74x561
    port (
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
  end component;

  signal d: bit_vector(3 downto 0);
  signal q: std_logic_vector(3 downto 0);
  signal oe, aclr, aload, sclr, sload, ent, enp, clk, cco, rco: bit;
  
begin  -- behav
  -- Component instantiation

  counter0 : counter_74x561 port map (oe=>oe, aclr=>aclr, aload=>aload,
                                      sclr=>sclr, sload=>sload,
                                      ent=>ent, enp=>enp,
                                      clk=>clk, d=>d, q=>q, cco=>cco, rco=>rco);

  process
    type pattern_type is record
              -- inputs
              clk:        natural;
              
              oe:         natural;
              aclr:       natural;
              sclr:       natural;
              aload:      natural;
              sload:      natural;

              enp:        natural;
              ent:        natural;
              
              d:          natural;
              
              -- outputs
              q:          natural;
              rco:        natural;
              cco:        natural;
    end record;

    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
      (
-- Q = 99 signifies ZZZZ state. (this is a HACK)
--
--       CLK, OE, ACL, SCL, ALD, SLD, ENP, ENT,  D,   Expected: Q, RCO, CCO

--       Initialisation, no clock, no counting, async clear.
--       CLK, OE, ACL, SCL, ALD, SLD, ENP, ENT,  D,   Expected: Q, RCO, CCO
        (  0,  0,   0,   1,   1,   1,   1,   1,  0,             0,   0,  0),
        (  0,  0,   0,   1,   1,   1,   1,   1,  0,             0,   0,  0),
        (  0,  0,   0,   1,   1,   1,   1,   1,  0,             0,   0,  0),

--       Async load.
--       CLK, OE, ACL, SCL, ALD, SLD, ENP, ENT,  D,   Expected: Q, RCO, CCO
        (  0,  0,   1,   1,   0,   1,   1,   1, 12,            12,   0,  0),
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,            12,   0,  0),
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,            12,   0,  0),

--       Now start counting (ENP=ENT=1), clock starts.
--       CLK, OE, ACL, SCL, ALD, SLD, ENP, ENT,  D,   Expected: Q, RCO, CCO
        (  1,  0,   1,   1,   1,   1,   1,   1,  0,            13,   0,  0),
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,            13,   0,  0),
        (  1,  0,   1,   1,   1,   1,   1,   1,  0,            14,   0,  0),
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,            14,   0,  0),
        (  1,  0,   1,   1,   1,   1,   1,   1,  0,            15,   1,  0),
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,            15,   1,  1),
        (  1,  0,   1,   1,   1,   1,   1,   1,  0,             0,   0,  0),
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,             0,   0,  0),
        (  1,  0,   1,   1,   1,   1,   1,   1,  0,             1,   0,  0),
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,             1,   0,  0),


--       Synchronous clear.
--       CLK, OE, ACL, SCL, ALD, SLD, ENP, ENT,  D,   Expected: Q, RCO, CCO
        (  0,  0,   1,   0,   1,   1,   1,   1,  0,             1,   0,  0),
        (  1,  0,   1,   0,   1,   1,   1,   1,  0,             0,   0,  0),


--       Synchronous load.
--       CLK, OE, ACL, SCL, ALD, SLD, ENP, ENT,  D,   Expected: Q, RCO, CCO
        (  0,  0,   1,   1,   1,   0,   1,   1, 13,             0,   0,  0),
        (  1,  0,   1,   1,   1,   0,   1,   1, 13,            13,   0,  0),


--       Counting
--       CLK, OE, ACL, SCL, ALD, SLD, ENP, ENT,  D,   Expected: Q, RCO, CCO
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,            13,   0,  0),
        (  1,  0,   1,   1,   1,   1,   1,   1,  0,            14,   0,  0),
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,            14,   0,  0),
        (  1,  0,   1,   1,   1,   1,   1,   1,  0,            15,   1,  0),
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,            15,   1,  1),
        (  1,  0,   1,   1,   1,   1,   1,   1,  0,             0,   0,  0),
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,             0,   0,  0),
        (  1,  0,   1,   1,   1,   1,   1,   1,  0,             1,   0,  0),
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,             1,   0,  0),


--       Counting with OE high (silent counting)
--       CLK, OE, ACL, SCL, ALD, SLD, ENP, ENT,  D,   Expected: Q, RCO, CCO
        (  0,  1,   1,   1,   1,   1,   1,   1,  0,             1,   0,  0),
        (  1,  1,   1,   1,   1,   1,   1,   1,  0,             2,   0,  0),
        (  0,  1,   1,   1,   1,   1,   1,   1,  0,             2,   0,  0),
        (  1,  1,   1,   1,   1,   1,   1,   1,  0,             3,   1,  0),
        (  0,  1,   1,   1,   1,   1,   1,   1,  0,             3,   1,  1),
        (  1,  1,   1,   1,   1,   1,   1,   1,  0,             4,   0,  0),
        (  0,  1,   1,   1,   1,   1,   1,   1,  0,             4,   0,  0),
        (  1,  1,   1,   1,   1,   1,   1,   1,  0,             5,   0,  0),
        (  0,  1,   1,   1,   1,   1,   1,   1,  0,             5,   0,  0),
        (  1,  0,   1,   1,   1,   1,   1,   1,  0,             6,   0,  0),
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,             6,   0,  0),
        (  1,  0,   1,   1,   1,   1,   1,   1,  0,             7,   0,  0),
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,             7,   0,  0),


--       Inhibiting counting (ENP or ENT going low)
--       CLK, OE, ACL, SCL, ALD, SLD, ENP, ENT,  D,   Expected: Q, RCO, CCO
        (  0,  0,   1,   1,   1,   1,   0,   1,  0,             7,   0,  0),
        (  1,  0,   1,   1,   1,   1,   0,   1,  0,             7,   0,  0),
        (  0,  0,   1,   1,   1,   1,   0,   1,  0,             7,   0,  0),
        (  1,  0,   1,   1,   1,   1,   0,   1,  0,             7,   0,  0),
        (  0,  0,   1,   1,   1,   1,   0,   0,  0,             7,   0,  0),
        (  1,  0,   1,   1,   1,   1,   0,   0,  0,             7,   0,  0),
        (  0,  0,   1,   1,   1,   1,   0,   0,  0,             7,   0,  0),
        (  1,  0,   1,   1,   1,   1,   1,   0,  0,             7,   0,  0),
        (  0,  0,   1,   1,   1,   1,   1,   0,  0,             7,   0,  0),
        (  1,  0,   1,   1,   1,   1,   1,   0,  0,             7,   0,  0),
        (  0,  0,   1,   1,   1,   1,   1,   0,  0,             7,   0,  0),
        (  1,  0,   1,   1,   1,   1,   1,   1,  0,             8,   0,  0),
        (  0,  0,   1,   1,   1,   1,   1,   1,  0,             8,   0,  0),


--       The final line (merely a placeholder -- we've already tested this)
--       CLK, OE, ACL, SCL, ALD, SLD, ENP, ENT,  D,   Expected: Q, RCO, CCO
        (  0,  0,   0,   1,   1,   1,   1,   1,  0,             0,   0,  0)

        );


    variable l : line;
    
  begin
    -- Initialise.
    d <= "0000";
    oe <= '1';
    aclr <= '1';
    aload <= '1';
    sclr <= '1';
    sload <= '1';
    ent <= '0';
    enp <= '0';
    clk <= '0';
    wait for 200 ns;
    
    write (l, string'("               INPUTS                                       EXPECTED OUT    ACTUAL OUT"));
    writeline (output, l);
    write (l, string'("    time  ###  clk   oe  acl  ald  scl  sld  ent  enp    d     q  rco cco      q  rco cco"));
    writeline (output, l);
    write (l, string'("----------------------------------------------------------  -------------------------------"));
    writeline (output, l);

    for i in patterns'range loop
      clk <= natural_to_bv(patterns(i).clk, 1)(0);
      oe <= natural_to_bv(patterns(i).oe, 1)(0);

      aclr <= natural_to_bv(patterns(i).aclr, 1)(0);
      aload <= natural_to_bv(patterns(i).aload, 1)(0);
      sclr <= natural_to_bv(patterns(i).sclr, 1)(0);
      sload <= natural_to_bv(patterns(i).sload, 1)(0);
      ent <= natural_to_bv(patterns(i).ent, 1)(0);
      enp <= natural_to_bv(patterns(i).enp, 1)(0);

      d <= natural_to_bv(patterns(i).d, 4);

      wait for 200 ns;

      write (l, NOW, right, 8);
      write (l, i, right, 5 );
      write (l, clk, right, 5);
      write (l, oe, right, 5);
      write (l, aclr, right, 5);
      write (l, aload, right, 5);
      write (l, sclr, right, 5);
      write (l, sload, right, 5);
      write (l, ent, right, 5);
      write (l, enp, right, 5);

      write (l, d, right, 5);

      -- Such a hack.
      if oe = '1' then
        write (l, string'("ZZZZ"), right, 6);
      else
        write (l, integer_to_bv(patterns(i).q, 4), right, 6);
      end if;
      
      write (l, patterns(i).rco, right, 5);
      write (l, patterns(i).cco, right, 4);

      if q = "ZZZZ" then
        write (l, string'("ZZZZ"), right, 7);
      else
        write (l, to_bitvector (q), right, 7);
      end if;
      write (l, rco, right, 5);
      write (l, cco, right, 4);
      writeline (output, l);

      if oe = '1' then
        assert (oe = '1') and (q = "ZZZZ")
          report "output disabled (-OE high), but output not high-impedance." severity error;
      else
        assert (to_bitvector(q) = integer_to_bv(patterns(i).q, 4))
          report "Expected value of Q differs from actual one." severity error;

        assert rco = natural_to_bv(patterns(i).rco, 1)(0)
          report "Expected value of RCO differs from actual one." severity error;

        assert cco = natural_to_bv(patterns(i).cco, 1)(0)
          report "Expected value of CCO differs from actual one." severity error;

     end if;

    end loop;

    wait;
    
  end process;
end counter_74x561_behav;


-- End of file.
