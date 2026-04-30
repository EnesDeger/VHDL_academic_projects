library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_full_adder is
    Port (in_1, in_2, C_in: in  std_logic ;
          C_out, S_out:      out std_logic  );
end decoder_full_adder;

architecture Behavioral of decoder_full_adder is
    
    component three_to_eight_decoder is
        Port (A,B,C: in std_logic;
              outs : out std_logic_vector(7 downto 0));
    end component;
    
    signal dec_outs: std_logic_vector (7 downto 0);
    
begin
    
    decoder: three_to_eight_decoder
    port map(A=>in_1,
             B=>in_2,
             C=>C_in,
             outs=>dec_outs);
    
    
    C_out <= dec_outs(3) or dec_outs(5)or dec_outs(6) or dec_outs(7);
    
    S_out <= dec_outs(1) or dec_outs(2)or dec_outs(4) or dec_outs(7);
    
end Behavioral;
