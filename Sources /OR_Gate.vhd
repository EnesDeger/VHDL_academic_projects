library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_Gate is
    Port (in1, in2: in std_logic ;out1: out std_logic);
end OR_Gate;

architecture Or_Gate_Architecture of OR_Gate is

begin
out1<= in2 or in1;

end Or_Gate_Architecture ;


