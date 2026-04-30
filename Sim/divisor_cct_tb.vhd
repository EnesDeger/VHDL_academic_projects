library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisior_cct_tb is
end divisior_cct_tb;

architecture Behavioral of divisior_cct_tb is

    component divisior_cct
        Port (initial :in  std_logic;
              Clock  :in  std_logic;
              Reset  :in  std_logic;
              A      :in  std_logic_vector (2 downto 0);
              B      :in  std_logic_vector (2 downto 0);
              Q      :out std_logic_vector (2 downto 0);
              R      :out std_logic_vector (2 downto 0));
    end component;

    signal initial : std_logic := '0';
    signal Clock   : std_logic := '0';
    signal Reset   : std_logic := '0';
    signal A       : std_logic_vector(2 downto 0) := (others => '0');
    signal B       : std_logic_vector(2 downto 0) := (others => '0');

    signal Q       : std_logic_vector(2 downto 0);
    signal R       : std_logic_vector(2 downto 0);

    constant Clock_period : time := 10 ns;

begin

    uut: divisior_cct PORT MAP (
          initial => initial,
          Clock => Clock,
          Reset => Reset,
          A => A,
          B => B,
          Q => Q,
          R => R
        );

    Clock_process :process
    begin
        Clock <= '0';
        wait for Clock_period/2;
        Clock <= '1';
        wait for Clock_period/2;
    end process;

    stim_proc: process
    begin
        Reset <= '1';
        wait for 20 ns;
        Reset <= '0';
        wait for 10 ns;

        A <= "111";
        B <= "010";
        initial <= '1';
        wait for Clock_period;
        initial <= '0';
        wait for 100 ns;

        Reset <= '1';
        wait for 10 ns;
        Reset <= '0';
        
        A <= "110";
        B <= "011";
        initial <= '1';
        wait for Clock_period;
        initial <= '0';
        wait for 100 ns;

        wait;
    end process;

end Behavioral;
