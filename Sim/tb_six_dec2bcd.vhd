library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_six_dec2bcd is
end tb_six_dec2bcd;

architecture Behavioral of tb_six_dec2bcd is
    
    component six_dec2bcd is
        Port (in_bin           : in  std_logic_vector (5 downto 0);
              bcd_tens,bcd_ones: out std_logic_vector (3 downto 0));
    end component;
    
    signal in_bin: std_logic_vector (5 downto 0):=  (others => '0');
    signal bcd_tens,bcd_ones: std_logic_vector (3 downto 0);
    
    constant time_delay: time :=10 ns;
    
begin
    
    DUT: six_dec2bcd
    port map(in_bin=>in_bin,
             bcd_tens=>bcd_tens,
             bcd_ones=>bcd_ones);
    
    dec2bcd: process
    begin
        
        wait for time_delay;
        
        in_bin<= "000011";
        wait for time_delay;
        
        in_bin<= "000111";
        wait for time_delay;
        
        in_bin<= "001011";
        wait for time_delay;
        
        in_bin<= "011100";
        wait for time_delay;
        
        in_bin<= "110011";
        wait for time_delay;
        
        in_bin<= "111111";
        wait;
        
        
    end process dec2bcd;
    
end Behavioral;