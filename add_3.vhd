library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_3 is
    Port (A: in  std_logic_vector (3 downto 0);
          Y: out std_logic_vector (3 downto 0));
end add_3;

architecture Behavioral of add_3 is

begin
    
    Y(3)<=  A(3)              or (A(2)        and A(1))            or (A(2) and A(0));
    Y(2)<= (A(3)and A(0))     or (A(2)        and not(A(1)) and not(A(0)));
    Y(1)<= (A(3)and not(A(0)))or (not(A(2))   and A(1))            or (A(1) and A(0));
    Y(0)<= (A(3)and not(A(0)))or (A(2)and A(1)and not(A(0)))       or (not(A(3))and not A(2)and A(0));
    
    
end Behavioral;
