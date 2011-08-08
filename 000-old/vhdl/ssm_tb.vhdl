library STD;
use STD.STANDARD.all, STD.TEXTIO.all;
library ieee;
use ieee.std_logic_1164.all;


entity ssm_tb is
end ssm_tb;


architecture behav of ssm_tb is

  --  Declaration of the component that will be instantiated.

component core
  port (
    clock: in std_logic;                          -- Clock signal
    reset: in std_logic;                          -- Reset input
    irq: in std_logic;                            -- Interrupt

    dbus: inout std_logic_vector (15 downto 0); -- Data bus
    abus: inout std_logic_vector (15 downto 0); -- Address bus

    mr: out std_logic;                  -- Memory Write
    mw: out std_logic                   -- Memory Read
  );
  end component;

  signal clock: std_logic;                          -- Clock signal
  signal reset: std_logic;                          -- Reset input
  signal irq: std_logic;                            -- Interrupt

  signal dbus: std_logic_vector (15 downto 0); -- Data bus
  signal abus: std_logic_vector (15 downto 0); -- Address bus

  signal mr: std_logic;                  -- Memory Write
  signal mw: std_logic;                  -- Memory Read

begin

  --  Component instantiation.
  core_0: core port map (
    clock => clock,
    reset => reset,
    irq => irq,

    dbus => dbus,
    abus => abus,

    mr => mr,
    mw => mw
    );

  --  This process does the real job.

  process
  begin

    reset <= '1';
    irq <= '1';
    wait for 500 ns;

    reset <= '0';
    wait for 500 ns;

    reset <= '1';
    wait for 500 ns;

    irq <= '0';
    wait for 500 ns;

    irq <= '1';
    wait for 500 ns;

    for clk_i in 0 to 10000 loop
      clock <= '0';
      wait for 500 ns;
      clock <= '1';
      wait for 500 ns;
    end loop; -- clk_i
    
    wait;

  end process;
end behav;
