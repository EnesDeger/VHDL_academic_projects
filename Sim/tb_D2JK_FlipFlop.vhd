library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_D2JK_FlipFlop is
end tb_D2JK_FlipFlop;

architecture Behavioral of tb_D2JK_FlipFlop is
    
    component D2JK_FlipFlop is
        Port (J, K, clock,reset: in  std_logic;
              Q,Qn             : out std_logic );
    end component;
    
    signal   J,K,clock,reset: std_logic:='0';
    signal   Q,Qn: std_logic; 
    constant time_delay: time:=10 ns;
begin
    
    DUT: D2JK_FlipFlop
    port map(J    =>J,
             K    =>K,    
             clock=>clock,
             reset=>reset,
             Q    =>Q,
             Qn   =>Qn);
    
    clock_processing: process
    begin
        clock<='0';
        wait for time_delay/2;
        clock<='1';
        wait for time_delay/2;
        
    end process clock_processing;
    
    design_process: process
    begin
        
        reset<='1';
        wait for 20 ns;
        reset<='0';
        
        J<='0';
        K<='0';
        wait for time_delay;
        
        J<='0';
        K<='1';
        wait for time_delay;
        
        J<='1';
        K<='0';
        wait for time_delay;
        
        J<='1';
        K<='1';
        wait;
        
    end process design_process;
    
    
end Behavioral;