library ieee;
use ieee.Std_logic_1164.all;

entity subtractor is
port    (SW: in std_logic_vector(9 downto 0);
               LEDR: out std_logic_vector(4 downto 0);
               HEX1: out std_logic_vector(6 downto 0);
               HEX0: out std_logic_vector(6 downto 0)
            );
end subtractor;

architecture bhvr_subtractor of subtractor is

signal Fmarco_veio: std_logic_vector(4 downto 0);

component sum is
port    (A: in std_logic_vector(4 downto 0);
               B: in std_logic_vector(4 downto 0);
               F: out std_logic_vector(4 downto 0)
               );
end component;

component decod7seg is
port    (A: in std_logic_vector(4 downto 0);
               F: out std_logic_vector(6 downto 0));
end component;

component minus_sign is
port    (A: in std_logic;
               F: out std_logic_vector(6 downto 0)
               );
end component;

--component inversor is
--port    (A: in std_logic_vector(4 downto 0);
  --             F: out std_logic_vector(4 downto 0)
    --           );
--end component;

begin

SUMmer: sum port map(SW(9 downto 5), SW(4 downto 0),  Fmarco_veio);
DECOD: decod7seg port map(Fmarco_veio(4 downto 0), HEX0);
SIGN: minus_sign port map(Fmarco_veio(4), HEX1);
--INVERSORmer: inversor port map(SW(4 downto 0), SB);

end bhvr_subtractor;