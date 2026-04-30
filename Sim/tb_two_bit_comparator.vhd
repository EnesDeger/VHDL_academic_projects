library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_two_bit_comparator is
end tb_two_bit_comparator;

architecture Behavioral of tb_two_bit_comparator is
    
    component two_bit_comparator is
        Port (A, B : in std_logic_vector (1 downto 0);
              G,E,L: out std_logic);
    end component;
    
    signal A, B : std_logic_vector (1 downto 0):= (others => '0');
    signal G,E,L: std_logic;
    
    constant time_delay: time:= 10 ns;
    
begin
    
    DUT: two_bit_comparator
    port map(A=>A,
             B=>B,
             G=>G,
             E=>E,
             L=>L);
    
    comparator: process
    begin
        
        wait for time_delay;
        
        A <= "00";
        B <= "01";
        wait for time_delay;
        
        A <= "01";
        B <= "01";
        wait for time_delay;
        
        A <= "11";
        B <= "01";
        wait;
        
    end process comparator;
    
end Behavioral;
