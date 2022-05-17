
library IEEE;
use ieee.std_logic_1164.all;

entity full_adder is
	port(	
		A, B, Cin:	in std_logic;
		Sum, Cout:	out std_logic
	);
end full_adder;

architecture behav of full_adder is
begin
	Sum <= A XOR B XOR Cin;
	Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B);
end behav;