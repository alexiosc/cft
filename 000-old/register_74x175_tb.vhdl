library STD;
use STD.STANDARD.all, STD.TEXTIO.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.utils.all;
use work.bv_arithmetic.all;


entity register_tb is
end register_tb;



architecture register_behav of register_tb is

  for ALL : reg74x175
    use entity work.register_74x175(behav);

  component reg74x175
    port (
      d :    in  bit_vector (3 downto 0);
      clock: in bit;
      clear: in bit;
      q :    out bit_vector (3 downto 0);
      notq : out bit_vector (3 downto 0)
    );
  end component;

  signal d: bit_vector(3 downto 0);
  signal q: bit_vector(3 downto 0);
  signal notq: bit_vector(3 downto 0);
  signal clear, clk: bit;
  
begin  -- behav
  -- Component instantiation

  counter0 : reg74x175 port map (d=>d, clock=>clk, clear=>clear, q=>q, notq=>notq);

  process
    type pattern_type is record
              -- inputs
              clock:      natural;
              clear:      natural;
              d:          natural;
              
              -- outputs
              q:          natural;
    end record;

    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
      (
--       CLK, CLR,   D,  Expected Q
        (  0,   1,   0,  0),
        (  1,   1,   0,  0),
        (  0,   1,  15,  0),
        (  1,   1,  15,  15),
        (  0,   1,   1,  15),
        (  1,   1,   1,   1),
        (  0,   1,   2,   1),
        (  1,   1,   2,   2),
        (  0,   1,   3,   2),
        (  1,   1,   3,   3),
        (  0,   1,   4,   3),
        (  1,   1,   4,   4),
        (  0,   1,   5,   4),
        (  1,   1,   5,   5),
        (  0,   1,   6,   5),
        (  1,   1,   6,   6),
        (  0,   1,   7,   6),
        (  1,   1,   7,   7),
        (  0,   1,   8,   7),
        (  1,   1,   8,   8),
        (  0,   1,   9,   8),
        (  1,   1,   9,   9),
        (  0,   1,  10,   9),
        (  1,   1,  10,  10),

        (  0,   0,  10,   0),           -- Clear works asynchronously
        (  1,   0,  10,   0),           -- Clear works asynchronously
        (  0,   0,  15,   0),           -- Clear works asynchronously
        (  1,   0,  15,   0),           -- Clear works asynchronously
        (  0,   0,  15,   0),           -- Clear works asynchronously
        (  1,   1,  11,  11),           -- Clear works asynchronously
        
        (  0,   1,  11,  11),
        (  1,   1,  11,  11),
        (  0,   1,  12,  11),
        (  1,   1,  12,  12),
        (  0,   1,  13,  12),
        (  1,   1,  13,  13),
        (  0,   1,  14,  13),
        (  1,   1,  14,  14),
        (  0,   1,  15,  14),
        (  1,   1,  15,  15),
        (  0,   1,  15,  15),
        
        (  1,   1,   3,   3),
        (  0,   0,   3,   0),           -- Clear works asynchronously
        (  1,   0,   0,   0)
      );


    variable l : line;
    
  begin
    -- Initialise.
    d <= "0000";
    clear <= '0';
    clk <= '0';
    wait for 200 ns;
    
    write (l, string'("    time  ###  clk   -CLR    d  q_exp  q_act not_q"));
    writeline (output, l);

    for i in patterns'range loop
      clk <= natural_to_bv(patterns(i).clock, 1)(0);
      clear <= natural_to_bv(patterns(i).clear, 1)(0);
      d <= natural_to_bv(patterns(i).d, 4);
      wait for 200 ns;

      write (l, NOW, right, 8);
      write (l, i, right, 5 );
      write (l, clk, right, 5);
      write (l, clear, right, 7);
      write (l, d, right, 5);
      write (l, integer_to_bv(patterns(i).q, 4), right, 7);
      write (l, q, right, 7);
      write (l, notq, right, 7);
      writeline (output, l);

      assert q = natural_to_bv (patterns(i).q, q'length)
        report "expected and actual Q differ" severity error;

      assert q = not notq
        report "Q AND ~Q differ" severity error;

    end loop;

    wait;
    
  end process;
end register_behav;


-- End of file.
