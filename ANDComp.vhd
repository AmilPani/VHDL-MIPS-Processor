library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ANDComp is
    Port (BranchIn, Zero : in  STD_LOGIC;
          BranchOut      : out STD_LOGIC);
end ANDComp; 

architecture Behavioral of ANDComp is
    
begin
    BranchOut <= BranchIn and Zero; -- and
end Behavioral;