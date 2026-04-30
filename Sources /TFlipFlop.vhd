library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TFlipFlop is
    Port ( T     : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           Q     : out STD_LOGIC;
           Qn    : out STD_LOGIC);
end TFlipFlop;

architecture Behavioral of TFlipFlop is
    signal tempQ : std_logic;
begin
    process (Reset, Clock)
    begin
        if (Clock'event and Clock = '1') then 
            if Reset = '1' then
                tempQ <= '0';             
            elsif T = '1' then
                tempQ <= not tempQ;  
            else
                tempQ <= tempQ;           
            end if;
        end if;
    end process;

    Q  <= tempQ;
    Qn <= not tempQ;

end Behavioral;