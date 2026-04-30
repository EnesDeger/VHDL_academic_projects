library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity six_dec2bcd is
    Port (in_bin           : in  std_logic_vector (5 downto 0);
          bcd_tens,bcd_ones: out std_logic_vector (3 downto 0));
end six_dec2bcd;

architecture Behavioral of six_dec2bcd is
    
    component add_3 is
        Port (A: in  std_logic_vector (3 downto 0);
              Y: out std_logic_vector (3 downto 0));
    end component;
    
    signal s_1, s_2, s_3: std_logic_vector (3 downto 0);
    
begin
    
    module_1: add_3
        port map(A(3) => '0',
                 A(2) => in_bin(5),
                 A(1) => in_bin(4),
                 A(0) => in_bin(3),
                 Y=> s_1);
        
    module_2: add_3
        port map(A(3) => s_1(2),
                 A(2) => s_1(1),
                 A(1) => s_1(0),
                 A(0) => in_bin(2),
                 Y=> s_2);
        
    module_3: add_3
        port map(A(3) => s_2(2),
                 A(2) => s_2(1),
                 A(1) => s_2(0),
                 A(0) => in_bin(1),
                 Y=> s_3);
        
    bcd_tens(3)<='0';
    bcd_tens(2)<=s_1(3);
    bcd_tens(1)<=s_2(3);
    bcd_tens(0)<=s_3(3);
    
    bcd_ones(3)<=s_3(2);
    bcd_ones(2)<=s_3(1);
    bcd_ones(1)<=s_3(0);
    bcd_ones(0)<=in_bin(0);
    
end Behavioral;
