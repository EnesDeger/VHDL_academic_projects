library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_Gate is
    Port (in1,in2: in std_logic ;out1: out std_logic);
end AND_Gate;

architecture And_Gate_Architecture of AND_Gate is

begin
out1<= in1 and in2;

end AND_Gate_Architecture;
