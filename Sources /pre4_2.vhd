library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pre4_2 is
    Port (X    : in std_logic;
          CLK  : in std_logic;
          RESET: in std_logic;
          Q    :out std_logic);
end pre4_2;

architecture Behavioral of pre4_2 is
    
    component DFlipFlop is
        Port ( D     : in  STD_LOGIC;
               Reset : in  STD_LOGIC;
               Clock : in  STD_LOGIC;
               Q     : out STD_LOGIC;
               Qn    : out STD_LOGIC);
    end component;
    
    signal sig_A, sig_An, --sig_An isn't using, but I defined it anyway
           sig_B, sig_Bn,
           And_1, And_2, Or_1: std_logic;
    
begin
    
    
    D_A: DFlipFlop
    port map(D    =>Or_1,
             Clock=>CLK,
             Reset=>RESET,
             Q    =>sig_A,
             QN   =>sig_An);
    
    D_B: DFlipFlop
    port map(D    =>X,
             Clock=>CLK,
             Reset=>RESET,
             Q    =>sig_B,
             QN   =>sig_Bn);
    
    And_1<=sig_A  and sig_Bn and X;
    And_2<=not(X) and sig_B;
    Or_1 <=And_1  or  And_2;
    
    Q    <=sig_A and sig_B and X;    
    
end Behavioral;