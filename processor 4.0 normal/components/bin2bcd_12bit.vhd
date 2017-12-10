-- algoritmo para o display
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity bin2bcd_12bit is
    Port ( 
			  binIN : in  STD_LOGIC_VECTOR (11 downto 0);
           ones : out  STD_LOGIC_VECTOR (3 downto 0);
           tens : out  STD_LOGIC_VECTOR (3 downto 0);
           hundreds : out  STD_LOGIC_VECTOR (3 downto 0);
           thousands : out  STD_LOGIC_VECTOR (3 downto 0)
          );
end bin2bcd_12bit;

architecture bin2bcd_12bit of bin2bcd_12bit is

begin

bcd1: process(binIN)
  variable temp : STD_LOGIC_VECTOR (11 downto 0);
  variable bcd : UNSIGNED (15 downto 0) := (others => '0');

  begin
    bcd := (others => '0');
    
    temp(11 downto 0) := binIN;
    
    for i in 0 to 11 loop  
      if bcd(3 downto 0) > 4 then 
        bcd(3 downto 0) := bcd(3 downto 0) + 3;
      end if;
		
      if bcd(7 downto 4) > 4 then 
        bcd(7 downto 4) := bcd(7 downto 4) + 3;
      end if;
    
      if bcd(11 downto 8) > 4 then  
        bcd(11 downto 8) := bcd(11 downto 8) + 3;
      end if;
        
      bcd := bcd(14 downto 0) & temp(11);
    
      temp := temp(10 downto 0) & '0';
    
    end loop;
 
    ones <= STD_LOGIC_VECTOR(bcd(3 downto 0));
    tens <= STD_LOGIC_VECTOR(bcd(7 downto 4));
    hundreds <= STD_LOGIC_VECTOR(bcd(11 downto 8));
    thousands <= STD_LOGIC_VECTOR(bcd(15 downto 12));
  
  end process bcd1;            
  
end bin2bcd_12bit;