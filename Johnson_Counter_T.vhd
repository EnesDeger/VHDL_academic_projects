library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Johnson_Counter_T is
    Port (Clock: in std_logic;
          Reset: in std_logic;
          A    :out std_logic; --We want to see singular outputs
          B    :out std_logic; --for this type of counter
          C    :out std_logic; --so, I didn't use vectorel outs
          D    :out std_logic);
end Johnson_Counter_T;

architecture Behavioral of Johnson_Counter_T is
    
    component TFlipFlop is
        Port ( T     : in  STD_LOGIC;
               Reset : in  STD_LOGIC;
               Clock : in  STD_LOGIC;
               Q     : out STD_LOGIC;
               Qn    : out STD_LOGIC);
    end component;
    
    signal outs   : std_logic_vector (4 downto 0); -- forth one is complemented out of last flip flop
    signal xors   : std_logic_vector (3 downto 0); --to make T to D flip flops
    
begin
    
    
    T_Flip_Flop_0: TFlipFlop
    port map(T    =>xors(0),
             Reset=>Reset,
             Clock=>Clock,
             Q    =>outs(0),
             Qn   =>open);
    
    T_Flip_Flop_1: TFlipFlop
    port map(T    =>xors(1),
             Reset=>Reset,
             Clock=>Clock,
             Q    =>outs(1),
             Qn   =>open);
    
    T_Flip_Flop_2: TFlipFlop
    port map(T    =>xors(2),
             Reset=>Reset,
             Clock=>Clock,
             Q    =>outs(2),
             Qn   =>open);
    
    T_Flip_Flop_3: TFlipFlop
    port map(T    =>xors(3),
             Reset=>Reset,
             Clock=>Clock,
             Q    =>outs(3),
             Qn   =>outs(4));
    
    A<=outs(0);
    B<=outs(1);
    C<=outs(2);
    D<=outs(3);
    
    xors(0)<=outs(0) xor outs(4);
    xors(1)<=outs(0) xor outs(1);
    xors(2)<=outs(1) xor outs(2);
    xors(3)<=outs(2) xor outs(3);
    
end Behavioral;
