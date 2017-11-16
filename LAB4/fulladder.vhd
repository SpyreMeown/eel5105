library ieee;
use ieee.Std_logic_1164.all;

entity fulladder is
port ( A 	: in std_logic;
		 B 	: in std_logic;
		 Cin	: in std_logic;
		 S 	: out std_logic;
		 Cout	: out std_logic
		 );
end fulladder;

architecture bhvr_fulladder of fulladder is
	signal D, E, F : std_logic;
begin
	D		<= A xor B;
	E		<= D and Cin;
	F 		<= A and B;
	S 		<= D xor Cin;
	Cout 	<= E or F;
end bhvr_fulladder;	