library IEEE;
use ieee.std_logic_1164.all;

entity carry is
	port(	
		A, B:	in std_logic_vector (7 downto 0); -- two 8-bit inputs
		Cin:	in std_logic; --Carry in
		Sum:	out std_logic_vector (7 downto 0); --the sum
		Cout:	out std_logic --Carry out
	);
end carry;

architecture behav of carry is
	component full_adder is
		port(			
			A, B, Cin:	in std_logic;
		    Sum, Cout:	out std_logic
		);
	end component;
	
	signal c1,c2,c3,c4,c5,c6,c7: 	std_logic;
	begin	
	-- FULL ADDERS 1-8
	FA1: full_adder port map( A(0), B(0), Cin, Sum(0), c1);
	FA2: full_adder port map( A(1), B(1), c1, Sum(1), c2);
	FA3: full_adder port map( A(2), B(2), c2, Sum(2), c3);
	FA4: full_adder port map( A(3), B(3), c3, Sum(3), c4);
	FA5: full_adder port map( A(4), B(4), c4, Sum(4), c5);
	FA6: full_adder port map( A(5), B(5), c5, Sum(5), c6);
	FA7: full_adder port map( A(6), B(6), c6, Sum(6), c7);
	FA8: full_adder port map( A(7), B(7), c7, Sum(7), Cout);
end behav;