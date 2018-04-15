
library IEEE;
use IEEE.Std_logic_1164.all;

--------------------------------------------------------------

entity fulladder is
port (A: in std_logic;
		  B: in std_logic;
		  Cin: in std_logic;
		  Cout: out std_logic;
		  S: out std_logic
		);
end fulladder;

--------------------------------------------------------------

architecture circuito of fulladder is
	begin
		S <= A xor B xor Cin;
		Cout <= (A and B) or (A and Cin) or (B and Cin);
		end circuito;
