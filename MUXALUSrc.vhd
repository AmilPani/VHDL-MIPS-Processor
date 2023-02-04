library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUXALUSrc is
    Port (ReadData2, SignExtend : in  STD_LOGIC_VECTOR (31 downto 0);
          ALUSrc                : in  STD_LOGIC;
          ALUinput              : out STD_LOGIC_VECTOR (31 downto 0));
end MUXALUSrc; 

architecture Behavioral of MUXALUSrc is
    
begin
    -- choose SignExtend when I-type, choose ReadData2 when R-type
    with ALUSrc select
        ALUinput <= SignExtend when '1', -- I-type
                    ReadData2  when others; -- R-Type
end Behavioral;