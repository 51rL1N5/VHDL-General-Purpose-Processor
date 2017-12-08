library ieee;
use ieee.std_logic_1164.all;

entity decoder2x4 is
	port
	(
		enable : in std_logic;
		input  : in std_logic_vector (1 downto 0);
		output : out std_logic_vector(3 downto 0)
	);
end decoder2x4;

architecture hardware of decoder2x4 is

begin
	output(0) <= (not input(0)) and (not input(1)) and enable;
	output(1) <= (input(0)) and (not input(1)) and enable;
	output(2) <= (not input(0)) and (input(1)) and enable;
	output(3) <= (input(0)) and (input(1)) and enable;
end hardware;