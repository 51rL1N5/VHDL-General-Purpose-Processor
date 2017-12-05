library ieee;
use ieee.std_logic_1164.all;

entity FFJK is
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
end FFJK;


architecture hardware of FFJK is

signal aux : std_logic;

begin

	process(clk,set,clear,ld)
	begin
		if clear = '1' then
			aux <= '0';
		else
			if set = '1' then
				aux <= '1';
			else
				if rising_edge(clk) then
					if ld = '1' then
						if j = '1' and k = '1' then
							aux <= not aux;
						elsif j = '1' and k = '0' then
							aux <= '1';
						elsif j = '0' and k = '1' then
							aux <= '0';
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	Q <= aux;
	Qbar <= not aux;

end hardware;