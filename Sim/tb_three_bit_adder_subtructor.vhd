library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_three_bit_adder_subtructor is
end tb_three_bit_adder_subtructor;

architecture Behavioral of tb_three_bit_adder_subtructor is

    component three_bit_adder_subtractor is
        Port (slct_bit: in  std_logic;
              A, B    : in  std_logic_vector (2 downto 0);
              S       : out std_logic_vector (2 downto 0);
              V,C_last: out std_logic);
    end component;
    
    signal s_slct_bit:std_logic :='0';
    signal s_A, S_B  : std_logic_vector (2 downto 0) := (others => '0');
    
    signal s_S       : std_logic_vector (2 downto 0);
    signal s_V,s_C_last:std_logic :='0';

    constant time_delay: time := 10 ns;
begin
    
    DUT: three_bit_adder_subtractor
    port map(slct_bit =>s_slct_bit,
             A        =>S_A,
             B        =>S_B,
             S        =>S_S,
             V        =>S_V,
             C_last   =>S_C_last
    );
    
    
    three_bit_process : process
    begin
        wait for 100 ns;
        
        s_A<= "001";
        s_B<= "001";
        s_slct_bit<= '0';
        
        wait for time_delay;
        
        s_A<= "011";
        s_B<= "101";
        s_slct_bit<= '0';
        
        wait for time_delay;
        
        s_A<= "111";
        s_B<= "111";
        s_slct_bit<= '0';
        
        wait for time_delay;
        
        s_A<= "101";
        s_B<= "101";
        s_slct_bit<= '1';
        
        wait for time_delay;
        
        s_A<= "110";
        s_B<= "011";
        s_slct_bit<= '1';
        
        wait for time_delay;

        s_A<= "001";
        s_B<= "011";
        s_slct_bit<= '1';
        
        wait;
        
    end process three_bit_process;
end Behavioral;
