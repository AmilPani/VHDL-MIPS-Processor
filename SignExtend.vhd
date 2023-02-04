library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SignExtend is
    Port (ImmIn  : in  STD_LOGIC_VECTOR (15 downto 0);
          ImmOut : out STD_LOGIC_VECTOR (31 downto 0));
end SignExtend; 

architecture Behavioral of SignExtend is
    
begin
    ImmOut <= x"00000000" + ImmIn; 
end Behavioral;