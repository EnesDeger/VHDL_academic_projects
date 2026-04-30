library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Johnson_counter is
end tb_Johnson_counter;

architecture Behavioral of tb_Johnson_counter is
     component Johnson_Counter_T is
        Port (Clock: in std_logic; 
              Reset: in std_logic; 
              A    :out std_logic; 
              B    :out std_logic; 
              C    :out std_logic; 
              D    :out std_logic);
     end component;
     
     signal Clock: std_logic:='0';
     signal Reset: std_logic:='0';
     signal A    : std_logic;
     signal B    : std_logic;
     signal C    : std_logic;
     signal D    : std_logic;
     constant time_constant:time:= 10 ns;

     
begin
    
    DUT: Johnson_Counter_T
    port map(Clock=>Clock,
             Reset=>Reset,
             A    =>A    ,
             B    =>B    ,
             C    =>C    ,
             D    =>D);
    
    clock_process: process
    begin
        Clock<='0';
        wait for time_constant/2;
        Clock<='1';
        wait for time_constant/2;
    end process clock_process;
    
    
    counter_process: process
    begin
        Reset<='1';
        wait for 100 ns;
        Reset<='0';
    
    wait;
    end process counter_process;
    
end Behavioral;