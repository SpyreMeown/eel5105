library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity inversor is
port ( A : in std_logic_vector(4 downto 0);
F : out std_logic_vector(4 downto 0));
end inversor;

architecture bhvr_inversor of inversor is
begin
F(4) <= '1' when A(4) = '0';
F(3) <= '1' when A(3) = '0';
F(2) <= '1' when A(2) = '0';
F(1) <= '1' when A(1) = '0';
F(0) <= '1' when A(0) = '0';

end bhvr_inversor;