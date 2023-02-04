library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    Port (clock     : in  STD_LOGIC;
          reset     : in  STD_LOGIC;
          Din       : in  STD_LOGIC_VECTOR (31 downto 0);
          Dout      : out STD_LOGIC_VECTOR (31 downto 0));
end PC; 

architecture Behavioral of PC is
begin
    process(clock)
	begin
	    -- resets PC
		if (clock'event and clock='1') then
		  if (reset = '1') then
		      Dout <= x"00000000";
		  else
		      Dout <= Din;
		  end if;
		end if;
    end process;
end Behavioral;

