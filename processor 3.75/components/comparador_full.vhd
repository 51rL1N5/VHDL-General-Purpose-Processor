-- Descricao de um comparador completo de magnitude 
--
--  				 A com B
--   		 		 _______
-- 	in_gt -> |       |-> out_gt  maior
-- 	in_eq -> | > = < |-> in_eq   igual
-- 	in_it ->	|_______|-> in_it   menor
--
-- Autoria : Luis G P Condados
-- Testado e Aprovado


library ieee;
use ieee.std_logic_1164.all;

entity comparador_full is port
(
	a,b   : in std_logic;
	in_gt : in std_logic;
	in_eq : in std_logic;
	in_it : in std_logic;
	
	out_gt : out std_logic;
	out_eq : out std_logic;
	out_it : out std_logic
);
end comparador_full;

architecture hardware of comparador_full is 
begin
	out_gt <= in_gt or ( (in_eq and a) and not(b));
	out_it <= in_it or ( (in_eq and not(a)) and b);
	out_eq <= in_eq and (a xnor b);
end hardware;
