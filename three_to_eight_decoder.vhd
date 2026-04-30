library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity three_to_eight_decoder is
    Port (A,B,C: in std_logic;
          outs : out std_logic_vector(7 downto 0));
end three_to_eight_decoder;

architecture Behavioral of three_to_eight_decoder is

begin
    
    outs(0)<=not(A)and not(B)and not(C);
    outs(1)<=not(A)and not(B)and C;
    outs(2)<=not(A)and B     and not(C);
    outs(3)<=not(A)and B     and C;
    outs(4)<=A     and not(B)and not(C);
    outs(5)<=A     and not(B)and C;
    outs(6)<=A     and B     and not(C);
    outs(7)<=A     and B     and C;
    
     
end Behavioral;
