library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ShiftLeft2 is
    Port (SignExtended : in  STD_LOGIC_VECTOR (31 downto 0);
          Shifted      : out STD_LOGIC_VECTOR (31 downto 0));
end ShiftLeft2; 

architecture Behavioral of ShiftLeft2 is
    
begin
    Shifted <= std_logic_vector(shift_left(unsigned(SignExtended), 2));
end Behavioral;