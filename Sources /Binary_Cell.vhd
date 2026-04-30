library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Binary_Cell is
    Port (Input     : in std_logic;
          Slct      : in std_logic;
          Read_Write: in std_logic;
          Output    :out std_logic);
end Binary_Cell;

architecture Behavioral of Binary_Cell is
    
    component S_R_Latch is
        Port (S : in  std_logic;
              R : in  std_logic;
              En: in  std_logic;
              Q : out std_logic;
              Qn: out std_logic);
    end component;
    
    signal And_outs : std_logic_vector(2 downto 0);
    signal latch_out: std_logic ;
    
begin
    
    Latch: S_R_Latch
    port map(S =>And_outs(0),
             R =>And_outs(1),
             En=>Slct,
             Q =>latch_out,
             Qn=>open);
    
    And_outs(0)<=Slct and not (Read_Write) and Input;
    And_outs(1)<=Slct and not (Read_Write) and not Input;
    And_outs(2)<=Slct and       Read_Write and latch_out;
    Output<=And_outs(2);
    
end Behavioral;
