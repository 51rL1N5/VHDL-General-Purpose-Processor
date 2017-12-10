-- controller
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

entity ctrl is
  port ( 

         start     : in STD_LOGIC;
         clk       : in STD_LOGIC;
			now_inst  : out std_logic_vector(3 downto 0);
			
			
			RF_wr     : out std_LOGIC;
			RF_rd     : out std_LOGIC;
			RF_W_addr : out std_logic_vector(1 downto 0);
			RF_R_addr : out std_logic_vector(1 downto 0);
			RF_clr    : out STD_LOGIC;
			
			acc_clr    : out std_LOGIC;
			acc_ld     : out std_LOGIC;
			acc_shift_l: out std_LOGIC;	--novo
			acc_shift_r: out std_LOGIC;   --novo
			
			Alu_SW    : out std_logic_vector(2 downto 0);
			SW_In_ACC : out std_logic_vector(1 downto 0);
         imm       : out std_logic_vector(3 downto 0);
			
			RF_zero   : in std_logic						   -- novo
			-- you will need to add more ports here as design grows
       );
end ctrl;

architecture fsm of ctrl is
  type state_type is (init, fetch, Decod, done, mova_state, movr_state, load_state, add_state, sub_state, andr_state, orr_state, jmp_state, halt_state, xorr_state, xnorr_state, nandr_state, jmpz_state, jmp_if_zero_jmp, shfl_state, shfr_state, inv_state);
  signal state : state_type; 		

	-- constants declared for ease of reading code
	
	constant mova    : std_logic_vector(3 downto 0) := "0000";
	constant movr    : std_logic_vector(3 downto 0) := "0001";
	constant load    : std_logic_vector(3 downto 0) := "0010";
	
	constant add	  : std_logic_vector(3 downto 0) := "0011";
	constant sub	  : std_logic_vector(3 downto 0) := "0100";
	constant andr    : std_logic_vector(3 downto 0) := "0101";
	constant orr     : std_logic_vector(3 downto 0) := "0110";
	
	constant jmp	  : std_logic_vector(3 downto 0) := "0111";
	constant inv     : std_logic_vector(3 downto 0) := "1000";
	constant halt	  : std_logic_vector(3 downto 0) := "1001";
	
	constant xorr    : std_logic_vector(3 downto 0) := "1010"; -- novo
	constant xnorr   : std_logic_vector(3 downto 0) := "1011"; -- novo
	constant nandr   : std_logic_vector(3 downto 0) := "1100"; -- novo
	constant jmpz    : std_logic_vector(3 downto 0) := "1101"; -- novo
	constant SHFL    : std_LOGIC_vector(3 downto 0) := "1110"; -- novo
   constant SHFR    : std_LOGIC_vector(3 downto 0) := "1111"; -- novo
	
	
	-- Alu switches PLUS
	constant A_sum_B    : std_logic_vector(2 downto 0) := "000";
	constant A_minus_B  : std_logic_vector(2 downto 0) := "001";
	constant A_and_B    : std_logic_vector(2 downto 0) := "010";
	constant A_or_B     : std_logic_vector(2 downto 0) := "011";
	constant not_A      : std_logic_vector(2 downto 0) := "100";
	constant A_xor_B    : std_logic_vector(2 downto 0) := "101"; -- novo
	constant A_xnor_B   : std_logic_vector(2 downto 0) := "110"; -- novo 
	constant A_nand_B   : std_logic_vector(2 downto 0) := "111"; -- novo 
	
	--constant pass_B     : std_logic_vector(2 downto 0) := "110";

	-- as you add more code for your algorithms make sure to increase the
	-- array size. ie. 2 lines of code here, means array size of 0 to 1.
	type PM_BLOCK is array (0 to 8) of std_logic_vector(7 downto 0);
	constant PM : PM_BLOCK := (	

   --"OPCOD | aaaa"
	  load & "0001",
	  movr & "0000",
	  load & "0100",
	  sub  & "0000",
	  movr & "0100",
	  jmpz & "0110",
	  mova & "0100",
	  jmp  & "0011",
	  
	  HALT & "1111" -- halt
    );
  	
	signal tmp : integer;
	
