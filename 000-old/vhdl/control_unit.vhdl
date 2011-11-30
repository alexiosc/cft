library STD;
use STD.STANDARD.all, STD.TEXTIO.all;
library ieee;
use ieee.std_logic_1164.all;
use work.bv_arithmetic.all;
use work.utils.all;


-- entity alu_outer is

--   generic (
--     halfword : natural := 9;
--     word     : natural := halfword * 2;
--     msb      : natural := word - 1);

--   subtype word is std_logic_vector (msb downto 0);  -- A processor word
  
--   port (
--     ac  : in    std_logic;              -- latch accumulator
--     bc  : in    std_logic;              -- apply operation (latch output)
--     oe  : in    std_logic;              -- output enable (output to bus)

--     op  : in    std_logic_vector (2 downto 0);  -- opcode
--     so  : in    std_logic_vector (2 downto 0);  -- sub-opcode (Y bit-field)

--     bus : inout word;  -- processor bus
--     )
    

-- end alu_outer;


entity control_unit is
  
  port (
    clk    : in  std_logic;

    pcstep : out std_logic;

    pc     : out std_logic_vector(15 downto 0);
    );

end alu;


architecture structural of control_unit is

  component uaddr_counter
    port (oe, aclr, aload, sclr, sload, ent, enp, clk, d)

end structural;
