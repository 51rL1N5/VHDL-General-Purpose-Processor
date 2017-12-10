library ieee;
use ieee.std_logic_1164.all;

entity reg4bit_shiftable is
	port
	(
		input  : in std_logic_vector (3 downto 0);
		clk    : in std_logic;
		clear  : in std_logic;
		set    : in std_logic;
		ld     : in std_logic;
		shft_r : in std_logic;
		shft_l : in std_logic;
		output : out std_logic_vector (3 downto 0)
	);
end reg4bit_shiftable;

architecture hardware of reg4bit_shiftable is

	component mux2x1_1bit is
		port
		(
			A      : in std_logic;
			B      : in std_logic;
			sw     : in std_logic;
			output : out std_logic
		);
	end component;

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

signal aux0_FF0  : std_logic;
signal aux1_FF0  : std_logic;

signal aux0_FF1  : std_logic;
signal aux1_FF1  : std_logic;

signal aux0_FF2  : std_logic;
signal aux1_FF2  : std_logic;

signal aux0_FF3  : std_logic;
signal aux1_FF3  : std_logic;

signal outputFF0 : std_logic;
signal outputFF1 : std_logic;
signal outputFF2 : std_logic;
signal outputFF3 : std_logic;

signal void : std_logic_vector (7 downto 0);

begin
	
	
	muxLFF0: mux2x1_1bit port map (A => input(0),B =>'0' , SW => shft_l, output => aux0_FF0 );
	muxRFF0: mux2x1_1bit port map (A => aux0_FF0, B => outputFF1, SW => shft_r, output => aux1_FF0 );
	
	
	FF0: FFJK port map ( j => aux1_FF0, k => not aux1_FF0, clk => clk, clear => clear, set => set, ld => ld, Q=> outputFF0, Qbar => void(0));
	
	muxLFF1: mux2x1_1bit port map (A => input(1), B => outputFF0, SW => shft_l, output => aux0_FF1);
	muxRFF1: mux2x1_1bit port map (A => aux0_FF1, B => outputFF2, SW => shft_r, output => aux1_FF1);
	
	FF1: FFJK port map ( j => aux1_FF1, k => not aux1_FF1, clk => clk, clear => clear, set => set, ld => ld, Q=> outputFF1, Qbar => void(1));
	
	muxLFF2: mux2x1_1bit port map (A => input(2), B => outputFF1, SW => shft_l, output => aux0_FF2);
	muxRFF2: mux2x1_1bit port map (A => aux0_FF2, B => outputFF3, SW => shft_r, output => aux1_FF2);
	
	FF2: FFJK port map ( j => aux1_FF2, k => not aux1_FF2, clk => clk, clear => clear, set => set, ld => ld, Q=> outputFF2, Qbar => void(2));
	
	muxLFF3: mux2x1_1bit port map (A => input(3), B => outputFF2, SW => shft_l, output => aux0_FF3);
	muxRFF3: mux2x1_1bit port map (A => aux0_FF3, B => '0', SW => shft_r, output => aux1_FF3);
	
	FF3: FFJK port map ( j => aux1_FF3, k => not aux1_FF3, clk => clk, clear => clear, set => set, ld => ld, Q=> outputFF3, Qbar => void(3));
	
	output(0) <= outputFF0;
	output(1) <= outputFF1;
	output(2) <= outputFF2;
	output(3) <= outputFF3;
	

end hardware;