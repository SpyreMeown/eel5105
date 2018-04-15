library ieee;
use ieee.Std_logic_1164.all;

entity halfadder is
port (A : in std_logic;
      B : in std_logic;
      S : out std_logic;
      C	: out std_logic
);
end halfadder;

architecture bhvr_halfadder of halfadder is
begin
	S <= A xor B;
	C <= A and B;
end bhvr_halfadder;	
