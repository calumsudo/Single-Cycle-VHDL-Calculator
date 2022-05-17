library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux is
    Port ( inp : in std_logic;
           sel : in std_logic_vector (1 downto 0);
           o : out std_logic_vector (3 downto 0)
           );
end demux;

architecture behav of demux is

begin
    process(inp,sel) is
    begin
        o <= "0000";
        case sel is
            when "00" => o(0) <= inp;
            when "01" => o(1) <= inp;
            when "10" => o(2) <= inp;
            when others => o(3) <= inp;
        end case;
    end process;
end behav;

