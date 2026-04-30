library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

entity Uni_shift_register_T is

    Port (CLK     : in  std_logic;
          reset_it: in  std_logic;
          MSB_in  : in  std_logic;                     --for serial inputs
          LSB_in  : in  std_logic;                     --for serial inputs
          Slct    : in  std_logic_vector(1 downto 0); 
          I_par   : in  std_logic_vector(3 downto 0);  --for parallel inputs
          A       : out std_logic_vector(3 downto 0)); --for parallel outputs
end Uni_shift_register_T;


architecture Behavioral of Uni_shift_register_T is

    component Four2One_MUX is

        Port (I :in  std_logic_vector (3 downto 0);
              S :in  std_logic_vector(1 downto 0);
              y :out std_logic );
    end component;

    component TFlipFlop is

        Port ( T    : in  STD_LOGIC;
               Reset: in  STD_LOGIC;
               Clock: in  STD_LOGIC;
               Q    : out STD_LOGIC;
               Qn   : out STD_LOGIC);
    end component;

    Signal Mux_out: std_logic_vector (3 downto 0);
    Signal T_in   : std_logic_vector (3 downto 0);
    Signal A_out  : std_logic_vector (3 downto 0);

begin

    MUX_0 : Four2One_MUX
    port map(I(0)=> A_out(0),
             I(1)=> A_out(1),
             I(2)=> LSB_in,
             I(3)=> I_par(0),
             S   =>Slct,
             y   =>Mux_out(0));

    MUX_1 : Four2One_MUX
    port map(I(0)=> A_out(1),
             I(1)=> A_out(2),
             I(2)=> A_out(0),
             I(3)=> I_par(1),
             S   =>Slct,
             y   =>Mux_out(1));    

    MUX_2 : Four2One_MUX
    port map(I(0)=> A_out(2),
             I(1)=> A_out(3),
             I(2)=> A_out(1),
             I(3)=> I_par(2),
             S   =>Slct,
             y   =>Mux_out(2));

    MUX_3 : Four2One_MUX
    port map(I(0)=> A_out(3),
             I(1)=> MSB_in,
             I(2)=> A_out(2),
             I(3)=> I_par(3),
             S   =>Slct,
             y   =>Mux_out(3));

    T_0: TFlipFlop
    port map (T   =>T_in(0),
             Reset=>reset_it,
             Clock=>CLK,
             Q    =>A_out(0),
             Qn   =>open);

    T_1: TFlipFlop
    port map (T   =>T_in(1),
             Reset=>reset_it,
             Clock=>CLK,
             Q    =>A_out(1),
             Qn   =>open);
    
    T_2: TFlipFlop
    port map (T   =>T_in(2),
             Reset=>reset_it,
             Clock=>CLK,
             Q    =>A_out(2),
             Qn   =>open);

    T_3: TFlipFlop
    port map (T   =>T_in(3),
             Reset=>reset_it,
             Clock=>CLK,
             Q    =>A_out(3),
             Qn   =>open);

    T_in<=A_out xor Mux_out;  --all vectors has equal length
    A   <=A_out;              --outputs

end Behavioral;