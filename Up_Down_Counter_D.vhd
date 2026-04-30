library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Up_Down_Counter_D is
    Port (CLOCK : in std_logic;
          RESET : in std_logic;
          Up    : in std_logic;
          Down  : in std_logic;
          A     :out std_logic_vector (3 downto 0));
end Up_Down_Counter_D;

architecture Behavioral of Up_Down_Counter_D is
    
    component DFlipFlop is
        Port ( D     : in  STD_LOGIC;
               Reset : in  STD_LOGIC;
               Clock : in  STD_LOGIC;
               Q     : out STD_LOGIC;
               Qn    : out STD_LOGIC); 
    end component;
    
    signal S      : std_logic_vector (5 downto 0);
    signal A_out  : std_logic_vector (3 downto 0);
    signal A_n_out: std_logic_vector (2 downto 0); --last Qn doesn't used
    signal xors   : std_logic_vector (3 downto 0);
    signal ors    : std_logic_vector (3 downto 0);
    
begin
    
    
    D_flipflop_0: DFLipFlop
    port map(D    => xors(0),
             Reset=> Reset,
             Clock=> CLOCK,
             Q    => A_out(0),
             Qn   => A_n_out(0));
    
    D_flipflop_1: DFLipFlop
    port map(D    => xors(1),
             Reset=> Reset,
             Clock=> CLOCK,
             Q    => A_out(1),
             Qn   => A_n_out(1));
    
    D_flipflop_2: DFLipFlop
    port map(D    => xors(2),
             Reset=> Reset,
             Clock=> CLOCK,
             Q    => A_out(2),
             Qn   => A_n_out(2));
    
    D_flipflop_3: DFLipFlop
    port map(D    => xors(3),
             Reset=> Reset,
             Clock=> CLOCK,
             Q    => A_out(3),
             Qn   => open);
    
    
    S(0)<=Up   and A_out(0);
    S(1)<=Down and A_n_out(0);
    S(2)<=S(0) and A_out(1);
    S(3)<=S(1) and A_n_out(1);
    S(4)<=S(2) and A_out(2);
    S(5)<=S(3) and A_n_out(2);
    
    
    
    xors  <=ors xor A_out;
    ors(0)<=UP or Down;
    ors(1)<=S(0) or S(1);
    ors(2)<=S(2) or S(3);
    ors(3)<=S(4) or S(5);
    
    A<=A_out;
    
end Behavioral;
