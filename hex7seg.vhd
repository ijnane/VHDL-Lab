--******************************************************************
-- Name: <Ismail Jnane>
-- Course Number: CET3136
-- Description:
-- Implements a circui that can display different lets on a 7 segment
-- display. 


library ieee;
use ieee.std_logic_1164.all;

entity hex7seg is
	port( 
		sw: in std_logic_vector(1 downto 0);
		HEX0: out std_logic_vector(6 downto 0)
		 );
end hex7seg;

architecture hex7seg of hex7seg is
component hex7segb
	port ( c0 : in std_logic;
		    c1 : in std_logic;
		  hex0 : out std_logic_vector( 6 downto 0)
		 );
end component;

begin 
	H1: hex7segb port map
	 (c0 => sw(0), c1 => sw(1), hex0 => hex0);
end hex7seg;



library ieee;
use ieee.std_logic_1164.all;

entity hex7segb is
	port ( c0 : in std_logic;
		    c1 : in std_logic;
		    hex0 : out std_logic_vector( 6 downto 0)
		  );
		 
end hex7segb;

architecture hex7segb of hex7segb is 
begin 
	process(c0, c1)
	begin
		if (c1 ='0' and c0 = '0') then 
			hex0 <= "0100001";
		elsif (c1 ='0' and c0 = '1') then
			hex0 <= "0000110";
		elsif (c1 ='1' and c0 = '0') then 
			hex0 <= "1111001";
		else 
			hex0 <= "1111111";
		end if;
	end process;
end hex7segb;

		  
		  
		  