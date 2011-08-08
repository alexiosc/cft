-- Fungus 2 CPU

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.bv_arithmetic.all;
use work.utils.all;



entity core is

  Port (
    clock: in std_logic;                          -- Clock signal
    reset: in std_logic;                          -- Reset input
    irq: in std_logic;                            -- Interrupt

    dbus: inout std_logic_vector (15 downto 0); -- Data bus
    abus: inout std_logic_vector (15 downto 0); -- Address bus

    mr: out std_logic;                  -- Memory Write
    mw: out std_logic                   -- Memory Read
  );

end core;


architecture Behavioural of core is

  -- Data providers
  signal pc: unsigned (15 downto 0);
  signal mar: unsigned (15 downto 0);
  signal ir: unsigned (15 downto 0);

  signal state: unsigned (2 downto 0);
  signal phase: unsigned (3 downto 0);

begin
  process (clock, reset, irq)
  begin
    if reset = '0' then
      pc <= "0000000000000000";
      state <= "000";
      phase <= "0000";

    else

      -- Step PC
      if rising_edge(clock) then
        phase <= phase + 1;
      end if;

      if phase = 0 then
        if rising_edge(clock) then
          pc <= pc + 1;
        end if;
        
        if falling_edge(clock) then
          if state = 0 then
            ir <= slv_to_unsigned(dbus, 16);
          end if;
        end if;
      end if;

    end if; -- !reset
  end process;


end Behavioural;
