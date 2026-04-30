library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_RAM_four_by_four is
end tb_RAM_four_by_four;

architecture Behavioral of tb_RAM_four_by_four is

    component RAM_four_by_four
        Port ( Memory_enable : in std_logic;
               Read_Write    : in std_logic;
               Address_inputs: in std_logic_vector(1 downto 0);
               Input_data    : in std_logic_vector(3 downto 0);
               Output_data   : out std_logic_vector(3 downto 0));
    end component;

    signal Memory_enable : std_logic := '0';
    signal Read_Write    : std_logic := '0'; -- 0: Write, 1: Read
    signal Address_inputs: std_logic_vector(1 downto 0) := "00";
    signal Input_data    : std_logic_vector(3 downto 0) := "0000";
    signal Output_data   : std_logic_vector(3 downto 0);

    constant wait_time : time := 50 ns;

begin

    uut: RAM_four_by_four Port Map (
          Memory_enable => Memory_enable,
          Read_Write    => Read_Write,
          Address_inputs=> Address_inputs,
          Input_data    => Input_data,
          Output_data   => Output_data
        );

    RAM_process: process
    begin
        Memory_enable <= '1';
        wait for wait_time;

        
        
        Read_Write <= '0'; 
        
        Address_inputs <= "00";
        Input_data     <= "0001";
        wait for wait_time;

        Address_inputs <= "01";
        Input_data     <= "1001";
        wait for wait_time;

        Address_inputs <= "10";
        Input_data     <= "0000";
        wait for wait_time;

        Address_inputs <= "11";
        Input_data     <= "0010";
        wait for wait_time;

        
        Read_Write <= '1'; 
        Input_data <= "0000"; 
        
        Address_inputs <= "11"; 
        wait for wait_time;
        
        Address_inputs <= "10"; 
        wait for wait_time;
        
        Address_inputs <= "00"; 
        wait for wait_time;
        
        Address_inputs <= "01"; 
        wait for wait_time;

        Address_inputs <= "11"; 
        wait for wait_time;
        
        Address_inputs <= "10"; 
        wait for wait_time;
        
        Address_inputs <= "00"; 
        wait for wait_time;
        
        Address_inputs <= "01"; 
        wait for wait_time;
        
    end process;

end Behavioral;
