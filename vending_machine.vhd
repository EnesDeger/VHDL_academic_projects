library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity vending_machine is
    Port (Reset: in std_logic;
          Clock: in std_logic;
          C    : in std_logic;
          W    : in std_logic;
          B    : in std_logic;
          CD   :out std_logic;
          WD   :out std_logic;
          BD   :out std_logic;
          Q_state : out std_logic_vector(2 downto 0));
end vending_machine;

architecture Behavioral of vending_machine is
    
    component JK_FlipFlop is
        Port ( J     : in  STD_LOGIC;
               K     : in  STD_LOGIC;
               Reset : in  STD_LOGIC;
               Clock : in  STD_LOGIC;
               Q     : out STD_LOGIC;
               Qn    : out STD_LOGIC);
    end component;
    
    signal Ands  : std_logic_vector (2 downto 0);
    signal Ors   : std_logic_vector (2 downto 0);
    signal Q_outs: std_logic_vector (2 downto 0);
    signal Qn_out: std_logic;
begin
    
    J_K_Flip_Flop_0: JK_FlipFlop
    port map(J    =>Ands(2),
             K    =>Ors(1),
             Reset=>Reset,
             Clock=>Clock,
             Q    =>Q_outs(0),
             Qn   =>open);
    
    J_K_Flip_Flop_1: JK_FlipFlop
    port map(J    =>Ands(1),
             K    =>Ors(0),
             Reset=>Reset,
             Clock=>Clock,
             Q    =>Q_outs(1),
             Qn   =>open);
    
    J_K_Flip_Flop_2: JK_FlipFlop
    port map(J    =>Ands(0),
             K    =>Ors(2),
             Reset=>Reset,
             Clock=>Clock,
             Q    =>Q_outs(2),
             Qn   =>Qn_out);
    
    Ands(0)<=C         and Q_outs(0) and Q_outs(1);
    Ands(1)<=C         and Q_outs(0);
    Ands(2)<=Qn_out    and C;
    Ors(0)  <= W or (C and Q_outs(0)) or (B and Q_outs(0));
    Ors(1) <= C or W or (B and Q_outs(1));
    Ors(2) <=W         or B;
    
    BD <= B and (Q_outs(2) or (Q_outs(1) and Q_outs(0)));
    
    WD <= W and (Q_outs(2) or Q_outs(1) or Q_outs(0));

    CD <= (Q_outs(2) and (W or B)) or (Q_outs(1) and W);
    
    Q_state<=Q_outs;
    
end Behavioral;