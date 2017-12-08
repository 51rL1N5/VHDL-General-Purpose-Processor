library ieee;
use ieee.std_logic_1164.all;

entity adder4bits is
	port
	(
		A     : in std_logic_vector (3 downto 0);
		B     : in std_logic_vector (3 downto 0);
		cin   : in std_logic;
		S     : out std_logic_vector (3 downto 0);
		carry : out std_logic
	);
end adder4bits;


architecture hardware of adder4bits is
	component FullAdder is
		port 
		(
			A     : in std_logic;
			B     : in std_logic;
			cin   : in std_logic;
			S     : out std_logic;
			carry : out std_logic
		);
	end component;
	
	signal aux: std_logic_vector(2 downto 0);
	
begin

	FA0: FullAdder port map ( A => A(0), B => B(0), cin => cin, S => S(0), carry => aux(0));
	FA1: FullAdder port map ( A => A(1), B => B(1), cin => aux(0), S => S(1), carry => aux(1));
	FA2: FullAdder port map ( A => A(2), B => B(2), cin => aux(1), S => S(2), carry => aux(2));
	FA3: FullAdder port map ( A => A(3), B => B(3), cin => aux(2), S => S(3), carry => carry);

end hardware;