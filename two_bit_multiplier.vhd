library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity two_bit_multiplier is
    Port (in_1,in_2:in  std_logic_vector (1 downto 0); 
          out_multi:out std_logic_vector (3 downto 0));
end two_bit_multiplier;

architecture Behavioral of two_bit_multiplier is
    
    component full_adder is
        Port (A,B,C_in   : in  std_logic ;
              S_out,C_out: out std_logic);
    end component;
    
    signal and_out: std_logic_vector (3 downto 0);
    signal c_temp : std_logic ;
    
begin

    and_out(0)<=in_1(0) and in_2(0);
    and_out(1)<=in_1(0) and in_2(1);
    and_out(2)<=in_1(1) and in_2(0);
    and_out(3)<=in_1(1) and in_2(1);
    out_multi(0)<=and_out(0);
    
    FA_1: full_adder
    port map(A    =>and_out(1),
             B    =>and_out(2),
             C_in =>'0',
             S_out=>out_multi(1),
             C_out=>c_temp);
    
    FA_2: full_adder
    port map(A    =>and_out(3),
             B    =>c_temp,
             C_in =>'0',
             S_out=>out_multi(2),
             C_out=>out_multi(3));
             
end Behavioral;
