library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bit_comparator is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           AGreatEqualB : out  STD_LOGIC);
end four_bit_comparator;

architecture Behavioral of four_bit_comparator is

    signal E3, E2, E1, E0 : std_logic;
    signal G3, G2, G1, G0 : std_logic;
    signal A_gt_B : std_logic;
    signal A_eq_B : std_logic;

begin

    E3 <= A(3) xnor B(3);
    G3 <= A(3) and (not B(3));

    E2 <= A(2) xnor B(2);
    G2 <= A(2) and (not B(2));

    E1 <= A(1) xnor B(1);
    G1 <= A(1) and (not B(1));

    E0 <= A(0) xnor B(0);
    G0 <= A(0) and (not B(0));

    A_gt_B <= G3 or (E3 and G2) or (E3 and E2 and G1) or (E3 and E2 and E1 and G0);

    A_eq_B <= E3 and E2 and E1 and E0;

    AGreatEqualB <= A_gt_B or A_eq_B;

end Behavioral;