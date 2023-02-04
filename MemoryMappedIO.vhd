library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MemoryMappedIO is
    Port (oldD      : in  STD_LOGIC_VECTOR (31 downto 0) := x"00000000"; -- previous Dout
          Din       : in  STD_LOGIC_VECTOR (7 downto 0); -- 8 bit switch input
          clock     : in  STD_LOGIC;
          MemWrite  : in  STD_LOGIC; -- for sw
          ALUout    : in  STD_LOGIC_VECTOR (31 downto 0); -- address for lw and sw
          Data2     : in  STD_LOGIC_VECTOR (31 downto 0); -- sw data to store to address
          Read_data : in  STD_LOGIC_VECTOR (31 downto 0); -- lw data to load to register
          Dout      : out STD_LOGIC_VECTOR (31 downto 0); -- for 7seg display
          MMout     : out STD_LOGIC_VECTOR (31 downto 0)); -- for lw
end MemoryMappedIO; 

architecture Behavioral of MemoryMappedIO is
signal MMReg : std_logic_vector (31 downto 0) := x"00000000";
signal temp : std_logic_vector (32 downto 0);
begin
    MMReg <= Data2;
    temp <= MemWrite & ALUout; 
    with ALUout select
        MMout <= x"00000000" + Din when x"00000030",
                 Read_data         when others;
    
    storeDout:	process(temp,clock)	
        begin
        if(clock'event and clock='1')then
			if(temp = "100000000000000000000000000110100") then
			   Dout <= MMReg;
			else
			   Dout <= oldD;
			end if;
		end if;
    end process;


    
end Behavioral;