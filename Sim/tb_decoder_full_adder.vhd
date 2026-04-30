library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_decoder_full_adder is
end tb_decoder_full_adder;

architecture Behavioral of tb_decoder_full_adder is
    
    component decoder_full_adder is
        Port (in_1, in_2, C_in: in  std_logic ;
             C_out, S_out     : out std_logic  );
    end component;
    
    signal s_in_1, s_in_2, s_C_in : std_logic :='0';
    signal s_C_out, s_S_out       : std_logic ;
    
    constant time_delay: time := 10 ns;
begin
    
    DUT: decoder_full_adder
    
    port map (in_1=>S_in_1,
              in_2=>s_in_2,
              C_in=>s_C_in,
              C_out=>s_C_out,
              S_out=>s_S_out);
    
    decoder: process
    begin
    
    wait for time_delay;
    
    
    s_in_1 <= '0';
    s_in_2 <= '1';
    s_C_in <= '0';
    wait for time_delay;
    
    s_in_1 <= '0';
    s_in_2 <= '1';
    s_C_in <= '1';
    wait for time_delay;
    
    s_in_1 <= '1';
    s_in_2 <= '1';
    s_C_in <= '0';
    wait for time_delay;
    
    s_in_1 <= '1';
    s_in_2 <= '1';
    s_C_in <= '1';
    wait;
    
    
    
    end process decoder;
    
    
end Behavioral;
