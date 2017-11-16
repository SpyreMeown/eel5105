library ieee;
use ieee.Std_logic_1164.all;

entity somasub is
port (A			: in std_logic_vector(3 downto 0);
		B			: in std_logic_vector(3 downto 0);
		C			: in std_logic_vector(1 downto 0);
		S			: out std_logic_vector(3 downto 0);
		Overflow	: out std_logic
		);
end somasub;

architecture soma of somasub is

component fulladder is 
port( A		: in std_logic;
		B		: in std_logic;
		Cin	: in std_logic;
		S		: out std_logic;
		Cout	: out std_logic
		);

end component;

component modb is
port(	B: in std_logic;
		C: in std_logic_vector(1 downto 0);
		S: out std_logic
	);

end component;

signal cout0, cout1, cout2, cout3, saidab0, saidab1, saidab2, saidab3: std_logic;

begin
F0: fulladder port map (A(0), saidab0, C(0) , S(0), cout0);
F1: fulladder port map (A(1), saidab1, cout0, S(1), cout1);
F2: fulladder port map (A(2), saidab2, cout1, S(2), cout2);
F3: fulladder port map (A(3), saidab3, cout2, S(3), cout3);
M0: modb port map(B(0), C, saidab0);
M1: modb port map(B(1), C, saidab1);
M2: modb port map(B(2), C, saidab2);
M3: modb port map(B(3), C, saidab3);

Overflow <= cout3 xor cout2;

end soma; 