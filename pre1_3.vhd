library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pre1_3 is
    Port (A, B, C: in  std_logic;
          F      : out std_logic);
end pre1_3;

architecture Behavioral of pre1_3 is
begin
    
    F <= ((NOT A) AND B       AND (NOT C)) OR
         ((NOT A) AND B       AND  C     ) OR
         (A       AND (NOT B) AND (NOT C)) OR
         (A       AND B       AND  C     );
    
end Behavioral;
