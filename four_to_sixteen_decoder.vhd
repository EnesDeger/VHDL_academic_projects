library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_to_sixteen_decoder is
    Port (ins :in  std_logic_vector (3  downto 0);
          outs:out std_logic_vector (15 downto 0));
end four_to_sixteen_decoder;

architecture Behavioral of four_to_sixteen_decoder is

begin
    
    outs(0) <=not(ins(3))and not(ins(2)) and not(ins(1)) and not(ins(0));
    outs(1) <=not(ins(3))and not(ins(2)) and not(ins(1)) and ins(0);
    outs(2) <=not(ins(3))and not(ins(2)) and ins(1)      and not(ins(0));
    outs(3) <=not(ins(3))and not(ins(2)) and ins(1)      and ins(0);
    outs(4) <=not(ins(3))and ins(2)      and not(ins(1)) and not(ins(0));
    outs(5) <=not(ins(3))and ins(2)      and not(ins(1)) and ins(0);     
    outs(6) <=not(ins(3))and ins(2)      and ins(1)      and not(ins(0));
    outs(7) <=not(ins(3))and ins(2)      and ins(1)      and ins(0);     
    outs(8) <=ins(3)     and not(ins(2)) and not(ins(1)) and not(ins(0));
    outs(9) <=ins(3)     and not(ins(2)) and not(ins(1)) and ins(0);     
    outs(10)<=ins(3)     and not(ins(2)) and ins(1)      and not(ins(0));
    outs(11)<=ins(3)     and not(ins(2)) and ins(1)      and ins(0);     
    outs(12)<=ins(3)     and ins(2)      and not(ins(1)) and not(ins(0));
    outs(13)<=ins(3)     and ins(2)      and not(ins(1)) and ins(0);     
    outs(14)<=ins(3)     and ins(2)      and ins(1)      and not(ins(0));
    outs(15)<=ins(3)     and ins(2)      and ins(1)      and ins(0);     
    
end Behavioral;