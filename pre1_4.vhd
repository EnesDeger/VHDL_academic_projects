library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pre1_4 is
port (x, y, z: in  std_logic;
      A, B, C: out std_logic);
end pre1_4;

architecture Behavioral of pre1_4 is
begin
    
    A<= (X and Y)or (X and Z) or (Y and Z);
    
    B<= X xor Y xor Z;
    
    C <= NOT z;
    
end Behavioral;