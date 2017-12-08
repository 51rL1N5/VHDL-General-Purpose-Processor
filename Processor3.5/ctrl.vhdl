-- controller
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

entity ctrl is
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
			-- you will need to add more ports here as design grows
       );
end ctrl;

architecture fsm of ctrl is
  type state_type is (s0,s1,s2,s3,s4,s6,done);
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
	type PM_BLOCK is array (0 to 4) of std_logic_vector(7 downto 0);
	constant PM : PM_BLOCK := (	

	-- This algorithm loads an immediate value of 3 and then stops
   --"OPCOD | aaaa"
	  load & "1001",
	  movr & "0100",
	  load & "1000",
	  andr & "0100",
	 
	 HALT & "1111"		-- halt
    );
  	
	signal tmp : integer ;
	
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
        
        when s0 =>    -- steady state
          PC := 0;
			 acc_clr <= '0';
			 RF_clr <= '0';
          if start = '1' then
            state <= s1;
          else 
            state <= s0;
          end if;
          
        when s1 =>				-- fetch instruction
		    
          IR := PM(PC);
          OPCODE := IR(7 downto 4);
          ADDRESS:= IR(3 downto 0);
          state <= s2;
          
        when s2 =>		-- increment PC
          PC := PC + 1;
          state <= s4;
          
        when s4 =>				-- decode instruction
          case OPCODE IS
            when load =>                       
              imm       <= address;                      
				  Sw_In_ACC <= "00";                                 
              acc_ld <= '1';
			     state     <= s6;
				when mova =>
				  RF_R_addr <= Address(3 downto 2);
				  RF_rd     <= '1';
				  SW_In_ACC <= "01"; -- novo
				  acc_ld    <= '1';
			 
			     state     <= s6;
				when movr =>
					
					RF_W_addr <= AddRESS(3 downto 2);
					RF_wr     <= '1';
					
					state     <= s6;
				when add =>
					RF_R_addr <= Address(3 downto 2);
					RF_rd     <= '1';
					alu_SW    <= A_sum_B;
					SW_In_ACC <= "10"; --novo
					acc_ld    <= '1';
			 
					state     <= s6;
				when sub =>
					RF_R_addr <= Address(3 downto 2);
					RF_rd     <= '1';
					alu_SW    <= A_minus_B;
					SW_In_ACC <= "10"; --novo
					acc_ld    <= '1';
			 
					state     <= s6;
				when andr =>
					RF_R_addr <= Address(3 downto 2);
					RF_rd     <= '1';
					alu_SW    <= A_and_B;
					SW_In_ACC <= "10"; --novo
					acc_ld    <= '1';
			 
					state     <= s6;
				when orr =>
					RF_R_addr <= Address(3 downto 2);
					RF_rd     <= '1';
					alu_SW    <= A_or_B;
					SW_In_ACC <= "10"; --novo
					acc_ld    <= '1';
			 
					state     <= s6;
				when jmp =>
				
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
					
					state     <= s6;
				when inv =>
					acc_ld    <= '1';
					alu_SW    <= not_A;
					SW_In_ACC <= "10"; 
			 
					state     <= s6;
				when xorr =>							-- novo
					acc_ld    <= '1';
					alu_SW    <= A_xor_B;
					SW_In_ACC <= "10"; 
					
					state     <= s6;
				when xnorr =>  						-- novo
					acc_ld    <= '1';
					alu_SW    <= A_xnor_B;
					SW_In_ACC <= "10"; 
			 
					state     <= s6;
				when nandr =>							-- novo
					acc_ld    <= '1';
					alu_SW    <= A_nand_B;
					SW_In_ACC <= "10"; --novo
			 
					state     <= s6;
				when halt =>
				  state <= done;
            when "1111" =>				   
              state <= done;
            when others =>
              state <= s1;
          end case;
			 
        when s6 =>                              -- go back for next instruction
          RF_rd   <= '0';
			 RF_wr   <= '0';
			 acc_ld  <= '0';
			 acc_clr <= '0';
			 state <= s1;
          
        when done =>                            -- stay here forever
          state <= done;
        when others =>
      end case;
      
		
    end if;
  end process;				
end fsm;