library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is 
	Port
	(
		A     : in std_logic;
		B     : in std_logic;
		cin   : in std_logic;
		S     : out std_logic;
		carry : out std_logic
	);
end FullAdder;


architecture hardware of FullAdder is

begin

	S <= A xor B xor cin;
	carry <= (a and b) or (a and cin) or (b and cin);

end hardware;