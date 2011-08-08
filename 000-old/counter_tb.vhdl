library STD;
use STD.STANDARD.all, STD.TEXTIO.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.utils.all;
use work.bv_arithmetic.all;


entity counter_tb is
end counter_tb;



architecture counter_behav of counter_tb is

  for ALL : counter
    use entity work.counter(behav);

  component counter
    port (
      d  : in  bit_vector (3 downto 0);
      q : out std_logic_vector (3 downto 0);
      clear: in bit;
      load: in bit; 
      clock: in bit
    );
  end component;

  signal d: bit_vector(3 downto 0);
  signal q: std_logic_vector(3 downto 0);
  signal clear, load, clk: bit;
  
begin  -- behav
  -- Component instantiation

  counter0 : counter port map (clock=>clk, load=>load, clear=>clear, d=>d, q=>q);

  process
    type pattern_type is record
              -- inputs
              clock:      natural;
              load:       natural;
              clear:      natural;
              d:          natural;
              
              -- outputs
              q:          natural;
    end record;

    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
      (
--       CLK, LD, CLR, D,  Expected Q
        (  1,  0,   1, 12,   0),
        (  0,  1,   0, 10,   0),
        (  1,  1,   0, 10,  10),
        (  0,  0,   0,  0,  10),
        (  1,  0,   0,  0,  11),
        (  0,  0,   0,  0,  11),
        (  1,  0,   0,  0,  12),
        (  0,  0,   0,  0,  12),
        (  1,  0,   0,  0,  13),
        (  0,  0,   0,  0,  13),
        (  1,  0,   0,  0,  14),
        (  0,  0,   0,  0,  14),
        (  1,  0,   0,  0,  15),
        (  0,  0,   0,  0,  15),
        (  1,  0,   0,  0,   0),
        (  0,  0,   0,  0,   0),
        (  1,  0,   0,  0,   1),
        (  0,  0,   0,  0,   1),
        (  1,  0,   0,  0,   2),
        (  0,  0,   0,  0,   2),
        (  1,  0,   0,  0,   3),
        (  0,  0,   0,  0,   3),
        (  1,  0,   0,  0,   4),
        (  0,  0,   0,  0,   4),
        (  1,  0,   0,  0,   5),
        (  0,  0,   0,  0,   5),
        (  1,  0,   0,  0,   6),
        (  0,  0,   0,  0,   6),
        (  1,  0,   0,  0,   7),
        (  0,  0,   0,  0,   7),
        (  1,  0,   0,  0,   8),
        (  0,  0,   0,  0,   8),
        (  1,  0,   0,  0,   9),
        (  0,  0,   1,  0,   9),
        (  1,  0,   1,  0,   0),
        (  0,  0,   1,  0,   0),
        (  1,  0,   1,  0,   0),
        (  0,  0,   1,  0,   0),
        (  1,  0,   1,  0,   0),
        (  0,  0,   0,  0,   0),
        (  1,  0,   0,  0,   1)
      );


    variable l : line;
    
  begin
    -- Initialise.
    d <= "0000";
    load <= '0';
    clear <= '0';
    clk <= '0';
    wait for 200 ns;
    
    write (l, string'("    time  ###  clk  load  clear    d  q_exp  q_act"));
    writeline (output, l);

    for i in patterns'range loop
      clk <= natural_to_bv(patterns(i).clock, 1)(0);
      load <= natural_to_bv(patterns(i).load, 1)(0);
      clear <= natural_to_bv(patterns(i).clear, 1)(0);
      d <= natural_to_bv(patterns(i).d, 4);
      wait for 200 ns;

      write (l, NOW, right, 8);
      write (l, i, right, 5 );
      write (l, clk, right, 5);
      write (l, load, right, 6);
      write (l, clear, right, 7);
      write (l, d, right, 5);
      write (l, integer_to_bv(patterns(i).q, 4), right, 7);
      write (l, to_bitvector (q), right, 7);
      writeline (output, l);

      assert q = natural_to_slv (patterns(i).q, q'length)
        report "expected and actual Q differ" severity error;

    end loop;

    wait;
    
  end process;
end counter_behav;


-- End of file.
