library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder is
    Port (PCAddedIn, ShiftedIn : in  STD_LOGIC_VECTOR (31 downto 0);
          AddResult            : out STD_LOGIC_VECTOR (31 downto 0));
end Adder; 

architecture Behavioral of Adder is
signal signedValue : signed (16 downto 0);
begin
    signedValue <= signed(ShiftedIn (16 downto 0));
    AddResult <= std_logic_vector(signed(PCAddedIn) + signedValue); -- add
end Behavioral;

