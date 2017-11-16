library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity minus_sign is
port ( A : in std_logic;
F : out std_logic_vector(6 downto 0)
);
end minus_sign;

architecture bhvr_minus of minus_sign is
begin
F <= "0111111" when A = '1' else
    "1111111";

end bhvr_minus;