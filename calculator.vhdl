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
    );
end calculator;

architecture behav of calculator is
--add other components to be used
--ALU
component ALU is 
    port(
        A,B:	in std_logic_vector(7 downto 0); -- two 8-bit inputs
		OP:	in std_logic_vector(1 downto 0); --operation- 00:do nothing; 01:add; 10:subtract; 11:set on equal
		O:	out std_logic_vector(7 downto 0); --output
		EQ:	out std_logic --set on equal output
    );
end component ALU;
--add/sub
component add_sub is
    port(	A:	in std_logic_vector (3 downto 0);
            B:	in std_logic_vector (3 downto 0);
            mode: in std_logic;
            Carry: out std_logic;        
            S:	out std_logic_vector(3 downto 0)
    );
end component add_sub;
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
component carry is
	port(	
		A, B:	in std_logic_vector (7 downto 0); -- two 8-bit inputs
		Cin:	in std_logic; --Carry in
		Sum:	out std_logic_vector (7 downto 0); --the sum
		Cout:	out std_logic --Carry out
	);
end component carry;
--register file
component reg_file is
    Port (  wd: in std_logic_vector (7 downto 0);
            ws, rs1, rs2: in std_logic_vector (1 downto 0);
            clk, we: in std_logic;
            rd1, rd2: out std_logic_vector (7 downto 0)
            );
end component reg_file;

--add signals
signal we, display, Cin : std_logic;
signal ws, rs1, rs2 : std_logic_vector(1 downto 0);
signal wd, A, B, input, I : std_logic_vector(7 downto 0);

--begin architecture
begin

--set up port maps
regfile0 : reg_file port map(wd, ws, rs1, rs2, clk, we, rd1, rd2);
operation : addsub port map(A, B, mode, Carry, S);


rd1 <= I(1 downto 0);
rd2 <= I(5 downto 4);

display <= not (I(7) or I(6) or I(5));

with display select rd1 <=
    I(3 downto 2) when '0',
    I(4 downto 3) when others;


    sign_ext_imm(3 downto 0) <= I(3 downto 0);
    with I(3) select sign_ext_imm(7 downto 4) <=
    "1111" when '1',
    "0000" when others;


    we <= I(7) or I(6);

    



end behav;