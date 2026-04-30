library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RAM_four_by_four is
    Port (Memory_enable : in std_logic;
          Read_Write    : in std_logic;
          Address_inputs: in std_logic_vector(1 downto 0);
          Input_data    : in std_logic_vector(3 downto 0);
          Output_data   :out std_logic_vector(3 downto 0));
end RAM_four_by_four;

architecture Behavioral of RAM_four_by_four is
    
    component two2four_dec_enabled is
        Port ( En   : in  STD_LOGIC;
               Inp  : in  STD_LOGIC_VECTOR (1 downto 0);
               Outp : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component Four_bit_cell_register is
        Port (Input     : in std_logic_vector(3 downto 0);
              Slct      : in std_logic;
              Read_Write: in std_logic;
              Output    :out std_logic_vector(3 downto 0));
    end component;
    
    
    signal Word: std_logic_vector (3 downto 0);
    signal outs_0,outs_1,outs_2,outs_3: std_logic_vector (3 downto 0);
    
begin
    
    Decoder: two2four_dec_enabled
    port map(En  =>Memory_enable,
             Inp =>Address_inputs,
             Outp=>Word);
    
    regist_0: Four_bit_cell_register
    port map(Input     =>Input_data,
             Slct      =>Word(0),
             Read_Write=>Read_Write,
             Output    =>Outs_0);
    
    regist_1: Four_bit_cell_register
    port map(Input     =>Input_data,
             Slct      =>Word(1),
             Read_Write=>Read_Write,
             Output    =>Outs_1);
    
    regist_2: Four_bit_cell_register
    port map(Input     =>Input_data,
             Slct      =>Word(2),
             Read_Write=>Read_Write,
             Output    =>Outs_2);
    
    regist_3: Four_bit_cell_register
    port map(Input     =>Input_data,
             Slct      =>Word(3),
             Read_Write=>Read_Write,
             Output    =>Outs_3);
    
    Output_data<=Outs_0 or Outs_1 or Outs_2 or Outs_3;
    
end Behavioral;
