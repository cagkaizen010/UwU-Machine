library ieee;
use ieee.std_logic_1164.all;

entity uwuMachine is
port(
	w, x, r, clk : in std_logic;
	y, z : out std_logic;
	HEX4, HEX3, HEX2, HEX1 : out std_logic_vector(6 downto 0)
	);

end uwuMachine;

architecture seq of uwuMachine is 

component JK_FF
	port( J,K: in  std_logic;
         r: in std_logic;
         clk: in std_logic;
         Q: out std_logic
			);
end component;


signal q0, q1 : std_logic;

signal p0, p1, p2, p3: std_logic_vector(6 downto 0);

begin

	jk0 : JK_FF
		port map(x, not x, r, clk, q0);
	jk1 : JK_FF
		port map(w, not w, r, clk, q1);
	
	y <= q1;
	z <= q0;
	
	-- Utilizing behavioral VHDL
	process (clk)
	begin 
				if (q1 = '0' and q0 = '0') then -- -w-
			
					p0 <= not "1000000";--
					p1 <= not "0011100";--
					p2 <= not "0011100";--
					p3 <= not "1000000";--
			
				elsif (q1 = '0' and q0 = '1') then -- UwU
					p0 <= not "0111110";--
					p1 <= not "0011100";--
					p2 <= not "0011100";--
					p3 <= not "0111110";--
			
				elsif (q1 = '1' and q0 = '0') then -- TwT
					p0 <= not "0000011";--
					p1 <= not "0011100";--
					p2 <= not "0011100";--
					p3 <= not "0000011";--
			
				elsif (q1 = '1' and q0 = '1') then -- OwO
					p0 <= not "0111111";--
               p1 <= not "0011100";--
				   p2 <= not "0011100";--
               p3 <= not "0111111";--
				end if;
		

	end process;
	
		HEX4 <= p3;
		HEX3 <= p2;
		HEX2 <= p1;
		HEX1 <= p0;
				

end seq;