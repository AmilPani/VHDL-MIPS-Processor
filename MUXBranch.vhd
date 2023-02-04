library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUXBranch is
    Port (PCAddedIn, AddResult : in  STD_LOGIC_VECTOR (31 downto 0);
          BranchANDZero        : in  STD_LOGIC;
          PC                   : out STD_LOGIC_VECTOR (31 downto 0));
end MUXBranch; 

architecture Behavioral of MUXBranch is
    
begin
    -- choose AddResult when branch, choose PCAddedIn when other
    with BranchANDZero select
        PC <= AddResult when '1', -- when branch
              PCAddedIn when others; -- when other
end Behavioral;