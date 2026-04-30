library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFlipFlop is
    Port ( D     : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           Q     : out STD_LOGIC;
           Qn    : out STD_LOGIC); 
end DFlipFlop;

architecture Behavioral of DFlipFlop is
    signal tempQ : std_logic; 
begin
    process (Reset, Clock)
    begin
        if Clock'event and Clock = '1' then
            if Reset = '1' then
                tempQ <= '0';
            else
                tempQ <= D;
            end if;
        end if;
    end process;

    Q  <= tempQ;
    Qn <= not tempQ; 
end Behavioral;