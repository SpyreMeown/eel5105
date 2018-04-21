library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity complement_2 is
port (X: in std_logic_vector(3 downto 0);
		Y: out std_logic_vector(3 downto 0)
);
end complement_2;

architecture complement_2 of complement_2 is
begin

Y <= (not X) + "0001";

end complement_2;
