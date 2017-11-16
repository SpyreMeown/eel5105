library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Datapath is port (
s, a: in std_logic_vector(3 downto 0);
clock, Tw, Tc: in std_logic;
Tm: out std_logic);
end Datapath;

architecture arqdtp of Datapath is
    signal tot: std_logic_vector(3 downto 0);

begin
-- Registrador e Somador:
process(clock,Tc)
    begin
        if (Tc = '1') then
            tot <= "0000";
            elsif (clock'event AND clock = '1') then
                if (Tw = '1') then
                    tot <= tot + a;
                end if;
        end if;
end process;
-- Comparador:
Tm <= '1' when (tot < s) else
'0';
end arqdtp;