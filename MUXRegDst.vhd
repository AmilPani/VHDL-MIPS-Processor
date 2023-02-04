library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUXRegDst is
    Port (rt, rd        : in  STD_LOGIC_VECTOR (4 downto 0);
          RegDst        : in  STD_LOGIC_VECTOR (1 downto 0);
          WriteRegister : out STD_LOGIC_VECTOR (4 downto 0));
end MUXRegDst; 

architecture Behavioral of MUXRegDst is
    
begin
    -- choose rd when R-type, choose rt when I-type
    with RegDst select
        WriteRegister <= rd      when "01", -- R-type
                         "11111" when "10", -- jal
                         rt      when others; -- I-Type
end Behavioral;