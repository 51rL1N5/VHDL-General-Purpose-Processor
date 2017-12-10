library ieee;
use ieee.std_logic_1164.all;

entity mux8x1_4bits is
	port
	(
		A0     : in std_logic_vector (3 downto 0);
		A1     : in std_logic_vector (3 downto 0); 
		A2     : in std_logic_vector (3 downto 0);
		A3     : in std_logic_vector (3 downto 0);
		A4     : in std_logic_vector (3 downto 0);
		A5     : in std_logic_vector (3 downto 0);
		A6     : in std_logic_vector (3 downto 0);
		A7     : in std_logic_vector (3 downto 0);
		
		SW     : in std_logic_vector (2 downto 0);
		
		output : out std_logic_vector (3 downto 0)
	
	);
end mux8x1_4bits;
	
architecture config of mux8x1_4bits is



begin
	process(SW)
	begin
		case SW is
			when "000" =>
				output <= A0;
			when "001" =>
				output <= A1;
			when "010" =>
				output <= A2;
			when "011" =>
				output <= A3;
			when "100" =>
				output <= A4;
			when "101" =>
				output <= A5;
			when "110" =>
				output <= A6;
			when "111" =>
				output <= A7;
		end case;
	end process;

end config;