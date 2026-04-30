library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM_square_of_input is
    Port (I: in std_logic_vector (2 downto 0);
          A:out std_logic_vector (5 downto 0));
end ROM_square_of_input;

architecture Behavioral of ROM_square_of_input is
    
    component three_to_eight_decoder is
        Port (A,B,C: in std_logic;
              outs : out std_logic_vector(7 downto 0));
    end component;
    
    signal out_dec:std_logic_vector (7 downto 0);
    
begin
    
    Decoder: three_to_eight_decoder
    port map(A   =>I(2),
             B   =>I(1),
             C   =>I(0),
             outs=>out_dec);
    
    A(5)<=out_dec(7) or out_dec(6);
    A(4)<=out_dec(7) or out_dec(5) or out_dec(4);
    A(3)<=out_dec(5) or out_dec(3);
    A(2)<=out_dec(6) or out_dec(2);
    A(1)<='0';
    A(0)<=out_dec(7) or out_dec(5) or out_dec(3) or out_dec(1);
    
end Behavioral;