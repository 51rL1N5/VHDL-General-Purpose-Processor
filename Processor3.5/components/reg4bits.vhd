library ieee;
use ieee.std_logic_1164.all;

entity reg4bits is
	port
	(
		input  : in std_logic_vector (3 downto 0);
		clk    : in std_logic;
		clear  : in std_logic;
		set    : in std_logic;
		ld     : in std_logic;
		output : out std_logic_vector (3 downto 0)
	);
end reg4bits;



architecture hardware of reg4bits is
	component FFJK is
		port
		( 
			j    : in std_logic;
			k    : in std_logic;
			clk  : in std_logic;
			clear: in std_logic;
			set  : in std_logic;
			ld   : in std_logic;
			Q    : out std_logic;
			Qbar : out std_logic
		);
	end component;

	signal void : std_logic_vector (7 downto 0);
	
begin
	FF0: FFJK port map ( j => input(0), k => not input(0), clk => clk, clear => clear, set => set, ld => ld, Q=> output(0), Qbar => void(0));
	FF1: FFJK port map ( j => input(1), k => not input(1), clk => clk, clear => clear, set => set, ld => ld, Q=> output(1), Qbar => void(1));
	FF2: FFJK port map ( j => input(2), k => not input(2), clk => clk, clear => clear, set => set, ld => ld, Q=> output(2), Qbar => void(2));
	FF3: FFJK port map ( j => input(3), k => not input(3), clk => clk, clear => clear, set => set, ld => ld, Q=> output(3), Qbar => void(3));
end hardware;