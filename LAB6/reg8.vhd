library ieee;
use ieee.std_logic_1164.all;

entity reg8 is port (
CLK: in std_logic;
EN: in std_logic;
D: in std_logic_vector(7 downto 0);
Q: out std_logic_vector(7 downto 0));

end reg8;

architecture behv of reg8 is
begin
	process(CLK)
	begin
	if (CLK'event and CLK = '1') then 
		if (EN = '0') then -- se transicao de clock e enable 0 (alto baixo), q vai pra d
			Q <= D;
		end if;
	end if;
	end process;

end behv;
