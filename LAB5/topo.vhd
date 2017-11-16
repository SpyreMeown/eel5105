library ieee;
use ieee.Std_logic_1164.all;

entity topo is
port    (SW: in std_logic_vector(9 downto 0);
               LEDR: out std_logic_vector(3 downto 0);
               HEX0: out std_logic_vector(6 downto 0)
               );
end topo;

architecture bhvr_topo of topo is

signal F1, F2, F3, F4, F, G: std_logic_vector(3 downto 0);

component circuito1 is
port    (A: in std_logic_vector (2 downto 0);
               B: in std_logic_vector (2 downto 0);
               F1 : out std_logic_vector(3 downto 0);
               F2 : out std_logic_vector(3 downto 0);
               F3 : out std_logic_vector(3 downto 0);
               F4 : out std_logic_vector(3 downto 0)
               );
 end component;

component sum is
port	(A: in std_logic_vector(3 downto 0);
             B: in std_logic_vector(3 downto 0);
             F: out std_logic_vector(3 downto 0)
             );
end component;

component mux is
port    (F1           : in std_logic_vector(3 downto 0);
               F2           : in std_logic_vector(3 downto 0);
               F3           : in std_logic_vector(3 downto 0);
               F4           : in std_logic_vector(3 downto 0);
               Control: in std_logic_vector(1 downto 0);
               F              : out std_logic_vector(3 downto 0)
               );
end component;

component decod7seg is
port    (A: in std_logic_vector(3 downto 0);
               F: out std_logic_vector(6 downto 0)
               );
 end component;

begin

SUMT                   : sum port map(F1, F, G);
MUXT                  : mux port map(F1, F2, F3, F4, SW(9 downto 8),  F);
CIRCUITO1T     : circuito1 port map(SW(2 downto 0), SW (6 downto 4),  F1, F2, F3, F4);
DECOD7SEGT  : decod7seg port map(G, HEX0);
LEDR <= G;

end bhvr_topo;