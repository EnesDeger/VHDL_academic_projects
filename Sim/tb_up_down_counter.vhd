library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_up_down_counter is
end tb_up_down_counter;

architecture Behavioral of tb_up_down_counter is
    
    component Up_Down_Counter_D is
        Port (CLOCK : in std_logic;
              RESET : in std_logic;
              Up    : in std_logic;
              Down  : in std_logic;
              A     :out std_logic_vector (3 downto 0));
    end component;
    
    signal CLOCK : std_logic:='0';
    signal RESET : std_logic:='0';
    signal Up    : std_logic:='0';
    signal Down  : std_logic:='0';
    signal A     : std_logic_vector (3 downto 0);
    
    constant time_constant:time:= 10 ns;
    
begin
    
    
    DUT: Up_Down_Counter_D
    port map(CLOCK =>CLOCK,
             RESET =>RESET,
             Up    =>Up   ,
             Down  =>Down ,
             A     =>A    );
    
    
    clock_process: process
    begin
        CLOCK<='0';
        wait for time_constant/2;
        CLOCK<='1';
        wait for time_constant/2;
    end process clock_process;
    
    count_process: process
    begin
        RESET<='1';
        wait for 100 ns;
        RESET<='0';

        wait for time_constant;
        
        Up  <='1';
        Down<='0';
        --0001
        wait for time_constant;
        
        
        Up  <='0';
        Down<='1';
        --0000
        wait for time_constant;
        
        
        Up  <='0';
        Down<='1';
        --1111
        wait for time_constant;
        
        
        Up  <='0';
        Down<='0';
        --1111
        wait for time_constant;
        
        
        Up  <='0';
        Down<='1';
        --1110
        wait for time_constant;
        
        Up  <='0';
        Down<='1';
        --1101
        wait;
        
    end process count_process;
    
end Behavioral;