library ieee;
use ieee.std_logic_1164.all;

entity bin_to_disp is
	Port( 
			a: in std_logic_vector(3 downto 0);
			disp: out std_logic_vector(6 downto 0)
		 );
end bin_to_disp;

architecture bin_to_disp of bin_to_disp is
signal aux: std_logic_vector(6 downto 0);
begin

	process(a)
	begin
		case a is
			when "0000" => aux <= "1000000"; -- 0
			when "0001" => aux <= "1111001"; -- 1
			when "0010" => aux <= "0100100"; -- 2
			when "0011" => aux <= "0110000"; -- 3
			when "0100" => aux <= "0011001"; -- 4
			when "0101" => aux <= "0010010"; -- 5
			when "0110" => aux <= "0000011"; -- 6
			when "0111" => aux <= "1111000"; -- 7
			when "1000" => aux <= "0000000"; -- 8
			when "1001" => aux <= "0011000"; -- 9
			when others => aux <= "1111111"; 
		end case;
	end process;
	disp <= aux;
end bin_to_disp;