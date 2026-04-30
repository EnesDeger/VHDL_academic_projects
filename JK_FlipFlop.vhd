library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FlipFlop is
    Port ( J     : in  STD_LOGIC;
           K     : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           Q     : out STD_LOGIC;
           Qn    : out STD_LOGIC); 
end JK_FlipFlop;

architecture Behavioral of JK_FlipFlop is
    signal tempQ : std_logic := '0'; 
begin
    process (Reset, Clock)
    begin
        if Reset = '1' then
            tempQ <= '0';
        elsif rising_edge(Clock) then 
            if (J = '0' and K = '0') then
                tempQ <= tempQ;        -- Değişim Yok
            elsif (J = '0' and K = '1') then
                tempQ <= '0';          -- Reset
            elsif (J = '1' and K = '0') then
                tempQ <= '1';          -- Set
            elsif (J = '1' and K = '1') then
                tempQ <= not tempQ;    -- Toggle
            end if;
        end if;
    end process;

    Q  <= tempQ;
    Qn <= not tempQ;

end Behavioral;
