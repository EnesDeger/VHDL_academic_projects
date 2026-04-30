library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity full_adder is
    Port (A,B,C_in   : in  std_logic ;
          S_out,C_out: out std_logic);
end full_adder;

architecture Behavioral of full_adder is

    component half_adder is
        Port (x,y: in std_logic;
              C,S: out std_logic);
    end component;
    
    signal P_0 :std_logic;
    signal G_0 :std_logic;
    signal G_1 :std_logic;
    
begin
    ha_1: half_adder
    port map (x =>A,
              y =>B,
              S =>P_0,
              c =>G_0);
              
    ha_2: half_adder
    port map (x=>P_0,
              y=>c_in,
              S=>S_out,
              C=>G_1);
    
    C_out <= G_0 or G_1;
    
        
end Behavioral;
