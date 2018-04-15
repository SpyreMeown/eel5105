library IEEE;
use IEEE.std_logic_1164.all;

---------------------------------------------------------------------------

entity somasub is
port (A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		C: in std_logic_vector(1 downto 0);
		S: out std_logic_vector(3 downto 0);
		Overflow: out std_logic
);
end somasub;

---------------------------------------------------------------------------

architecture circuit of somasub is
	signal I0, I1, I2, I3, R0, R1, R2, R3: std_logic; -- Sinais intermediários dos carries e saídas dos modb.
	component fulladder is
port (A: in std_logic;
		B: in std_logic;
		Cin: in std_logic;
		Cout: out std_logic;
		S: out std_logic
		);
end component;

	component modb is
port (I1: in std_logic;
		I2: in std_logic_vector(1 downto 0); --Usar um vetor aqui serve basicamente pra comutar esses dois valores em modb.vhd#L14, mantendo uma das entradas do modb "fixas". Com três entradas separadas do tipo std_logic o código não funciona.
		R: out std_logic
);
end component;

begin 

MODB0: modb port map(B(0), C, R0);
MODB1: modb port map(B(1), C, R1);
MODB2: modb port map(B(2), C, R2);
MODB3: modb port map(B(3), C, R3);

FA0: fulladder port map(A(0), R0, C(0), I0, S(0));
FA1: fulladder port map(A(1), R1, I0, I1, S(1)); 
FA2: fulladder port map(A(2), R2, I1, I2, S(2));
FA3: fulladder port map(A(3), R3, I2, I3, S(3));
Overflow <= I3 xor I1; -- Dois sinais do penúltimo e último carry out do circuito. Serve como detector de overflow. Possvel usar uma NAND também.

end circuit;



