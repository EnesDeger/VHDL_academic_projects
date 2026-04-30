library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D2JK_FlipFlop is
    Port (J, K, clock,reset: in std_logic;
          Q,Qn       : out std_logic );
end D2JK_FlipFlop;

architecture Behavioral of D2JK_FlipFlop is
    
    component DFlipFlop is
        Port ( D     : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           Q     : out STD_LOGIC;
           Qn    : out STD_LOGIC); 
    end component;
   
   signal S_Q, S_Qn, And_1, And_2, Or_1: std_logic;
    
begin
    
    D_flip_flop: DFlipFlop
    port map(D    =>Or_1,
             Reset=>reset,
             Clock=>Clock,
             Q    =>S_Q,
             Qn   =>S_Qn);
    
    
    And_1<=S_Q and not(K);
    And_2<=J   and S_Qn  ;
    Or_1<=And_1 or And_2;
    
    Q<=S_Q;
    Qn<=S_Qn;
    
    
end Behavioral;