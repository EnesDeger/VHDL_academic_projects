library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Binary_Cell is
end tb_Binary_Cell;

architecture Behavioral of tb_Binary_Cell is
    
    component Binary_Cell is
        Port (Input     : in std_logic;
              Slct      : in std_logic;
              Read_Write: in std_logic;
              Output    :out std_logic);
    end component;
    
    signal Input     :  std_logic:='0';
    signal Slct      :  std_logic:='0';
    signal Read_Write:  std_logic:='0';
    signal Output    :  std_logic;
    constant time_delay: time:= 10 ns;
    
begin
    
    DUT: Binary_Cell
    port map(Input     =>Input     ,
             Slct      =>Slct      ,
             Read_Write=>Read_Write,
             Output    =>Output    );
    
    Cell: process
    begin
        wait for 20 ns;
        
        Input      <='0';
        Slct       <='1';
        Read_Write <='0';
        wait for time_delay;
        
        Input      <='1';
        Slct       <='0';
        Read_Write <='0';
        wait for time_delay;
        
        Input      <='1';
        Slct       <='1';
        Read_Write <='1';
        wait for time_delay;
        
        Input      <='1';
        Slct       <='1';
        Read_Write <='0';
        wait for time_delay;
        
        Input      <='1';
        Slct       <='1';
        Read_Write <='1';
        wait for time_delay;
        
        Input      <='0';
        Slct       <='0';
        Read_Write <='0';
        wait for time_delay;
        
        Input      <='1';
        Slct       <='1';
        Read_Write <='1';
        wait;
     end process Cell;
end Behavioral;
