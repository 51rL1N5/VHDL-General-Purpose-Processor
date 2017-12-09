-- cpu (top level entity)
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

-- these should probably stay the same
entity cpu is
   port ( 
			start         : in STD_LOGIC;
         clk           : in STD_LOGIC;
			
			output        : out STD_LOGIC_VECTOR (3 downto 0);
			
			-- opcode
			OPCdisp0      : out std_LOGIC_VECTOR(6 downto 0);
			OPCdisp1      : out std_LOGIC_VECTOR(6 downto 0);
			OPCdisp2      : out std_LOGIC_VECTOR(6 downto 0);
			OPCdisp3      : out std_LOGIC_VECTOR(6 downto 0);
			
			-- result
         display0      : out std_LOGIC_VECTOR(6 downto 0);
			display1      : out std_LOGIC_VECTOR(6 downto 0)
			
			-- add ports as required
        );
end cpu;

-- these will change as your design grows
architecture struc of cpu is
component ctrl 
   port ( 		
			start     : in STD_LOGIC;
         clk       : in STD_LOGIC;
			now_inst  : out std_logic_vector(3 downto 0);
			
			RF_wr     : out std_LOGIC;
			RF_rd     : out std_LOGIC;
			RF_W_addr : out std_logic_vector(1 downto 0);
			RF_R_addr : out std_logic_vector(1 downto 0);
			RF_clr    : out STD_LOGIC;
			
			acc_clr   : out std_LOGIC;
			acc_ld    : out std_LOGIC;
			
			Alu_SW    : out std_logic_vector(2 downto 0);
			SW_In_ACC : out std_logic_vector(1 downto 0);
         imm       : out std_logic_vector(3 downto 0);
			
			RF_zero   : in std_LOGIC
          -- add ports as required
		   
		  );
end component;

component dp
   port ( 
			SW_I_ACC: in std_LOGIC_VECTOR(1 downto 0); --novo
			SW_ALU  : in std_LOGIC_VECTOR(2 downto 0); --novo
			
			rst     : in STD_LOGIC;
			clk     : in STD_LOGIC;
			
			acc_ld  : in std_LOGIC;
			acc_clr : in std_LOGIC; -- novo
			
			RF_wr   : in std_LOGIC; --novo nome 
			RF_rd   : in std_LOGIC; --novo nome
			R_addr  : in std_LOGIC_VECTOR(1 downto 0); 
			W_addr  : in std_LOGIC_VECTOR(1 downto 0);
			
         imm     : in std_logic_vector(3 downto 0); 
         output_4: out STD_LOGIC_VECTOR (3 downto 0);
			
			RF_zero : out std_LOGIC							 -- novo
        );
end component;

component bin2bcd_12bit is
	port
	(
		binIN     : in  STD_LOGIC_VECTOR (11 downto 0);
      ones      : out  STD_LOGIC_VECTOR (3 downto 0);
      tens      : out  STD_LOGIC_VECTOR (3 downto 0);
      hundreds  : out  STD_LOGIC_VECTOR (3 downto 0);
      thousands : out  STD_LOGIC_VECTOR (3 downto 0)
	);
end component;

component bin_to_disp is
	port
	(
		a   :  in std_logic_vector(3 downto 0);
		disp: out std_logic_vector(6 downto 0)
	);
end component;

component opcode_decoder is
	port
	(
		opcode : in std_logic_vector(3 downto 0);
		
		disp0  : out std_logic_vector(6 downto 0);
		disp1  : out std_logic_vector(6 downto 0);
		disp2  : out std_logic_vector(6 downto 0);
		disp3  : out std_logic_vector(6 downto 0)
	);
end component;

signal immediate : std_logic_vector(3 downto 0);
signal cpu_out  : std_logic_vector(3 downto 0);

signal RF_rd    : std_LOGIC;
signal RF_wr    : std_LOGIC;
signal RF_W_addr: std_LOGIC_VECTOR(1 downto 0);
signal RF_R_addr: std_LOGIC_vector(1 downto 0);
signal RF_clr   : std_LOGIC;

signal acc_clr : std_LOGIC;
signal acc_ld  : std_LOGIC;

signal SW_ALU  : std_LOGIC_VECTOR(2 downto 0);
signal SW_in_ACC: std_LOGIC_VECTOR(1 downto 0);

signal void0   : std_LOGIC_VECTOR(3 downto 0);
signal void1   : std_LOGIC_VECTOR(3 downto 0);
signal tens_tmp: std_LOGIC_VECTOR(3 downto 0);
signal ones_tmp: std_LOGIC_VECTOR(3 downto 0);

signal actual_instruction : std_LOGIC_VECTOR(3 downto 0);

signal RF_zero : std_LOGIC;

begin

  controller: ctrl port map(start => start, clk => clk, now_inst=> actual_instruction, RF_wr => RF_wr, RF_rd => RF_rd, RF_clr => RF_clr, RF_W_addr => RF_W_addr, RF_R_addr => RF_R_addr, acc_clr => acc_clr, acc_ld => acc_ld, ALU_SW => SW_ALU, SW_in_ACC => SW_in_ACC,  imm => immediate, RF_zero => RF_zero);
  
  datapath: dp port map(SW_I_ACC => SW_In_ACC, SW_ALU => SW_ALU, rst => RF_clr, clk => clk, acc_ld => acc_ld, acc_clr => acc_clr, RF_wr => RF_Wr, RF_rd => RF_rd, R_addr => RF_R_addr, W_addr => RF_W_addr, imm => immediate, output_4 => cpu_out, RF_zero => RF_zero);
  
  output <= cpu_out;
  
  
  -- result
  bin2bcd: bin2bcd_12bit port map( binIN => "00000000" & cpu_out , ones => ones_tmp , tens => tens_tmp , hundreds => void0 , thousands => void1);
  
  
  bin_decoder_ones: bin_to_disp port map (a => ones_tmp, disp => display0);
  bin_decoder_tens: bin_to_disp port map (a => tens_tmp, disp => display1);
  
  -- opcode decoder
  
  decoder_opcode: opcode_decoder port map ( opcode => actual_instruction, disp0 => OPCdisp0, disp1 => OPCdisp1, disp2 => OPCdisp2, disp3 => OPCdisp3);

end struc;



