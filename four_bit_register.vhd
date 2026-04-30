library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bit_register is
    Port ( CLK   : in  std_logic;
           RST   : in  std_logic;
           LOAD  : in  std_logic;
           D     : in  std_logic_vector (3 downto 0);
           Q     : out std_logic_vector (3 downto 0));
end four_bit_register;

architecture Behavioral of four_bit_register is

    component DFlipFlop is
         Port ( D      : in  STD_LOGIC;
                Reset  : in  STD_LOGIC;
                Clock  : in  STD_LOGIC;
                Q      : out STD_LOGIC;
                Qn     : out STD_LOGIC); 
    end component;

    signal D_next : std_logic_vector(3 downto 0);
    signal Q_curr : std_logic_vector(3 downto 0);

begin

    D_next(0) <= (D(0) and LOAD) or (Q_curr(0) and not LOAD);
    D_next(1) <= (D(1) and LOAD) or (Q_curr(1) and not LOAD);
    D_next(2) <= (D(2) and LOAD) or (Q_curr(2) and not LOAD);
    D_next(3) <= (D(3) and LOAD) or (Q_curr(3) and not LOAD);

    FF_0: DFlipFlop
        port map(D     => D_next(0),
                 Reset => RST,
                 Clock => CLK,
                 Q     => Q_curr(0),
                 Qn    => open);

    FF_1: DFlipFlop
        port map(D     => D_next(1),
                 Reset => RST,
                 Clock => CLK,
                 Q     => Q_curr(1),
                 Qn    => open);

    FF_2: DFlipFlop
        port map(D     => D_next(2),
                 Reset => RST,
                 Clock => CLK,
                 Q     => Q_curr(2),
                 Qn    => open);

    FF_3: DFlipFlop
        port map(D     => D_next(3),
                 Reset => RST,
                 Clock => CLK,
                 Q     => Q_curr(3),
                 Qn    => open);

    Q <= Q_curr;

end Behavioral;