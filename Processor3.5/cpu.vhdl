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
			
       	a,b,c,d,e,f,g : out std_logic
          -- add ports as required
        );
end cpu;

-- these will change as your design grows
architecture struc of cpu is
component ctrl 
   port ( 		
			start     : in STD_LOGIC;
         clk       : in STD_LOGIC;
			
			
			RF_wr     : out std_LOGIC;
			RF_rd     : out std_LOGIC;
			RF_W_addr : out std_logic_vector(1 downto 0);
			RF_R_addr : out std_logic_vector(1 downto 0);
			RF_clr    : out STD_LOGIC;
			
			acc_clr   : out std_LOGIC;
			acc_ld    : out std_LOGIC;
			
			Alu_SW    : out std_logic_vector(2 downto 0);
			SW_In_ACC : out std_logic_vector(1 downto 0);
         imm       : out std_logic_vector(3 downto 0)
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
         output_4: out STD_LOGIC_VECTOR (3 downto 0)
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


begin

-- notice how the output from the datapath is tied to a signal
-- this output signal is then used as input for a decoder.
-- we can also see the output as "output".
-- the output from the datapath should be coming from the accumulator.
-- this is because all actions take place on the accumulator, including
-- all results of any alu operation. naturally, this is because of the 
-- nature of the instruction set.

  controller: ctrl port map(start => start, clk => clk, RF_wr => RF_wr, RF_rd => RF_rd, RF_clr => RF_clr, RF_W_addr => RF_W_addr, RF_R_addr => RF_R_addr, acc_clr => acc_clr, acc_ld => acc_ld, ALU_SW => SW_ALU, SW_in_ACC => SW_in_ACC,  imm => immediate);
  
  datapath: dp port map(SW_I_ACC => SW_In_ACC, SW_ALU => SW_ALU, rst => RF_clr, clk => clk, acc_ld => acc_ld, acc_clr => acc_clr, RF_wr => RF_Wr, RF_rd => RF_rd, R_addr => RF_R_addr, W_addr => RF_W_addr, imm => immediate, output_4 => cpu_out);
  
  output <= cpu_out;
  
  process(clk, cpu_out)
  begin
    -- take care of rst case here

    if(clk'event and clk='1') then
    -- this acts like a BCD to 7-segment decoder,
    -- can see output in waveforms as cpu_out
       case cpu_out is
         when "0000" =>
           a <= '0'; 
			  b <= '0'; 
			  c <= '0'; 
			  d <= '0'; 
           e <= '0'; 
			  f <= '0'; 
			  g <= '1';
         when "0001" =>
           a <= '1'; 
			  b <= '0'; 
			  c <= '0'; 
			  d <= '1'; 
           e <= '1'; 
			  f <= '1'; 
			  g <= '1';
         when "0010" =>
			  a <= '0'; 
			  b <= '0'; 
			  c <= '1'; 
			  d <= '0'; 
           e <= '0'; 
			  f <= '1'; 
			  g <= '0';
         when "0011" =>
           a <= '0'; 
			  b <= '0'; 
			  c <= '0'; 
			  d <= '0'; 
           e <= '1'; 
			  f <= '1'; 
			  g <= '0';
         when "0100" =>
           a <= '1'; 
			  b <= '0'; 
			  c <= '0'; 
			  d <= '1'; 
           e <= '1'; 
			  f <= '0'; 
			  g <= '0';
         when "0101" =>
           a <= '0'; 
			  b <= '1'; 
			  c <= '0'; 
			  d <= '0'; 
           e <= '1'; 
			  f <= '0'; 
			  g <= '0';
         when "0110" =>
           a <= '0'; 
			  b <= '1'; 
			  c <= '0'; 
			  d <= '0'; 
           e <= '0'; 
			  f <= '0'; 
			  g <= '0';
         when "0111" =>
           a <= '0'; 
			  b <= '0'; 
			  c <= '0'; 
			  d <= '1'; 
           e <= '1'; 
			  f <= '1'; 
			  g <= '1';
         when "1000" =>
           a <= '0'; 
			  b <= '0'; 
			  c <= '0'; 
			  d <= '0'; 
           e <= '0'; 
			  f <= '0'; 
			  g <= '0';
         when "1001" =>
           a <= '0'; 
			  b <= '0'; 
			  c <= '0'; 
			  d <= '0'; 
           e <= '0'; 
			  f <= '1'; 
			  g <= '0';
         when others =>
       end case;
    end if;
  end process;							

end struc;



