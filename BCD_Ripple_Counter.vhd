library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_Ripple_Counter is
    Port (Count: in std_logic;
          reset: in std_logic;
          Q    :out std_logic_vector (3 downto 0));
end BCD_Ripple_Counter;

architecture Behavioral of BCD_Ripple_Counter is
    
    component JKFlipFlop is
        Port ( J     : in  STD_LOGIC;
               K     : in  STD_LOGIC;
               Reset : in  STD_LOGIC;
               Clock : in  STD_LOGIC;
               Q     : out STD_LOGIC;
               Qn    : out STD_LOGIC); 
    end component;
    
    signal outs    :std_logic_vector (3 downto 0);
    signal and_out :std_logic;
    signal last_out:std_logic;
    
    
begin
    
    JK_Flip_Flop_0: JKFlipFlop
    port map(J     =>'1',
             K     =>'1',
             Reset =>reset,
             Clock =>count,
             Q     =>outs(0),
             Qn    =>open);
    
    JK_Flip_Flop_1: JKFlipFlop
    port map(J     =>last_out,
             K     =>'1',
             Reset =>reset,
             Clock =>outs(0),
             Q     =>outs(1),
             Qn    =>open);
    
    JK_Flip_Flop_2: JKFlipFlop
    port map(J     =>'1',
             K     =>'1',
             Reset =>reset,
             Clock =>outs(1),
             Q     =>outs(2),
             Qn    =>open);
    
    JK_Flip_Flop_3: JKFlipFlop
    port map(J     =>and_out,
             K     =>'1',
             Reset =>reset,
             Clock =>outs(0),
             Q     =>outs(3),
             Qn    =>last_out);
    
    and_out<=outs(2) and outs(1);
    
    Q<=outs;
    
end Behavioral;
