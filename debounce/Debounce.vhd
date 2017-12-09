library IEEE;
use IEEE.std_logic_1164.all;

entity Debounce is port
(
   button : in std_logic;
	clk    : in std_logic;
	output : out std_logic
);
end Debounce;


architecture hardware of Debounce is

	component flip_flop_D port
	(
		D,clk : in std_logic;
		Q,Qbar : out std_logic
	);
	end component;
	
	component divisor_freq port
	(
			clk_in : in std_logic;
			clk_out : out std_logic
	);
	end component;

signal cout   : std_logic;
signal FF0_out: std_logic;
signal FF1_out: std_logic;


	
begin

	FF0: flip_flop_D port map(D => button, clk => clk, );
	FF1: flip_flop_D port map();
	FF2: flip_flop_D port map( Q => output);
	
	div: divisor_freq port map();

end hardware;