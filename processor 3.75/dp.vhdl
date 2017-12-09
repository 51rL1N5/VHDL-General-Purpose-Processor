-- datapath for microprocessor
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

-- ***********************************************************************
-- 								    ALU 
-- ***********************************************************************

entity alu is
  port ( 
			A     : in std_LOGIC_VECTOR (3 downto 0);
			B     : in std_logic_vector (3 downto 0);
			SW    : in std_logic_vector (2 downto 0);     
         output: out STD_LOGIC_VECTOR(3 downto 0)
         -- insert ports as need be
       );
end alu;

architecture bhv of alu is

	component mux8x1_4bits is
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
	end component;
	
	component adder4bits is
		port
		(
			A     : in std_logic_vector (3 downto 0);
			B     : in std_logic_vector (3 downto 0);
			cin   : in std_logic;
			S     : out std_logic_vector (3 downto 0);
			carry : out std_logic
		);
	end component;
		
	component subtractor4bits is
		port
		(
			A     : in std_logic_vector (3 downto 0);
			B     : in std_logic_vector (3 downto 0);
			S     : out std_logic_vector (3 downto 0)
		);
	end component;
	
	signal add,sub,void2,void3,saida0, saida1: std_logic_vector (3 downto 0);
	signal void: std_LOGIC;
begin
	adder : adder4bits port map(A => A, B => B, cin => '0', S => add, carry => void);
	subtrc: subtractor4bits port map(A => A, B => B, S => sub);
	
	OUPUT : mux8x1_4bits port map(SW => SW, A0 => add, A1 => sub, A2 => A AND B, A3 => A or B, A4=> Not A, A5 => A xor B,A6 =>  A Xnor B, A7 =>  A Nand B,output => output);
	
end bhv;

-- ***********************************************************************
-- 								Register File
-- ***********************************************************************
library IEEE;
use IEEE.std_logic_1164.all;

entity rf is
  port 
  ( 
		rst    : in STD_LOGIC;
      clk    : in STD_LOGIC;
		W_addr : in std_LOGIC_VECTOR(1 downto 0);
		R_addr : in std_LOGIC_VECTOR(1 downto 0);
      input  : in std_logic_vector(3 downto 0);
		wr     : in std_LOGIC;
		rd     : in std_LOGIC;
      output : out std_logic_vector(3 downto 0)
   );
		
end rf;

architecture bhv of rf is

	component reg4bits is
		port 
		(
			input  : in std_logic_vector (3 downto 0);
			clk    : in std_logic;
			clear  : in std_logic;
			set    : in std_logic;
			ld     : in std_logic;
			output : out std_logic_vector (3 downto 0)
		);
	end component;
	
	component mux4x1_4bits is
		port
		(
			A0      : in std_logic_vector (3 downto 0);
			A1      : in std_logic_vector (3 downto 0);
			A2      : in std_logic_vector (3 downto 0);
			A3      : in std_logic_vector (3 downto 0);
			SW      : in std_logic_vector (1 downto 0);
			output  : out std_logic_vector (3 downto 0)
		);
	end component;
	
	component mux2x1_4bits is
		port
		(
			A      : in std_logic_vector (3 downto 0);
			B      : in std_logic_vector (3 downto 0);
			SW      : in std_logic;
			output  : out std_logic_vector (3 downto 0)
		);
	end component;
	
	component decoder2x4 is
		port 
		(
			enable : in std_logic;
			input  : in std_logic_vector (1 downto 0);
			output : out std_logic_vector(3 downto 0)
		);
	end component;

signal out0, out1, out2, out3, W_addr_aux, R_addr_aux, output_aux : std_logic_vector(3 downto 0);
signal R0_out, R1_out, R2_out, R3_out : std_LOGIC_VECTOR(3 downto 0);

begin
	
	WR_decoder: decoder2x4 port map( enable => wr , input => W_addr, output => W_addr_aux );
	
	
	-- registers 4 bits
	R0: reg4bits port map (input => input , clk => clk , clear => '0' , set => '0', ld => W_addr_aux(0) , output => R0_out );
	R1: reg4bits port map (input => input , clk => clk , clear => '0' , set => '0', ld => W_addr_aux(1) , output => R1_out );
	R2: reg4bits port map (input => input , clk => clk , clear => '0' , set => '0', ld => W_addr_aux(2) , output => R2_out );
	R3: reg4bits port map (input => input , clk => clk , clear => '0' , set => '0', ld => W_addr_aux(3) , output => R3_out );
	
	RD_decoder: decoder2x4 port map(enable => rd, input => R_addr, output => R_addr_aux);
	
	-- drivers
	output <= R0_out when R_addr_aux(0) = '1' else "ZZZZ";
	output <= R1_out when R_addr_aux(1) = '1' else "ZZZZ";
	output <= R2_out when R_addr_aux(2) = '1' else "ZZZZ";
	output <= R3_out when R_addr_aux(3) = '1' else "ZZZZ";
	
	--mux_Read: mux4x1_4bits port map(A0 => R0_out, A1 => R1_out, A2 => R2_out, A3 => R3_out, SW => R_addr, output => output_aux);
	--mux_EnRead: mux2x1_4bits port map(A => output_aux, B => "ZZZZ", SW => rd );

