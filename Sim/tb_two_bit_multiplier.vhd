library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_two_bit_multiplier is
end tb_two_bit_multiplier;

architecture Behavioral of tb_two_bit_multiplier is
    
    component two_bit_multiplier is
        Port (in_1,in_2:in  std_logic_vector (1 downto 0); 
              out_multi:out std_logic_vector (3 downto 0));
    end component;
    
    signal s_in_1, s_in_2  : std_logic_vector (1 downto 0) := (others => '0');
    signal s_out_multi   : std_logic_vector (3 downto 0);
    
    constant time_delay: time := 10 ns;

begin
    
    DUT: two_bit_multiplier
    port map(in_1 =>s_in_1,
             in_2 =>s_in_2,
             out_multi=>s_out_multi);
    
    multiplier: process
    begin
        
        wait for 100 ns;
        
        s_in_1<= "00";
        s_in_2<= "11";
        wait for time_delay;
        
        s_in_1<= "01";
        s_in_2<= "11";
        wait for time_delay;
        
        s_in_1<= "10";
        s_in_2<= "10";
        wait for time_delay;
        
        s_in_1<= "11";
        s_in_2<= "10";
        wait for time_delay;
        
        s_in_1<= "11";
        s_in_2<= "11";
        
        wait;
        
        
    end process multiplier;
    
    
end Behavioral;
