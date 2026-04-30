library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity two2one_MUX is
    Port ( I0  : in  std_logic_vector (3 downto 0);
           I1  : in  std_logic_vector (3 downto 0);
           Sel : in  std_logic;
           Y   : out std_logic_vector (3 downto 0));
end two2one_MUX;

architecture Behavioral of two2one_MUX is
begin
    Y(0) <= (I0(0) and not Sel) or (I1(0) and Sel);
    Y(1) <= (I0(1) and not Sel) or (I1(1) and Sel);
    Y(2) <= (I0(2) and not Sel) or (I1(2) and Sel);
    Y(3) <= (I0(3) and not Sel) or (I1(3) and Sel);
end Behavioral;
