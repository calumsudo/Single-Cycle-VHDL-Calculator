-----------------------------
--Calum Siemer & Evan Airey--
-- Single-Cycle Calculator -- 
-----------------------------
library ieee;
use ieee.std_logic_1164.all;

entity calculator is
    port(
        I: in std_logic_vector (7 downto 0); --8 input ports(buttons)
        clock: in std_logic; --clock is rising edge triggered
        reset: in std_logic; -- reset
        O: out std_logic_vector(7 downto 0) -- output
    );
end calculator;

architecture behav of calculator is
--add other components to be used
--ALU
--add/sub
--display/print
component display is
    port(
        input : in std_logic_vector(7 downto 0);
        enable : in std_logic;
        val : in std_logic;
        clock : in std_logic;
        output : out std_logic_vector(7 downto 0;)
    );
end component display;
--carry ripple adder
--register file
--two comp
--begin architecture

end behav;