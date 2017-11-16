library ieee;
use ieee.Std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- necessario para o +

entity sum is
port	(A: in std_logic_vector(4 downto 0);
             B: in std_logic_vector(4 downto 0);
             F: out std_logic_vector(4 downto 0)
             );
end sum;

architecture circuito of sum is
begin
    F <= A +  not B + '1';
end circuito;