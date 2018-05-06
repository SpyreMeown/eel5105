library IEEE;
use IEEE.Std_logic_1164.all;

entity modb is
port (I1: in std_logic;
		I2: in std_logic_vector(1 downto 0); -- Não explícito, mas esse tem que ser um vetor, não std_logic.
		R: out std_logic
);
end modb;

architecture circuit_modb of modb is

begin 
		R <= (I2(1) and (not I1)) or ((not I2(0)) and I1);
end circuit_modb;
