library ieee;
use ieee.std_logic_1164.all;
--by Calum Siemer & Evan Airey
entity reg is
port(
    I: in std_logic_vector (7 downto 0);
    clock: in std_logic; --clock is rising edge triggered
    enable: in std_logic; -- 0: nothing 1: reg enabled
    O: out std_logic_vector(7 downto 0) -- output
);
end reg;
architecture behav of reg is
    begin
        process(clock)
        begin
                if rising_edge(clock) then
                if( enable = '1' ) then
                    O <= I;
                end if;
                end if;		
        end process;
end behav;
