library ieee;
use ieee.std_logic_1164.all;

entity binary_decoder is
port(A: in std_logic_vector(3 downto 0);
     Out: out std_logic_vector(9 downto 0));
end entity;

architecture behavior_binary_decoder of binary_decoder is

begin
    case A is
    when "0000" => Out <= "0000000000"; -- 0
    when "0001" => Out <= "0000000001"; -- 1
    when "0010" => Out <= "0000000011"; -- 2
    when "0011" => Out <= "0000000111"; -- 3
    when "0100" => Out <= "0000001111"; -- 4
    when "0101" => Out <= "0000011111"; -- 5
    when "0110" => Out <= "0000111111"; -- 6
    when "0111" => Out <= "0001111111"; -- 7
    when "1000" => Out <= "0011111111"; -- 8
    when "1001" => Out <= "0111111111"; -- 9
    when "1010" => Out <= "1111111111"; -- 10
    when "1011" => Out <= "1010101010"; -- 11 impossible
    when "1100" => Out <= "1010101010"; -- 12 impossible
    when "1101" => Out <= "1010101010"; -- 13 impossible
    when "1110" => Out <= "1010101010"; -- 14 impossible
    when "1111" => Out <= "1010101010"; -- 15 impossible
end behavior_binary_decoder;
