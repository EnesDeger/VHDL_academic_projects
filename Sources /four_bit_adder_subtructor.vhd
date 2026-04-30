library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bit_adder_subtractor is
    Port (slct_bit: in  std_logic;
              A       : in  std_logic_vector (3 downto 0);
              B       : in  std_logic_vector (3 downto 0);
              S       : out std_logic_vector (3 downto 0);
              V       : out std_logic;
              C_last  : out std_logic);
end four_bit_adder_subtractor;

architecture Behavioral of four_bit_adder_subtractor is
    
    component full_adder is
        Port (A,B,C_in    : in  std_logic ;
              S_out,C_out : out std_logic);
    end component;
    
    signal C    : std_logic_vector (4 downto 1);
    signal FA_B : std_logic_vector (3 downto 0);
    
begin
    
    FA_B(0) <= B(0) xor slct_bit;
    FA_B(1) <= B(1) xor slct_bit;
    FA_B(2) <= B(2) xor slct_bit;
    FA_B(3) <= B(3) xor slct_bit;
    
    FA_1: full_adder
        port map(A    => A(0),
                 B    => FA_B(0),
                 C_in => slct_bit,
                 S_out=> S(0),
                 C_out=> C(1));
    
    FA_2: full_adder
        port map(A    => A(1),
                 B    => FA_B(1),
                 C_in => C(1),
                 S_out=> S(1),
                 C_out=> C(2));
    
    FA_3: full_adder
        port map(A    => A(2),
                 B    => FA_B(2),
                 C_in => C(2),
                 S_out=> S(2),
                 C_out=> C(3));

    FA_4: full_adder
        port map(A    => A(3),
                 B    => FA_B(3),
                 C_in => C(3),
                 S_out=> S(3),
                 C_out=> C(4));
    
    V      <= C(3) xor C(4);
    C_last <= C(4);
        
end Behavioral;