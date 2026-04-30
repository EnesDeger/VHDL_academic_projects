library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_pre_1_3 is
end tb_pre_1_3;

architecture Behavioral of tb_pre_1_3 is
    
    component pre1_3 is
    port(a, b, c: in  std_logic;
            F   : out std_logic);
    end component;
    
    signal s_a: std_logic := '0';
    signal s_b: std_logic := '0';
    signal s_c: std_logic := '0';
    signal s_F: std_logic;
    constant Clock_Period : time := 10 ns;
    
begin
    
    DUT : pre1_3
    port map (a=>s_a,
              b=>s_b,
              c=>s_c,
              F=>s_F);
     
    pre_1_3_process: process
    begin
        
        s_A <= '0';
        s_B <= '0';
        s_C <= '0';
        wait for Clock_period;
        
        s_A <= '1';
        s_B <= '0';
        s_C <= '0';
        wait for Clock_period;
        
        s_A <= '1';
        s_B <= '1';
        s_C <= '0';
        wait for Clock_period;
        
        s_A <= '1';
        s_B <= '1';
        s_C <= '1';
        wait;
        
        
    end process pre_1_3_process;
    
    
end Behavioral;
