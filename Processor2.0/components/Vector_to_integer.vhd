library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity Vector_to_integer is
	Port
	(
		input : in std_logic_vector (3 downto 0);
		int   : out integer 
	);
end Vector_to_integer;
	
	
architecture behavior of Vector_to_integer is

begin
	
	int <= to_integer(unsigned(input(3 downto 0)));
	
end behavior;
	