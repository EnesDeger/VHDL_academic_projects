library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pre_0 is
    Port (A, B, C: in std_logic;
             Z   : out std_logic
          );
end pre_0;

architecture Behavioral of pre_0 is

    component OR_Gate is
        port(in1, in2: in  std_logic;
             out1    : out std_logic
             );
    end component;
    
    component AND_Gate is
    port(in1, in2:in  std_logic; 
           out1  :out std_logic 
    );
    end component;
    signal Signal_1:std_logic;
begin

    G1 : OR_Gate
    port map(in1=>B, in2=>C,out1=>Signal_1);
    
    G2 : AND_Gate
    port map(in1=>A, in2=>Signal_1, out1=>Z);
    
end Behavioral;
