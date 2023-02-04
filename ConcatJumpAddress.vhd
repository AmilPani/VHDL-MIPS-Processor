library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ConcatJumpAddress is
    Port (ShiftedIn   : in  STD_LOGIC_VECTOR (27 downto 0);
          PCAdded     : in  STD_LOGIC_VECTOR (3 downto 0);
          JumpAddress : out STD_LOGIC_VECTOR (31 downto 0));
end ConcatJumpAddress; 

architecture Behavioral of ConcatJumpAddress is
    
begin
    JumpAddress <= PCAdded & ShiftedIn; -- concat
end Behavioral;