begin
	process (clk)
	-- these variables declared here don't change.
	-- these are the only data allowed inside
	-- our otherwise pure FSM
  
	variable IR : std_logic_vector(7 downto 0);
	variable OPCODE : std_logic_vector( 3 downto 0);
	variable ADDRESS : std_logic_vector(3 downto 0);
	variable PC : integer range 0 to 15;
    
	begin
		-- don't forget to take care of rst
    
		if (clk'event and clk = '1') then			
      
      --
      -- steady state
      --
    
      case state is
        
        when init =>    -- steady state
          PC := 0;
			 acc_clr <= '0';
			 RF_clr <= '0';
			 
          if start = '1' then
            state <= fetch;
          else
            state <= init;
          end if;
          
        when fetch =>				-- fetch instruction
		    
          IR := PM(PC);
          OPCODE := IR(7 downto 4);
          ADDRESS:= IR(3 downto 0);
			 
			 RF_rd       <= '0';
			 RF_wr       <= '0';
			 acc_ld      <= '0';
			 acc_clr     <= '0';
			 acc_shift_l <= '0';
			 acc_shift_r <= '0';
          
			 state <= Decod;
        when Decod =>			-- decode instruction
          PC := PC + 1;
			 case OPCODE IS
            when load =>                      
				  state <= load_state;
				when mova =>
				  state <= mova_state;
				when movr =>
					state <= movr_state;
				when add =>
					state <= add_state;
				when sub =>
					state <= sub_state;
				when andr =>
					state <= andr_state;
				when orr =>
					state <= orr_state;
				when jmp =>
					state <= jmp_state;
				when inv =>
					state <= inv_state;
				when xorr =>							-- novo
					state <= xorr_state;
				when xnorr =>  						-- novo
					state <= xnorr_state;
				when nandr =>							-- novo
					state <= nandr_state;
				when halt =>
				  state <= halt_state;
				when jmpz =>
					state <= jmpz_state;
				when SHFL =>
					state <= shfl_state;
				when SHFR =>
					state <= shfr_state;
            when others =>
					state <= fetch;
          end case;
			
		 when load_state =>
				imm       <= address;               
				Sw_In_ACC <= "00";                              
            acc_ld <= '1';
			   now_inst <= load;
				
				state <= fetch;
		 when mova_state =>
				RF_R_addr <= Address(3 downto 2);
				RF_rd     <= '1';
				SW_In_ACC <= "01";
				acc_ld    <= '1';
				  
				now_inst  <= mova;
					
				state <= fetch;
		  when movr_state =>
				RF_W_addr <= AddRESS(3 downto 2);
				RF_wr     <= '1';
					
				now_inst  <= movr;
					
				state <= fetch;
		  when add_state =>
				RF_R_addr <= Address(3 downto 2);
				RF_rd     <= '1';
				alu_SW    <= A_sum_B;
				SW_In_ACC <= "10"; --novo
				acc_ld    <= '1';
					
				now_inst  <= add;
			 
				state <= fetch;
		  when sub_state =>
				RF_R_addr <= Address(3 downto 2);
				RF_rd     <= '1';
				alu_SW    <= A_minus_B;
				SW_In_ACC <= "10"; --novo
				acc_ld    <= '1';
					
				now_inst  <= sub;
			 
				state <= fetch;
		  when andr_state =>
				RF_R_addr <= Address(3 downto 2);
				RF_rd     <= '1';
				alu_SW    <= A_and_B;
				SW_In_ACC <= "10"; --novo
				acc_ld    <= '1';
					
				now_inst  <= andr;
			 
				state <= fetch;
		  when orr_state =>
				RF_R_addr <= Address(3 downto 2);
				RF_rd     <= '1';
				alu_SW    <= A_or_B;
				SW_In_ACC <= "10"; --novo
				acc_ld    <= '1';
					
				now_inst <= orr;
			 
				state <= fetch;
		  when jmp_state =>
		  		PC := 0;
				if(address(0) = '1') then
					PC := PC + 1;
				end if;
				if(address(1) = '1') then
					PC := PC + 2;
				end if;
				if(address(2) = '1') then
					PC := PC + 4;
				end if;
				if(address(3) = '1') then
					PC := PC + 8;
				end if;
					
				now_inst <= jmp;
					
				state <= fetch;
		  when inv_state =>
				acc_ld    <= '1';
				alu_SW    <= not_A;
				SW_In_ACC <= "10"; 
					
				now_inst <= inv;
			 
				state <= fetch;
		  when xnorr_state =>
				acc_ld    <= '1';
				alu_SW    <= A_xnor_B;
				SW_In_ACC <= "10"; 
			 
				now_inst  <= xnorr;
			 
				state <= fetch;
		  when nandr_state =>
	         acc_ld    <= '1';
				alu_SW    <= A_nand_B;
				SW_In_ACC <= "10";
					
				now_inst  <= nandr;
			 
				state <= fetch; 		  
		  when halt_state =>
		      now_inst <= halt;
				state <= done;
		  when shfl_state => 
	   		acc_ld      <= '1';
				acc_shift_l <= '1';
	
				state <= fetch;
		  when shfr_state => 
				acc_ld      <= '1';
				acc_shift_r <= '1';
					
				state <= fetch;
		  when jmpz_state => 
				RF_rd <= '1';
				RF_R_addr <= Address(3 downto 2);
					
				state <= jmp_if_zero_jmp;
		  when jmp_if_zero_jmp =>
				
				if(RF_zero = '1') then
					if(address(0) = '1') then
							PC := PC + 1;
					end if;
					if(address(1) = '1') then
						PC := PC + 2;
					end if;
				end if;
			 state <= fetch;
        when done =>                            -- stay here forever
          state <= done;
        when others =>
      end case;
      
		
    end if;
  end process;				
end fsm;