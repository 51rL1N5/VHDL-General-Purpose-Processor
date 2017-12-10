-- Divisor de frequencia
-- autoria : Luis G P Condados

library ieee;
use ieee.std_logic_1164.all;

entity divisor_freq is port
(
	clk_in : in std_logic;
	clk_out : out std_logic
);
end divisor_freq;

architecture hardware of divisor_freq is
signal contagem : integer := 1;
signal estado : std_logic;

begin
	process(clk_in,contagem)
	begin
		if(clk_in'event and clk_in = '1') then
			if(contagem = 25000000) then
				estado <= not estado;
				contagem <= 1;
			else
				contagem <= contagem + 1;
			end if;
		end if;
	end process;
	clk_out <= estado;
end hardware;