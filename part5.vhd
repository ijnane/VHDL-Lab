--******************************************************************
-- Name: <Ismail Jnane>
-- Course Number: CET3136
-- Description:
-- Implements a circuit that can display different 3-letter words on three 7-segment
-- displays. The character selected for each display is chosen by
-- a multiplexer, and these multiplexers are connected to the characters
-- in a way that allows a word to be rotated across the displays from
-- right-to-left as the multiplexer select lines are changed through the
-- sequence 00, 01, 10, 00, etc. Using the three characters d,
-- E, 1, the displays can scroll any 3-letter word using these letters, such
-- as "dE1", as follows:
--
-- SW 9 8 Displayed characters
-- 0 0 dE1
-- 0 1 E1d
-- 1 0 1dE


library ieee;
use ieee.std_logic_1164.all;

entity part5 is 
	port (
			sw : in std_logic_vector( 9 downto 0);
			hex0: out std_logic_vector(6 downto 0);
			hex1: out std_logic_vector(6 downto 0);
			hex2: out std_logic_vector(6 downto 0)
			);		
end part5; 

architecture behavior of part5 is 
	component mux3to1 
		port ( u: in std_logic_vector(1 downto 0);
				v: in std_logic_vector(3 downto 2);
				w: in std_logic_vector(5 downto 4);
				s0: in std_logic;
				s1: in std_logic;
				m: out std_logic_vector(1 downto 0)
				);
				
end component;

component hex7segb
	port ( c0 : in std_logic;
		    c1 : in std_logic;
		  hex2 : out std_logic_vector( 6 downto 0)
		 );
end component;

component hex7segc
	port ( c0 : in std_logic;
		    c1 : in std_logic;
		  hex1 : out std_logic_vector( 6 downto 0)
		 );
end component;
component hex7segd
	port ( c0 : in std_logic;
		    c1 : in std_logic;
		  hex0 : out std_logic_vector( 6 downto 0)
		 );
end component;

signal m: std_logic_vector(1 downto 0);

begin
	H0: mux3to1 port map
	(u =>sw(1 downto 0), v=>sw(3 downto 2),w=>sw(5 downto 4), s0=>sw(9),s1=>sw(8));	
	 
	H1: hex7segb port map
	 (c0 => sw(0), c1 => sw(1), hex2 => hex2);
	
	H2: hex7segc port map
	 (c0 => sw(0), c1 => sw(1), hex1 => hex1);
	 
	H3: hex7segd port map
	 (c0 => sw(0), c1 => sw(1), hex0 => hex0);

end behavior;

library ieee;
use ieee.std_logic_1164.all;
entity mux3to1 is 
	port ( u: in std_logic_vector(1 downto 0);
			 v: in std_logic_vector(1 downto 0);
			 w: in std_logic_vector(1 downto 0);
			 s0: in std_logic;
			 s1: in std_logic;
			 m: out std_logic_vector(1 downto 0)			 
			 );
end mux3to1;

architecture behavior of mux3to1 is
begin
	process(u,v,w,s0,s1)
	begin
		if s1 =  '1' then
			m <= w;
		elsif (s1 = '0' and s0 = '0') then
			m <= u; 
		else 
			m <= v;
		end if;
	end process;
end behavior;

library ieee;
use ieee.std_logic_1164.all;

entity hex7segb is
	port ( c0 : in std_logic;
		    c1 : in std_logic;
		    hex2 : out std_logic_vector( 6 downto 0)
		  );
		 
end hex7segb;

architecture behavior of hex7segb is 
begin 
	process(c0, c1)
	begin
		if (c1 ='0' and c0 = '0') then 
			hex2 <= "0100001";
		elsif (c1 ='0' and c0 = '1') then 
			hex2 <= "0000110";
		else 
			hex2 <= "1111001";
		end if;
	end process;
end behavior;

library ieee;
use ieee.std_logic_1164.all;

entity hex7segc is
	port ( c0 : in std_logic;
		    c1 : in std_logic;
		    hex1 : out std_logic_vector( 6 downto 0)
		  );
		 
end hex7segc;

architecture behavior of hex7segc is 
begin 
	process(c0, c1)
	begin
		if (c1 ='0' and c0 = '0') then 
			hex1 <= "0000110";
		elsif (c1 ='0' and c0 = '1') then
			hex1 <= "1111001";
		else
			hex1 <= "0100001";
		end if;
	end process;
end behavior;



library ieee;
use ieee.std_logic_1164.all;

entity hex7segd is
	port ( c0 : in std_logic;
		    c1 : in std_logic;
		    hex0 : out std_logic_vector( 6 downto 0)
		  );
		 
end hex7segd;

architecture behavior of hex7segd is 
begin 
	process(c0, c1)
	begin
		if (c1 ='0' and c0 = '0') then 
			hex0 <= "1111001";
		elsif (c1 ='0' and c0 = '1') then
			hex0 <= "0100001";
		else
			hex0 <= "0000110";
		end if;
	end process;
end behavior;

