library ieee;
use ieee.std_logic_1164.all;

entity twoadder is
port (A1, A0, B1, B0 : in std_logic;
		S2, S1, S0		: out std_logic
		);
end twoadder;

architecture bhvr_twoadder of twoadder is
	signal carry, D, E, F : std_logic;
begin
	carry <= A0 and B0;
	S0 	<= A0 xor B0;
	D 		<= A1 xor B1;
	E		<= carry and D;
	F		<= A1 and B1;
	S1 	<= D xor carry;
	S2		<= E or F;
end bhvr_twoadder;
	