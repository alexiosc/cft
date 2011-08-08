library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

package utils is

  subtype word is std_logic_vector (17 downto 0);  -- A processor word
  subtype halfword is std_logic_vector (8 downto 0);  -- A processor half-word

  -- Convert bit_vector to IEEE std_logic_vector format
  -- (attributes LENGTH and RANGE are described below)
  function bv2slv (b:bit_vector) return std_logic_vector;
  
  -- Convert std_logic_vector to bit_vector format
  -- (attributes LENGTH and RANGE are described below)

  function slv2bv (b:std_logic_vector) return bit_vector;

  -- Convert bit_vector to unsigned (natural) value 
  function b2n (B: bit_vector) return Natural;

  ----------------------------------------------------------------
  -- natural_to_slv
  --
  -- Convert natural to bit vector encoded unsigned integer.
  -- (length is used as the size of the result.)
  ----------------------------------------------------------------

  function natural_to_slv(nat : in natural;
      	      	      	 length : in natural) return std_logic_vector;

  function unsigned_to_slv(uns : in unsigned;
      	      	      	 length : in natural) return std_logic_vector;

  function slv_to_unsigned(slv : in std_logic_vector;
      	      	      	 length : in natural) return unsigned;
  
end utils; 
