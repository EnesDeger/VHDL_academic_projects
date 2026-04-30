library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_half_adder is
end tb_half_adder;

architecture Behavioral of tb_half_adder is

    component half_adder is
        port(x,y: in std_logic;
             c,s: out std_logic);  
    end component;

    signal s_x: std_logic := '0';
    signal s_y: std_logic := '0';
    signal s_c: std_logic;
    signal s_s: std_logic;
    constant time_constant : time := 10 ns;
    
begin
    Dut:half_adder
    port map(x=>s_x,
             y=>s_y,
             S=>s_S,
             c=>s_c);
    
    half_adder_process : process
    begin
        
        s_x <= '0';
        s_y <= '0';
        wait for time_constant;
        
        s_x <= '0';
        s_y <= '1';
        wait for time_constant;
        
        s_x <= '1';
        s_y <= '0';
        wait for time_constant;
        
        s_x <= '1';
        s_y <= '1';
        wait;
    end process half_adder_process;
end Behavioral;
