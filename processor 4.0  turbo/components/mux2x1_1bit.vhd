library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_1bit is
	port
	(
		A      : in std_logic;
		B      : in std_logic;
		SW     : in std_logic;
		output : out std_logic
	);
end mux2x1_1bit;

architecture hardware of mux2x1_1bit is

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