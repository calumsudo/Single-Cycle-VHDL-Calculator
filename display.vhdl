-----------------------------
--Calum Siemer & Evan Airey--
--         Display         -- 
-----------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display is
    port(
        input : in std_logic_vector(7 downto 0);
        enable : in std_logic;
        nop : in std_logic;
        clk : in std_logic;
        output : out std_logic_vector(7 downto 0;)
    );
end display;
architecture str of print_module is
    signal num : integer := 0;
    
    begin  
  
    num <= to_integer(signed(input));
    
    process (clk)
    begin
      if rising_edge(clk) then
        if (enable = '1') then
          if (nop = '1') then
            report "nop";
            output <= "00000000";
          else
            report "value: " & integer'image(num);
            output <= input;
          end if;
        else
          output <= "00000000";
        end if;
      end if;
    end process;
  
    
    
    -----------------------------------------------------------------------------
    -- Component instantiations
    -----------------------------------------------------------------------------
  
  end architecture str;
  
  -------------------------------------------------------------------------------