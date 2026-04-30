library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity half_adder is
    Port (x,y: in std_logic;
          C,S: out std_logic);
end half_adder;

architecture Behavioral of half_adder is

begin

S <= x xor y;
C <= x and y;

end Behavioral;
