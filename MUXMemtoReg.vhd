library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUXMemtoReg is
    Port (ReadData, PCAdded, ALUresult : in  STD_LOGIC_VECTOR (31 downto 0);
          MemtoReg                     : in  STD_LOGIC_VECTOR (1 downto 0);
          WriteData                    : out STD_LOGIC_VECTOR (31 downto 0));
end MUXMemtoReg; 

architecture Behavioral of MUXMemtoReg is
    
begin
    -- choose ReadData when using load word, choose PCAdded when using jal, choose ALUresult when using other
    with MemtoReg select
        WriteData <= ReadData  when "01", -- when using load word instructions
                     PCAdded   when "10", -- when using jal instructions
                     ALUresult when others; -- when using other instructions
end Behavioral;