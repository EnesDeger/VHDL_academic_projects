library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_full_adder is
end tb_full_adder;

architecture Behavioral of tb_full_adder is
    
    component full_adder is
        Port (A,B,C_in   : in  std_logic ;
              S_out,C_out: out std_logic);
    end component;
    
    signal s_A    : std_logic := '0';
    signal s_B    : std_logic := '0';
    signal s_C_in : std_logic := '0';
    signal s_S_out: std_logic;
    signal s_C_out: std_logic;
    constant time_constant : time := 10 ns;

begin
    DUT: full_adder
    port map(A     => s_A,
             B     => s_B,
             C_in  => s_C_in,
             S_out => s_S_out,
             C_out => s_C_out);
             
   full_adder_process: process
   begin
        s_A   <= '0';
        s_B   <= '0';
        s_C_in<= '0';
        wait for time_constant;
        
        s_A   <= '0';
        s_B   <= '0';
        s_C_in<= '1';
        wait for time_constant;
        
        s_A   <= '0';
        s_B   <= '1';
        s_C_in<= '0';
        wait for time_constant;
        
        s_A   <= '0';
        s_B   <= '1';
        s_C_in<= '1';
        wait for time_constant;
        
        s_A   <= '1';
        s_B   <= '0';
        s_C_in<= '0';
        wait for time_constant;
        
        s_A   <= '1';
        s_B   <= '0';
        s_C_in<= '1';
        wait for time_constant;
        
        s_A   <= '1';
        s_B   <= '1';
        s_C_in<= '0';
        wait for time_constant;
        
        s_A   <= '1';
        s_B   <= '1';
        s_C_in<= '1';
        wait;
        
   end process full_adder_process;
end Behavioral;
