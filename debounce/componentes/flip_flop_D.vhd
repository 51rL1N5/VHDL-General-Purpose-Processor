-- Flip_flop D
-- por borda de subida
-- 
--				 ------------
--	 		D->|				 |-> Q
--		 		|				 |
--		 		|				 |
-- 	 		|				 |-> Q'
--	    clk->|>		       |
--				 ------------
--
-- Autoria : Luis G P Condados
-- Testado e Aprovado

library IEEE;
use IEEE.std_logic_1164.all;

entity flip_flop_D is port
(
	D,clk : in std_logic;
	Q,Qbar : out std_logic
);
end flip_flop_D;


architecture hardware of flip_flop_D is
signal dado : std_logic;
begin
	
	dado <= D when (clk = '1' and clk'Event) else dado;
	Q <= dado;
	Qbar <= not dado;
end hardware;