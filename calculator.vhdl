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
--two comp -> Need to make two compliment file
--begin architecture





end behav;