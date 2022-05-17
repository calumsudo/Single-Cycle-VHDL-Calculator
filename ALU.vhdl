
library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port(	A,B:	in std_logic_vector(7 downto 0); -- two 8-bit inputs
		OP:	in std_logic_vector(1 downto 0); --operation- 00:do nothing; 01:add; 10:subtract; 11:set on equal
		O:	out std_logic_vector(7 downto 0); --output
		EQ:	out std_logic --set on equal output
	);
end ALU;

architecture behav of ALU is
	component carry is -- carry ripple adder
		port ( 	
			A, B:	in std_logic_vector (7 downto 0); -- two 8-bit inputs
			Cin:	in std_logic; --Carry in
			Sum:	out std_logic_vector (7 downto 0); --the sum
			Cout:	out std_logic --Carry out
		     );
	end component;

	signal zero: std_logic:= '0';
	signal one: std_logic:= '1';
	signal addition:	std_logic_vector(7 downto 0);
	signal subtraction:	std_logic_vector(7 downto 0);
	signal s_carry:	std_logic;
	signal d_carry:	std_logic;
	signal not_B:	std_logic_vector(7 downto 0);

begin
	not_B <= not B;

	adder: carry port map(A, B, zero, addition, s_carry);
	subtractor: carry port map(A, not_B, one, subtraction, d_carry);

	O <=	addition	when OP = "01" else
	     	subtraction when OP = "10" else
		"ZZZZZZZZ";
	EQ <=	'1' when A=B else
	      	'0';
end behav;