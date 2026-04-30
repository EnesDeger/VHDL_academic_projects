library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Four2One_MUX is
    Port (I     :in  std_logic_vector (3 downto 0);
          S     :in  std_logic_vector(1 downto 0);
          y     :out std_logic );
end Four2One_MUX;

architecture Behavioral of Four2One_MUX is
    
    signal Ands: std_logic_vector (3 downto 0);
    
begin
    
    Ands(0)<=I(0) and not(s(1))and not(s(0));
    Ands(1)<=I(1) and not(s(1))and     s(0);
    Ands(2)<=I(2) and     s(1) and not(s(0));
    Ands(3)<=I(3) and     s(1) and     s(0);
    
    Y<=Ands(0) or Ands(1) or Ands(2) or Ands(3);
    
end Behavioral;
