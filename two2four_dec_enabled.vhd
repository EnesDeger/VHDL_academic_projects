library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity two2four_dec_enabled is
    Port ( En   : in  STD_LOGIC;
           Inp  : in  STD_LOGIC_VECTOR (1 downto 0);
           Outp : out STD_LOGIC_VECTOR (3 downto 0));
end two2four_dec_enabled;

architecture Behavioral of two2four_dec_enabled is
begin

    Outp(0) <= En and (not Inp(1)) and (not Inp(0));
    Outp(1) <= En and (not Inp(1)) and Inp(0);
    Outp(2) <= En and Inp(1) and (not Inp(0));
    Outp(3) <= En and Inp(1) and Inp(0);

end Behavioral;