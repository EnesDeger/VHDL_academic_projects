library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_and_or_combination is
end tb_and_or_combination;


architecture Behavioral of tb_and_or_combination is

    component and_or_combination is
        port (in1, in2, in3 ,in4: in bit; out1: out bit);
    end component;
    
    signal s_in1 : bit := '0';
    signal s_in2 : bit := '0';
    signal s_in3 : bit := '0';    
    signal s_in4 : bit := '0';
    signal s_out1: bit;
    constant Clock_period : time := 10 ns;
    
begin

    UUT : and_or_combination
    port map(
        in1  => s_in1,
        in2  => s_in2,
        in3  => s_in3,
        in4  => s_in4,
        out1 => s_out1
    );

    time_lines : process
    begin
    
        s_in1 <= '0'; s_in2 <= '0'; s_in3 <= '0'; s_in4 <= '0';
        wait for  Clock_period;
        
        s_in1 <= '1'; s_in2 <= '1'; s_in3 <= '0'; s_in4 <= '0';
        wait for  Clock_period;

        s_in1 <= '1'; s_in2 <= '0'; s_in3 <= '1'; s_in4 <= '0';
        wait for  Clock_period;
        
        s_in1 <= '1'; s_in2 <= '1'; s_in3 <= '1'; s_in4 <= '1';
        wait for  Clock_period;
        
        wait;
    end process time_lines;
    
end Behavioral;
