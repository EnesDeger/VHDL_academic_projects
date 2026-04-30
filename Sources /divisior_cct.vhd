library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisior_cct is
    Port (initial:in  std_logic;
          Clock  :in  std_logic;
          Reset  :in  std_logic;
              A  :in  std_logic_vector (2 downto 0);
              B  :in  std_logic_vector (2 downto 0);
              Q  :out std_logic_vector (2 downto 0);
              R  :out std_logic_vector (2 downto 0)
              );
end divisior_cct;

architecture Behavioral of divisior_cct is
    
    component Comparator_4Bit is
        Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
               B : in  STD_LOGIC_VECTOR (3 downto 0);
               AGreatEqualB : out  STD_LOGIC); --we do not use the "less than" situation
    end component;
    
    component four_bit_adder_subtractor is
        Port (slct_bit: in  std_logic;
              A       : in  std_logic_vector (3 downto 0);
              B       : in  std_logic_vector (3 downto 0);
              S       : out std_logic_vector (3 downto 0);
              V       : out std_logic;
              C_last  : out std_logic);
    end component;
    
    component Up_Down_Counter_D is
        Port (CLOCK : in std_logic;
              RESET : in std_logic;
              Up    : in std_logic;
              Down  : in std_logic;
              A     :out std_logic_vector (3 downto 0));
    end component;
    
    component four_bit_register is
        Port ( CLK   : in  std_logic;
               RST   : in  std_logic;
               LOAD  : in  std_logic;
               D     : in  std_logic_vector (3 downto 0);
               Q     : out std_logic_vector (3 downto 0));
    end component;
    
    component two2one_MUX is
        Port ( I0  : in  std_logic_vector (3 downto 0);
               I1  : in  std_logic_vector (3 downto 0);
               Sel : in  std_logic;
               Y   : out std_logic_vector (3 downto 0));
    end component;
    
    signal reset_count :std_logic;
    signal out_compar  :std_logic;
    signal count_it    :std_logic; 
    signal s_load      :std_logic;
    signal out_up_down :std_logic_vector(3 downto 0); --this is also equal to Q
    signal out_subtruct:std_logic_vector(3 downto 0);
    signal MUX_out     :std_logic_vector(3 downto 0);
    signal A_extended  :std_logic_vector(3 downto 0); --We have 3 bit inputs but 4 bit components
    signal B_extended  :std_logic_vector(3 downto 0); --so, inputs are going to extended
    signal R_extended  :std_logic_vector(3 downto 0); --and also outputs
    
    
    
begin
    
    Comparator: Comparator_4bit
    port map(A           =>R_extended,
             B           =>B_extended,
             AGreatEqualB=>out_compar);
    
    Counter:Up_Down_Counter_D
    port map(CLOCK =>Clock,
             RESET =>Reset_count,
             Up    =>count_it,
             Down  =>'0',
             A     =>out_up_down);
    
    bit_Register:four_bit_register
    port map(CLK =>Clock,
             RST =>Reset,
             LOAD=>s_load,
             D   =>MUX_out,
             Q   =>R_extended);
    
    subtruct:four_bit_adder_subtractor
    port map(slct_bit=>'1',
             A       =>R_extended,
             B       =>B_extended,
             S       =>out_subtruct,
             V       =>open,
             C_last  =>open);
    
    MUX_0:two2one_MUX
    port map(I0 =>out_subtruct,
             I1 =>A_extended,
             Sel=>initial,
             Y  =>MUX_out);
    
    reset_count<=reset or initial;
    count_it   <=not (initial) and out_compar;
    s_load     <=initial or out_compar;
    A_extended <= '0' & A;
    B_extended <= '0' & B;
    R          <= R_extended (2 downto 0);
    Q          <= out_up_down(2 downto 0);
    
    
end Behavioral;
