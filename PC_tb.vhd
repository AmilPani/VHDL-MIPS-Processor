library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity PC_tb is
end PC_tb; 

architecture Behavioral of PC_tb is
    component PC is
        Port (clock     : in  STD_LOGIC;
              reset     : in  STD_LOGIC;
              Din       : in  STD_LOGIC_VECTOR (31 downto 0);
              Dout      : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
signal clock   : std_logic := '0';
signal reset   : std_logic;
signal Din        : STD_LOGIC_VECTOR (31 downto 0);
signal Dout       : STD_LOGIC_VECTOR (31 downto 0);
begin
	dut: PC port map (
	   clock => clock,
       reset => reset,
       Din => Din,
       Dout => Dout );
    PC_simulation : process
	begin
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
	end process PC_simulation;
end Behavioral;

