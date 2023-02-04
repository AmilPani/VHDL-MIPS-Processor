library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Control is
    Port (Opcode    : in  STD_LOGIC_VECTOR (5 downto 0);
          RegDst    : out STD_LOGIC_VECTOR (1 downto 0);
          Jump      : out STD_LOGIC_VECTOR (1 downto 0);
          Branch    : out STD_LOGIC;
          MemRead   : out STD_LOGIC;
          MemtoReg  : out STD_LOGIC_VECTOR (1 downto 0);
          ALUOp     : out STD_LOGIC_VECTOR (2 downto 0);
          MemWrite  : out STD_LOGIC;
          ALUSrc    : out STD_LOGIC;
          RegWrite  : out STD_LOGIC);
          
end Control; 

architecture Behavioral of Control is
    
begin
    with Opcode select
        RegDst <= "01" when "000000", -- R-type
                  "10" when "000011", -- jal
                  "00" when others;
    with Opcode select
        Jump <= "10" when "000010", -- j
                "10" when "000011", -- jal
                "01" when "000000", -- jr
                "00" when others;
    with Opcode select
        Branch <= '1' when "000100", -- beq
                  '1' when "000101", -- bne
                  '0' when others;
    with Opcode select
        MemRead <= '1' when "100011", -- lw
                   '0' when others;
    with Opcode select
        MemWrite <= '1' when "101011", -- sw 
                    '0' when others;                            
    with Opcode select
        MemtoReg <= "01" when "100011", -- lw
                    "10" when "000011", -- jal
                    "00" when others;  
    with Opcode select
        ALUSrc <= '0' when "000000", -- R-type
                  '0' when "000100", -- beq
                  '0' when "000101", -- bne
                  '1' when others;
    with Opcode select
        RegWrite <= '0' when "101011", -- sw
                    '0' when "000100", -- beq
                    '0' when "000101", -- bne
                    '1' when others;
    with Opcode select
        AluOP <= "000" when "000000", -- R-type
                 "001" when "001000", -- addi
                 "001" when "001001", -- addiu
                 "001" when "100011", -- lw
                 "001" when "101011", -- sw
                 "010" when "001100", -- andi
                 "011" when "001101", -- ori
                 "100" when "000100", -- beq
                 "101" when "000101", -- bne
                 "110" when "001010", -- slti
                 "111" when "001011", -- sltiu
                 "000" when others;
end Behavioral;