library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_bcd2seven_segment_dec is
end tb_bcd2seven_segment_dec;

architecture Behavioral of tb_bcd2seven_segment_dec is
    
    component bcd2seven_segment_dec is
        Port (in_D,in_C,in_B,in_A :in  std_logic;
              a,b,c,d,e,f,g       :out std_logic ); 
    end component;

    signal in_D,in_C,in_B,in_A: std_logic:= '0';
    signal a,b,c,d,e,f,g       : std_logic;
    
    constant time_delay: time:= 10 ns;
    
begin
    
    DUT: bcd2seven_segment_dec
        port map(in_D=>in_D,
                 in_C=>in_C,
                 in_B=>in_B,
                 in_A=>in_A,
                 a=>a,
                 b=>b,
                 c=>c,
                 d=>d,
                 e=>e,
                 f=>f,
                 g=>g);
    
    
    seven_segment: process
    begin    
        wait for time_delay;
        
        in_D<='0';
        in_C<='0';
        in_B<='0';
        in_A<='1';
        wait for time_delay;
        
        in_D<='0';
        in_C<='0';
        in_B<='1';
        in_A<='0';
        wait for time_delay;
        
        in_D<='0';
        in_C<='1';
        in_B<='0';
        in_A<='1';
        wait for time_delay;
        
        in_D<='1';
        in_C<='0';
        in_B<='0';
        in_A<='1';
        wait for time_delay;
        
        in_D<='1';
        in_C<='0';
        in_B<='1';
        in_A<='1';
        wait for time_delay;
        
        in_D<='1';
        in_C<='1';
        in_B<='1';
        in_A<='1';
        wait;
        
    end process seven_segment;
    
end Behavioral;
