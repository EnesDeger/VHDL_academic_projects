library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Four_bit_cell_register is
    Port (Input     : in std_logic_vector(3 downto 0);
          Slct      : in std_logic;
          Read_Write: in std_logic;
          Output    :out std_logic_vector(3 downto 0));
end Four_bit_cell_register;

architecture Behavioral of Four_bit_cell_register is
    
    component Binary_Cell is
        Port (Input     : in std_logic;
              Slct      : in std_logic;
              Read_Write: in std_logic;
              Output    :out std_logic);
    end component;
    
begin
    
    BC_0:Binary_Cell
    port map(Input     =>Input(0),
             Slct      =>Slct,
             Read_Write=>Read_Write,
             Output    =>Output(0));
    
    BC_1:Binary_Cell
    port map(Input     =>Input(1),
             Slct      =>Slct,
             Read_Write=>Read_Write,
             Output    =>Output(1));
    
    BC_2:Binary_Cell
    port map(Input     =>Input(2),
             Slct      =>Slct,
             Read_Write=>Read_Write,
             Output    =>Output(2));
    
    BC_3:Binary_Cell
    port map(Input     =>Input(3),
             Slct      =>Slct,
             Read_Write=>Read_Write,
             Output    =>Output(3));
    
end Behavioral;
