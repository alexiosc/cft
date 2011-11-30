library STD;
use STD.STANDARD.all, STD.TEXTIO.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.bv_arithmetic.all;
use work.utils.all;

ENTITY counter IS
  GENERIC (
    width : natural := 4;
    delay : time    := 5 ns
  );

  PORT(   
    d       : IN    bit_vector (width - 1 downto 0);
    clock   : IN    bit;
    clear   : IN    bit;
    load    : IN    bit;
    q       : OUT   std_logic_vector (width - 1 downto 0)
    );
END counter;

ARCHITECTURE behav OF counter IS
BEGIN
    -- An up/down counter
    PROCESS (clock)
         VARIABLE count : bit_vector(width - 1 downto 0);
    BEGIN
      IF (clock'EVENT AND clock = '1') THEN
        IF (load = '1') THEN         --Generate loadable 
          count := d;
        ELSE                     --lines out to increase performance.

          count := integer_to_bv(bv_to_integer(count) + 1, width);
        END IF;
        --The following lines will produce a synchronous 
        --clear on the counter
        IF (clear = '1') THEN     
          count := integer_to_bv(0, width);
        END IF;
      END IF;
    q <= To_StdLogicVector(count) after delay;
    END PROCESS;
END behav;


