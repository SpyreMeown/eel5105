library IEEE;
use IEEE.Std_logic_1164.all;

entity modb is
port(B: in std_logic;
	  C: in std_logic_vector(1 downto 0);
	  S: out std_logic
	  );
end modb;

architecture bhv_modb of modb is
begin
	S <= (C(1) and (not B)) or ((not C(0)) and B);
end bhv_modb;