library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_pre4_2 is
end tb_pre4_2;

architecture Behavioral of tb_pre4_2 is
    
    component pre4_2 is
        Port (X    : in std_logic;
              CLK  : in std_logic;
              RESET: in std_logic;
              Q    :out std_logic);
    end component;
    
    signal X, CLK, RESET: std_logic :='0';
    signal Q            : std_logic;
    constant time_delay : time :=10 ns;
    
begin
    
    DUT: pre4_2
        port map(X    =>X,
                 CLK  =>CLK,
                 RESET=>RESET,
                 Q    =>Q);
    
    clock_process : process
    begin
        CLK <= '0';
        wait for time_delay/2;  
        CLK <= '1';
        wait for time_delay/2;  
    end process clock_process;

    pre_sim : process
    begin
        
        RESET <= '1';
        X <= '0';
        wait for 20 ns; 
        RESET <= '0';
        
        wait for time_delay;
        X<='1';
        
        wait for time_delay;
        X<='0';
        
        wait for time_delay;
        X<='1';
        
        wait for time_delay;
        X<='1';
        
        wait for time_delay;
        X<='0';
        
        wait for time_delay;
        X<='1';
        
        wait for time_delay;
        X<='1';
        wait;
        
        
    end process pre_sim;
end Behavioral;
