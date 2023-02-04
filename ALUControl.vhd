library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALUControl is
    Port (Func      : in  STD_LOGIC_VECTOR (5 downto 0);
          AluOp     : in  STD_LOGIC_VECTOR (2 downto 0);
          ALUCntl   : out STD_LOGIC_VECTOR (3 downto 0));
end ALUControl; 

architecture Behavioral of ALUControl is
signal CntlTemp : std_logic_vector (3 downto 0);
begin
    -- converts the 6-bit Funct data into 4-bit ALUCntl data
    with Func select
        CntlTemp <= "0010" when "100000", -- add
                    "0010" when "100001", -- addu
                    "0110" when "100010", -- sub
                    "0110" when "100011", -- subu
                    "0000" when "100100", -- and
                    "0001" when "100101", -- or
                    "0011" when "100110", -- xor
                    "1100" when "100111", -- nor
                    "0111" when "101010", -- slt
                    "0111" when "101011", -- sltu
                    "1110" when "001000", -- jr
                    "1111" when others;
     with AluOp select
        ALUCntl <= "0010" when "001", -- addi, addiu, lw, sw
                   "0000" when "010", -- andi
                   "0001" when "011", -- ori
                   "0110" when "100", -- beq
                   "0000" when "101", -- bne
                   "0111" when "110", -- slti
                   "0111" when "111", -- sltiu
                   CntlTemp when others;
end Behavioral;

