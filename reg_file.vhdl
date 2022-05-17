library ieee;
use ieee.std_logic_1164.all;

entity reg_file is
    Port (  wd: in std_logic_vector (7 downto 0);
            ws, rs1, rs2: in std_logic_vector (1 downto 0);
            clk, we: in std_logic;
            rd1, rd2: out std_logic_vector (7 downto 0)
            );
end reg_file;

architecture behav of reg_file is

component demux is
    Port ( inp : in std_logic;
           sel : in std_logic_vector (1 downto 0);
           o : out std_logic_vector (3 downto 0)
           );
end component;

component reg is
    port(	
        I:	    in std_logic_vector (7 downto 0); 
        clock, enable:	in std_logic; 
        O:	    out std_logic_vector(7 downto 0) := (others=>'0') 
    );
end component;

component mux is
    Port (  I0, I1, I2, I3 : in std_logic_vector (7 downto 0);
            Sel : in std_logic_vector (1 downto 0);
            O : out std_logic_vector (7 downto 0)
            );
end component;
    
-- Write enable wires that connect demux to registers
signal W : std_logic_vector (3 downto 0) := (others=>'0');
-- Read wires that connect registers to mux
signal R0 : std_logic_vector (7 downto 0) := (others=>'0');
signal R1 : std_logic_vector (7 downto 0) := (others=>'0');
signal R2 : std_logic_vector (7 downto 0) := (others=>'0');
signal R3 : std_logic_vector (7 downto 0) := (others=>'0');

begin
--  Component instantiation.
demux0: demux port map ( inp => we, sel => ws, o => W);
reg0: reg port map (i => wd, clock => clk, enable => W(0), O => R0);
reg1: reg port map (i => wd, clock => clk, enable => W(1), O => R1);
reg2: reg port map (i => wd, clock => clk, enable => W(2), O => R2);
reg3: reg port map (i => wd, clock => clk, enable => W(3), O => R3);
mux0: mux port map ( I0 => R0, I1 => R1, I2 => R2, I3 => R3, Sel => rs1, O => rd1);
mux1: mux port map ( I0 => R0, I1 => R1, I2 => R2, I3 => R3, Sel => rs2, O => rd2);

end behav;