library IEEE;

use IEEE.STD_LOGIC_1164.ALL;



entity tb_Uni_shift_register_T is
end tb_Uni_shift_register_T;



architecture Behavioral of tb_Uni_shift_register_T is

    
    component Uni_shift_register_T is
        Port (CLK         : in  std_logic;
              reset_it    : in  std_logic;
              MSB_in      : in  std_logic;
              LSB_in      : in  std_logic;
              Slct        : in  std_logic_vector(1 downto 0);
              I_par       : in  std_logic_vector(3 downto 0);
              A           : out std_logic_vector(3 downto 0));  

    end component;

    signal   CLK         :  std_logic :='0';
    signal   reset_it     :  std_logic:='0';
    signal   MSB_in      :  std_logic:='0';
    signal   LSB_in      :  std_logic:='0';
    signal   Slct        :  std_logic_vector(1 downto 0):="00";
    signal   I_par       :  std_logic_vector(3 downto 0):="0000";
    signal   A           :  std_logic_vector(3 downto 0); 

    constant time_constant:time:= 10 ns;

    

begin

    

    DUT: Uni_shift_register_T
    port map(CLK     => CLK,
             reset_it=> reset_it,
             MSB_in  => MSB_in,
             LSB_in  => LSB_in,
             Slct    => Slct,   
             I_par   => I_par,    
             A       => A);        

    

    clock_process: process
    begin
        CLK<='0';
        wait for time_constant/2;
        CLK<='1';
        wait for time_constant/2;
    end process clock_process;

    shift_process: process
    begin
        reset_it<='1';
        wait for 100 ns;
        reset_it<='0';

        wait for time_constant;
        
        I_par<="1100";
        Slct <="11";
        --prallel load
        --waited output is 1100
      
        wait for time_constant;
        MSB_in<='1';
        Slct <="01";
        --shift right
        --waited output is 1110
        
        wait for time_constant;
        LSB_in<='1';
        Slct <="10";
        --shift left
        --waited output is 1101
        
        wait for time_constant;
        Slct <="00";
        --no change
        
        wait for time_constant;
        I_par<="0011";
        Slct <="11";
        --paralel load
        --waited output is 0011
        wait;
       
    end process shift_process;
    
end Behavioral;