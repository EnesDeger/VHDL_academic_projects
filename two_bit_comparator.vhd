library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity two_bit_comparator is
    Port (A, B : in std_logic_vector (1 downto 0);
          G,E,L: out std_logic);
end two_bit_comparator;

architecture Behavioral of two_bit_comparator is
    
    component two_to_four_decoder is
        Port (A,B : in  std_logic ;
              outs: out std_logic_vector (3 downto 0));
    end component;
    
    signal outs_dec_0: std_logic_vector (3 downto 0);
    signal outs_dec_1: std_logic_vector (3 downto 0);
    signal X:          std_logic_vector (1 downto 0);
    
begin
    
    
    zero_dec: two_to_four_decoder
    port map(A=>A(0),
             B=>B(0),
             outs=>outs_dec_0);
    
    one_dec: two_to_four_decoder
    port map(A=>A(1),
             B=>B(1),
             outs=>outs_dec_1);
    
    X(0)<= outs_dec_0(3) or outs_dec_0(0);
    X(1)<= outs_dec_1(3) or outs_dec_1(0);
    
    G<= outs_dec_1(2) or (X(1) and outs_dec_0(2));
    
    E<= X(1) and X(0);
    
    L<= outs_dec_1(1) or (X(1) and outs_dec_0(1));
    
end Behavioral;