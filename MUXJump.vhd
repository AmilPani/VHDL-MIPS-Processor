library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUXJump is
    Port (JumpAddress, JrAddress, OtherAddress : in  STD_LOGIC_VECTOR (31 downto 0);
          ALUControlIn                         : in  STD_LOGIC_VECTOR (3 downto 0);
          Jump                                 : in  STD_LOGIC_VECTOR (1 downto 0);
          PC                                   : out STD_LOGIC_VECTOR (31 downto 0));
end MUXJump; 

architecture Behavioral of MUXJump is

signal temp : STD_LOGIC_VECTOR (31 downto 0);
begin
    
    
    with Jump select
        temp <= JumpAddress   when "10", -- when j or jal
                OtherAddress  when "01", -- when R-type
                OtherAddress  when others;
    with ALUControlIn select
        PC <= JrAddress    when "1110",
              temp when others;
end Behavioral;