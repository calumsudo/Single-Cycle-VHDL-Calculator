library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Port (  I0, I1, I2, I3 : in std_logic_vector (7 downto 0);
            Sel : in std_logic_vector (1 downto 0);
            O : out std_logic_vector (7 downto 0)
            );
end mux;

architecture Behavioral of mux is

begin
    process(I0,I1,I2,I3,Sel) is
    begin
        case Sel is
            when "00" => O <= I0;
            when "01" => O <= I1;
            when "10" => O <= I2;
            when others => O <= I3;
        end case;
    end process;

end Behavioral;

