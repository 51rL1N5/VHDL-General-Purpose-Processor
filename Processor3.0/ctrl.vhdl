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
  type state_type is (s0,s1,s2,s3,s4,load_state,s6,done,mova_state,movr_state,add_state, sub_state, andr_state,orr_state,jmp_state,inv_state,halt_state);
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
	
	
	-- Alu switches PLUS
	--constant pass_A     : std_logic_vector(2 downto 0) := "000";
	constant A_sum_B    : std_logic_vector(2 downto 0) := "000";
	constant A_minus_B  : std_logic_vector(2 downto 0) := "001";
	constant A_and_B    : std_logic_vector(2 downto 0) := "010";
	constant A_or_B     : std_logic_vector(2 downto 0) := "011";
	constant not_A      : std_logic_vector(2 downto 0) := "100";
	constant A_xor_B    : std_logic_vector(2 downto 0) := "101"; -- mudar
	constant A_xnor_B   : std_logic_vector(2 downto 0) := "110";
	constant A_nand_B   : std_logic_vector(2 downto 0) := "111";
	
	--constant pass_B     : std_logic_vector(2 downto 0) := "110";

	-- as you add more code for your algorithms make sure to increase the
	-- array size. ie. 2 lines of code here, means array size of 0 to 1.
	type PM_BLOCK is array (0 to 4) of std_logic_vector(7 downto 0);
	constant PM : PM_BLOCK := (	

	-- This algorithm loads an immediate value of 3 and then stops
 --"OPCOD|aaaa"
    "0010"&"0011",   -- ACC = 3
	 "0001"&"0000",   -- RF[0]
	 "0010"&"0001",   -- ACC = 1
	 "0011"&"0000",   -- ACC = ACC + RF[0]
	 "10011111"		-- halt
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
            when load =>                       -- notice we can use
                                                -- the instruction
              state <= load_state;
				when mova =>
				
				  state <= mova_state ;
				when movr =>
				
				  state <= movr_state ;
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
				when halt =>
				  
				  state <= halt_state;
            when "1111" =>                      -- and the machine code
                                                -- interchangeably
              state <= done;
            when others =>
              state <= s1;
          end case;
        
			-- these states are the ones in which you actually
			-- start sending signals across
			-- to the datapath depending on what opcode is decoded.
			-- you add more states here.
          
        when load_state =>                              -- load iiii
          imm       <= address;                      -- set the immediate port
          Sw_In_ACC <= "00";                                 -- to the lower_ir
          acc_ld <= '1';
			 state     <= s6;
        when s6 =>                              -- go back for next instruction
          RF_rd   <= '0';
			 RF_wr   <= '0';
			 acc_ld  <= '0';
			 acc_clr <= '0';
			 
			 state <= s1;
          
        when done =>                            -- stay here forever
          state <= done;
          
	     when mova_state =>
		    
			 RF_R_addr <= Address(3 downto 2);
			 RF_rd     <= '1';
			 SW_In_ACC <= "01"; -- novo
			 acc_ld    <= '1';
			 
			 state     <= s6;
		  when movr_state =>
		    RF_W_addr <= AddRESS(3 downto 2);
			 RF_wr     <= '1';
			 
			 state     <= s6;
		  when add_state =>
		    RF_R_addr <= Address(3 downto 2);
			 RF_rd     <= '1';
			 alu_SW    <= A_sum_B;
			 SW_In_ACC <= "10"; --novo
			 acc_ld    <= '1';
			 
			 state     <= s6;
		  when sub_state =>
		    RF_R_addr <= Address(3 downto 2);
			 RF_rd     <= '1';
			 alu_SW    <= A_minus_B;
			 SW_In_ACC <= "10"; --novo
			 acc_ld    <= '1';
			 
			 state     <= s6;
			 
		  when andr_state =>
			 RF_R_addr <= Address(3 downto 2);
			 RF_rd     <= '1';
			 alu_SW    <= A_and_B;
			 SW_In_ACC <= "10"; --novo
			 acc_ld    <= '1';
			 
			 state     <= s6;
			 
		  when orr_state =>
			 RF_R_addr <= Address(3 downto 2);
			 RF_rd     <= '1';
			 alu_SW    <= A_or_B;
			 SW_In_ACC <= "10"; --novo
			 acc_ld    <= '1';
			 
			 state     <= s6;
		  when jmp_state  =>
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
			 
		  when inv_state  =>
		    acc_ld    <= '1';
			 alu_SW    <= not_A;
			 SW_In_ACC <= "10"; --novo
			 
			 state     <= s6;
		  when halt_state =>
			 state <= done;
        when others =>
          
      end case;
      
		
    end if;
  end process;				
end fsm;