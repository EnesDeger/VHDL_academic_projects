library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity S_R_Latch is
    Port (S : in  std_logic;
          R : in  std_logic;
          En: in  std_logic;
          Q : out std_logic;
          Qn: out std_logic);
end S_R_Latch;

architecture Behavioral of S_R_Latch is
    
    signal Nand_out: std_logic_vector (3 downto 0);
    
begin
    
    Nand_out(0)<=S nand En;
    Nand_out(1)<=R nand En;
    Nand_out(2)<=Nand_out(3) nand Nand_out(0);
    Nand_out(3)<=Nand_out(2) nand Nand_out(1);
    
    Q <=Nand_out(2);
    Qn<=Nand_out(3);
    
end Behavioral;