end bhv;


library IEEE;
use IEEE.std_logic_1164.all;

entity dp is
  port ( 
			SW_I_ACC: in std_LOGIC_VECTOR(1 downto 0); 
			SW_ALU  : in std_LOGIC_VECTOR(2 downto 0); 
			
			rst     : in STD_LOGIC;
			clk     : in STD_LOGIC;
			
			acc_ld  : in std_LOGIC;
			acc_clr : in std_LOGIC; 
			
			RF_wr   : in std_LOGIC; 
			RF_rd   : in std_LOGIC;
			R_addr  : in std_LOGIC_VECTOR(1 downto 0); 
			W_addr  : in std_LOGIC_VECTOR(1 downto 0);
			
         imm     : in std_logic_vector(3 downto 0); 
         output_4: out STD_LOGIC_VECTOR (3 downto 0);
			RF_zero : out std_LOGIC							 -- novo
         --add ports as required
       );
end dp;

architecture rtl2 of dp is

component rf is
	port
	(
		rst    : in STD_LOGIC;
      clk    : in STD_LOGIC;
		W_addr : in std_LOGIC_VECTOR(1 downto 0);
		R_addr : in std_LOGIC_VECTOR(1 downto 0);
      input  : in std_logic_vector(3 downto 0);
		wr     : in std_LOGIC;
		rd     : in std_LOGIC;
      output : out std_logic_vector(3 downto 0)
	);
end component;


component alu is
	port 
    ( 
			A     : in std_LOGIC_VECTOR (3 downto 0);
			B     : in std_logic_vector (3 downto 0);
			SW    : in std_logic_vector (2 downto 0);     
         output: out STD_LOGIC_VECTOR(3 downto 0)
		-- add ports as required
    );
end component;

component comparador_4bits port
(
	a,b   : in std_logic_vector(3 downto 0);
	in_gt : in std_logic;
	in_eq : in std_logic;
	in_it : in std_logic;
	
	out_gt : out std_logic;
	out_eq : out std_logic;
	out_it : out std_logic
);
end component;

component reg4bits is   
	port
	(
		input  : in std_logic_vector (3 downto 0);
		clk    : in std_logic;
		clear  : in std_logic;
		set    : in std_logic;
		ld     : in std_logic;
		output : out std_logic_vector (3 downto 0)
	);
end component;

component mux4x1_4bits is
	port
	(
		A0      : in std_logic_vector (3 downto 0);
		A1      : in std_logic_vector (3 downto 0);
		A2      : in std_logic_vector (3 downto 0);
		A3      : in std_logic_vector (3 downto 0);
		SW      : in std_logic_vector (1 downto 0);
		output  : out std_logic_vector (3 downto 0)
	);
	end component;

signal alu_out   : std_LOGIC_VECTOR(3 downto 0);
signal alu_B_in  : std_logic_vector(3 downto 0);

signal R_data    : std_LOGIC_VECTOR(3 downto 0); 

signal acc_out   : std_LOGIC_VECTOR(3 downto 0);
signal acc_input : std_LOGIC_VECTOR(3 downto 0);


begin
	
	Register_File: rf port map (input => acc_out ,rst => rst, clk => clk, W_addr => W_addr , wr => RF_wr , R_addr => R_addr , rd => RF_rd , output => R_data);
	
	alu1: alu port map (A => acc_out, B => R_data, SW => SW_ALU, output => alu_out);
	
	ACC_IN: mux4x1_4bits port map(SW => SW_I_ACC, A0 => Imm, A1 => R_data, A2 => alu_out, A3 => "0000",output => acc_input);
	
	accumulador: reg4bits port map(input => acc_input, clk => clk, clear => acc_clr, ld => acc_ld, set => '0', output => acc_out);
	
	IFZERO: comparador_4bits port map(a => R_data, b => "0000", in_gt => '0', in_it => '0', in_eq => '1', out_eq => RF_zero);
	
	output_4 <= acc_out;
	
end rtl2;