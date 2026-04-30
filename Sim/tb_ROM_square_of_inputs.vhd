library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_ROM_square_of_input is
end tb_ROM_square_of_input;

architecture Behavioral of tb_ROM_square_of_input is

    component ROM_square_of_input
        Port ( I : in std_logic_vector (2 downto 0);
               A : out std_logic_vector (5 downto 0));
    end component;

    signal I_tb : std_logic_vector(2 downto 0) := (others => '0');
    signal A_tb : std_logic_vector(5 downto 0);

    constant wait_time : time := 50 ns;

begin

    uut: ROM_square_of_input 
    port map (
        I => I_tb,
        A => A_tb
    );

    ROM_process: process
    begin
        I_tb <= "000";
        wait for wait_time;

        I_tb <= "001";
        wait for wait_time;

        I_tb <= "010";
        wait for wait_time;

        I_tb <= "011";
        wait for wait_time;

        I_tb <= "100";
        wait for wait_time;

        I_tb <= "101";
        wait for wait_time;

        I_tb <= "110";
        wait for wait_time;

        I_tb <= "111";
        wait for wait_time;

        wait;
    end process;

end Behavioral;