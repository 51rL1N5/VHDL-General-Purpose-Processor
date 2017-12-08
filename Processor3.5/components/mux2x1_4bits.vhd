library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_4bits is
	port 
	(
		A      : in std_logic_vector(3 downto 0);
		B      : in std_logic_vector(3 downto 0);
		sw     : in std_logic;
		output : out std_logic_vector(3 downto 0)
	);
end mux2x1_4bits;

architecture hardware of mux2x1_4bits is

begin
	process(sw)
	begin
		case sw is
			when '0' =>
				output <= A;
			when '1' =>
				output <= B;
		end case;
	end process;

end hardware;