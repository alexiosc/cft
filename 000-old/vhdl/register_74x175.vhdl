library STD;
use STD.STANDARD.all, STD.TEXTIO.all;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.bv_arithmetic.all;
use work.utils.all;


ENTITY register_74x175 IS
  GENERIC (
    width : natural := 4;
    delay : time    := 30 ns            -- TTL version
  );

  PORT(   
    d       : IN    bit_vector (width - 1 downto 0);
    clock   : IN    bit;
    clear   : IN    bit;
    q       : OUT   bit_vector (width - 1 downto 0);
    notq    : OUT   bit_vector (width - 1 downto 0)
    );
END register_74x175;

ARCHITECTURE behav OF register_74x175 IS
BEGIN
    -- A register (D flip-flop)
    PROCESS (clock)
      VARIABLE data : bit_vector(width - 1 downto 0);
    BEGIN
      IF (clock'EVENT AND clock = '1') THEN
        data := d;
      END IF;
      if clear = '0' then
        data := integer_to_bv(0, width);
      end if;
      q <= data after delay;
      notq <= not data after delay;
    END PROCESS;
END behav;
