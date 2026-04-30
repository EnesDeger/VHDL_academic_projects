library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd2seven_segment_dec is
    Port (in_D,in_C,in_B,in_A :in  std_logic;
          a,b,c,d,e,f,g       :out std_logic );
end bcd2seven_segment_dec;

architecture Behavioral of bcd2seven_segment_dec is
    
    component four_to_sixteen_decoder is
        Port (ins :in  std_logic_vector (3  downto 0);
              outs:out std_logic_vector (15 downto 0));
    end component;
    
    signal S: std_logic_vector (15 downto 0);
    
begin
    
    DECODER: four_to_sixteen_decoder
        port map (ins(3)=>in_D,
                  ins(2)=>in_C,
                  ins(1)=>in_B,
                  ins(0)=>in_A,
                  outs  =>S);
    
    a<=S(0) or S(2) or S(3) or S(5) or S(6) or S(7) or S(8) or S(9);
    b<=S(0) or S(1) or S(2) or S(3) or S(4) or S(7) or S(8) or S(9);
    c<=S(0) or S(1) or S(3) or S(4) or S(5) or S(6) or S(7) or S(8) or S(9);
    d<=S(0) or S(2) or S(3) or S(5) or S(6) or S(8) or S(9);
    e<=S(0) or S(2) or S(6) or S(8);
    f<=S(0) or S(4) or S(5) or S(6) or S(8) or S(9);
    g<=S(2) or S(3) or S(4) or S(5) or S(6) or S(8) or S(9);
    
end Behavioral;