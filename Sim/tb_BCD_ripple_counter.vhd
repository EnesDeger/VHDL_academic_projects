library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_BCD_ripple_counter is
end tb_BCD_ripple_counter;

architecture Behavioral of tb_BCD_ripple_counter is
    
    component BCD_Ripple_Counter is
        Port ( Count : in std_logic;
               reset : in std_logic;
               Q     : out std_logic_vector (3 downto 0));
    end component;
    
    signal Count : std_logic := '0'; -- Bu sinyal Clock görevi görecek
    signal reset : std_logic := '0';
    signal Q     : std_logic_vector (3 downto 0);
    
    constant time_constant : time := 10 ns;

begin
    
    DUT: BCD_Ripple_Counter
    port map(Count => Count, 
             reset => reset,
             Q     => Q);
    
    
    count_gen_process: process
    begin
        Count <= '0';
        wait for time_constant/2;
        Count <= '1';
        wait for time_constant/2;
    end process;
    
    count_process: process
    begin
        reset <= '1';
        wait for 100 ns; 
        
        reset <= '0';
        
        
        wait; 
    end process;
    
end Behavioral;
