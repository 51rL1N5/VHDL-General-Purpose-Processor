library ieee;
use ieee.std_logic_1164.all;

entity opcode_decoder is
	port
	(
		opcode : in std_logic_vector(3 downto 0);
		
		disp0  : out std_logic_vector(6 downto 0);
		disp1  : out std_logic_vector(6 downto 0);
		disp2  : out std_logic_vector(6 downto 0);
		disp3  : out std_logic_vector(6 downto 0)
	);
end opcode_decoder;


architecture hardware of opcode_decoder is

component bin_to_disp is
	Port
	( 
		a: in std_logic_vector(3 downto 0);
		disp: out std_logic_vector(6 downto 0)
	);
end component;


begin

	converter0: bin_to_disp port map (a => "000" & opcode(0), disp => disp0);
	converter1: bin_to_disp port map (a => "000" & opcode(1), disp => disp1);
	converter2: bin_to_disp port map (a => "000" & opcode(2), disp => disp2);
	converter3: bin_to_disp port map (a => "000" & opcode(3), disp => disp3);


end hardware;