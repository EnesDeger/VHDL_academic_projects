library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity and_or_combination is
    Port (in1, in2, in3, in4: in  bit;
          out1:               out bit
          );
end and_or_combination;

architecture Behavioral of and_or_combination is

    component And_Gate is
        port(X, Y: in bit; A: out bit);
    end component;

    component OR_Gate is
        port(X, Y: in bit; A: out bit);
    end component;

signal W1,W2: bit;
begin

and_gate_1 : AND_Gate port map(X=>in1, Y=>in2, A=>W1  );
and_gate_2 : AND_Gate port map(X=>in3, Y=>in4, A=>W2  );
or_gate_1  : OR_Gate  port map(X=>W1,  Y=>W2,  A=>out1);

end Behavioral;
