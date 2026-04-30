library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity two_to_four_decoder is
    Port (A,B : in  std_logic ;
          outs: out std_logic_vector (3 downto 0));
end two_to_four_decoder;

architecture Behavioral of two_to_four_decoder is

begin
    
    outs(0)<=not(A) and not(B);
    outs(1)<=not(A) and B;
    outs(2)<=   A   and not(B);
    outs(3)<=   A   and B;
    
    
end Behavioral;
