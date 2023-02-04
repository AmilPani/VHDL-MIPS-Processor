library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ShiftLeft2_26to28 is
    Port (Address : in  STD_LOGIC_VECTOR (25 downto 0);
          Shifted : out STD_LOGIC_VECTOR (27 downto 0));
end ShiftLeft2_26to28; 

architecture Behavioral of ShiftLeft2_26to28 is

signal temp : std_logic_vector(27 downto 0) := (others => '0');

begin
    Shifted <= temp + (std_logic_vector(shift_left(unsigned(Address), 2)));
end Behavioral;