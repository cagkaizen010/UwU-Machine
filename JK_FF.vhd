library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity JK_FF is
port( j,k: in  std_logic;
       r: in std_logic;
       clk: in std_logic;
       Q: out std_logic
	 );
end JK_FF;

architecture seq of JK_FF is

signal intermediate: std_logic;

begin
process ( r, clk ) 
begin
	if (r = '0') then   
      intermediate <= '0';
	elsif rising_edge(clk) then                 
			if (j='0' and k='0') then
            intermediate <= intermediate;         
         elsif (j='1' and k='0') then
            intermediate <= '1';
			elsif (j='0' and k='1') then
            intermediate <= '0';
         elsif (j='1' and k='1') then
            intermediate <= not intermediate;
         end if;      
   end if;
		
end process;
   Q <= intermediate;
end seq;