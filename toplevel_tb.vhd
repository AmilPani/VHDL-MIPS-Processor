library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity toplevel_tb is 
end toplevel_tb;

architecture Behavioral of toplevel_tb is
    component TopLevel_comp is
        port( clock   : in  std_logic;						-- middle button (button-driven clock)
	          clock1  : in  std_logic;						-- BASYS-3 onboard clock
	          reset   : in  std_logic;						-- left button
	          MSB     : in  std_logic;						-- upper button
	          overflow: out std_logic;						-- LED 7
	          zero    : out std_logic;						-- LED 5
	          carryout: out std_logic;						-- LED 6
	          pcout   : out std_logic_vector (4 downto 0);	-- LEDs 4-0 (Program Counter)
	          enout   : out std_logic_vector (3 downto 0);	-- 7SD anodes
	          dout    : out std_logic_vector (7 downto 0);	-- 7SD cathodes
	          din     : in std_logic_vector(7 downto 0)         -- Slider switches
	   );
    end component;
    
signal clock   : std_logic := '0';						-- middle button (button-driven clock)
signal clock1  : std_logic;						-- BASYS-3 onboard clock
signal reset   : std_logic;						-- left button
signal MSB     : std_logic;						-- upper button
signal overflow: std_logic;						-- LED 7
signal zero    : std_logic;						-- LED 5
signal carryout: std_logic;						-- LED 6
signal pcout   : std_logic_vector (4 downto 0);	-- LEDs 4-0 (Program Counter)
signal enout   : std_logic_vector (3 downto 0);	-- 7SD anodes
signal dout    : std_logic_vector (7 downto 0);	-- 7SD cathodes
signal din     : std_logic_vector(7 downto 0);         -- Slider switches

begin
    dut: TopLevel_comp port map (
        clock => clock,
        clock1 => clock1,
        reset => reset,
        MSB => MSB,
        overflow => overflow,
        zero => zero,
        carryout => carryout,
        pcout => pcout,
        enout => enout,
        dout => dout,
        din => din
    );


TopLevel_comp_simulation : process
begin
    din <= "10101010";
    -- clock has a period of 20 ns
	   -- tests the reset for one clock cycle
	   clock <= '1';
       reset <= '1';
       wait for 10 ns;
       clock <= '0';
       wait for 10 ns;
       reset <= '0';
	   
	   -- for the next 30 clock cycles
       for i in 0 to 29 loop
          clock <= '1';
		  wait for 10 ns;
		  clock <= '0';
		  wait for 10 ns;
	   end loop;
end process TopLevel_comp_simulation;
end Behavioral;