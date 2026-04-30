library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity try_vending_machine is
end try_vending_machine;

architecture Behavioral of try_vending_machine is

    component vending_machine
    Port(
         Reset   : in  std_logic;
         Clock   : in  std_logic;
         C       : in  std_logic;
         W       : in  std_logic;
         B       : in  std_logic;
         CD      : out  std_logic;
         WD      : out  std_logic;
         BD      : out  std_logic;
         Q_state : out std_logic_vector(2 downto 0)
        );
    end component;
    
    signal Reset : std_logic := '0';
    signal Clock : std_logic := '0';
    signal C     : std_logic := '0';
    signal W     : std_logic := '0';
    signal B     : std_logic := '0';

    signal CD      : std_logic;
    signal WD      : std_logic;
    signal BD      : std_logic;
    signal Q_state : std_logic_vector(2 downto 0);

    constant Clock_period : time := 10 ns;

begin

    uut: vending_machine PORT MAP (
          Reset   => Reset,
          Clock   => Clock,
          C       => C,
          W       => W,
          B       => B,
          CD      => CD,
          WD      => WD,
          BD      => BD,
          Q_state => Q_state
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
        wait for Clock_period;

        
        -- TEST 2: 100 kurus atip BIRA almak (25+25+25+25 -> BIRA + PARA USTU)
        C <= '1'; wait for Clock_period; C <= '0'; wait for Clock_period;
        C <= '1'; wait for Clock_period; C <= '0'; wait for Clock_period;
        C <= '1'; wait for Clock_period; C <= '0'; wait for Clock_period; 
        C <= '1'; wait for Clock_period; C <= '0'; wait for Clock_period;
        B <= '1'; 
        wait for Clock_period; 
        B <= '0'; 
        C <= '1'; wait for Clock_period; C <= '0'; wait for Clock_period;
        B <= '1'; 
        wait for Clock_period; 
        B <= '0'; 
        
        wait for Clock_period*2;

        wait;
    end process;

end Behavioral;