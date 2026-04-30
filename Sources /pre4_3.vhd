library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pre4_3 is
    Port (data, parityin       : in  std_logic ;
          reset, clock         : in  std_logic ;
          parityout, paritychk : out std_logic);
end pre4_3;

architecture Behavioral of pre4_3 is
    
    component DFlipFlop is
        Port ( D     : in  STD_LOGIC;
               Reset : in  STD_LOGIC;
               Clock : in  STD_LOGIC;
               Q     : out STD_LOGIC;
               Qn    : out STD_LOGIC);
    end component;
    
    signal p_out,xor_out: std_logic ;
    
begin
    
    Dflip: DFlipFlop
    port map(D    =>xor_out,
             Reset=>reset,
             Clock=>clock,
             Q    =>p_out,
             Qn   =>open);
    
    xor_out<=p_out xor data;
    
    parityout<=p_out;
    
    paritychk<=parityin xnor p_out;
    
end Behavioral;
