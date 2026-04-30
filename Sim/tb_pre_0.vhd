library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_pre_0 is
end tb_pre_0;

architecture sim of tb_pre_0 is
    
    component pre_0 is
    port(A, B, C: in  std_logic;
          Z     : out std_logic
           );
    end component;
    
    signal s_A: std_logic := '0';
    signal s_B: std_logic := '0';
    signal s_C: std_logic := '0';
    signal s_Z: std_logic;
    constant Clock_Period : time := 10 ns;
begin

    DUT: pre_0
    Port map(
    A => s_A,
    B => s_B,
    C => s_C,
    Z => s_Z);
    
    sim_process : process
    begin
        
        s_A <= '0';
        s_B <= '0';
        s_C <= '0';
        wait for Clock_period;
        
        s_C <= '1';
        wait for Clock_period;
        
        s_B <= '1';
        s_C <= '0';
        wait for Clock_period;
        
        s_C <= '1';
        wait for Clock_period;
        
        s_A <= '1';
        s_B <= '0';
        s_C <= '0';
        wait for Clock_period;
        
        s_C <= '1';
        wait for Clock_period;
        
        s_B <= '1';
        s_C <= '0';
        wait for Clock_period;
        
        s_C <= '1';
        wait;
        
    end process sim_process;
end sim;
