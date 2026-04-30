library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_pre4_3 is
end tb_pre4_3;

architecture Behavioral of tb_pre4_3 is
    
    component pre4_3 is
        Port (data, parityin       : in  std_logic ;
              reset, clock         : in  std_logic ;
              parityout, paritychk : out std_logic);
    end component;
    
    signal data, parityin, clock, reset: std_logic :='0';
    signal parityout, paritychk        : std_logic;
    
    constant time_delay : time :=10 ns;
    
begin
    
    DUT: pre4_3
    port map(data     =>data,     
             parityin =>parityin,      
             reset    =>reset ,
             clock    =>clock,   
             parityout=>parityout,
             paritychk=>paritychk);
    
    clock_process : process
    begin
        clock <= '0';
        wait for time_delay/2;
        clock <= '1';
        wait for time_delay/2;
    end process clock_process;
    
    parity: process
    begin
        reset<='1';
        wait for 20 ns;
        reset<='0';
        
        -- 111111111111
        wait for time_delay;
        parityin <='0';
        data<='1';
        wait for time_delay;
        data<='1';
        wait for time_delay;
        data<='1';
        wait for time_delay;
        data<='1';
        wait for time_delay;
        data<='1';
        wait for time_delay;
        data<='1';
        wait for time_delay;
        data<='1';
        wait for time_delay;
        data<='1';
        wait for time_delay;
        data<='1';
        wait for time_delay;
        data<='1';
        wait for time_delay;
        data<='1';
        wait for time_delay;
        data<='1';
        wait;
        
    end process parity;
    
end Behavioral;
