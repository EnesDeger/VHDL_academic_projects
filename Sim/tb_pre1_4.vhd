library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_pre1_4 is
end tb_pre1_4;

architecture Behavioral of tb_pre1_4 is
    component pre1_4 is
        port(x,y,z: in  std_logic;
             A,B,C: out std_logic);
    end component;
    
    signal s_x: std_logic := '0';
    signal s_y: std_logic := '0';
    signal s_z: std_logic := '0';
    signal s_A: std_logic;
    signal s_B: std_logic;
    signal s_C: std_logic;
    constant Time_constant: time := 10 ns;
begin
    UUT: pre1_4
    port map(x=>s_x,
             y=>s_y,
             z=>s_z,
             A=>s_A,
             B=>s_B,
             C=>s_C);
    UUT_process: process
    begin
        
        s_x <= '0';
        s_y <= '0';
        s_z <= '0';
        wait for time_constant;
        
        s_x <= '0';
        s_y <= '0';
        s_z <= '1';
        wait for time_constant;
        
        s_x <= '1';
        s_y <= '1';
        s_z <= '0';
        wait for time_constant;
        
        s_x <= '1';
        s_y <= '1';
        s_z <= '1';
        wait;
        
    end process UUT_process;
    
end Behavioral;
