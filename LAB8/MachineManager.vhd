library ieee;
use ieee.std_logic_1164.all;

entity MachineManager is port (
   KEY: in std_logic_vector(3 downto 0);
	SW: in std_logic_vector(9 downto 0);
	CLOCK_50: in std_logic;
   LEDR: out std_logic_vector(9 downto 0) );
end MachineManager;

architecture arqmachine of MachineManager is
	signal s,a: std_logic_vector(3 downto 0);
	signal c,d: std_logic;
    signal Tw, Tc, Tm: std_logic;

    
 begin
component Datapath is
port (s: in std_logic_vector(3 downto 0);
               a: in std_logic_vector (3 downto 0);
               Tw: in std_logic;
               Tc: in std_logic;
               Tm: out std_logic);
end component;

component controle is
port (c: in std_logic;
            Tm: in std_logic;
            Tw: out std_logic;
            Tc: out std_logic;
            d: out std_logic);
end component;

begin
	s <= SW(3 downto 0);
	c <= KEY(0);
	a <= SW(7 downto 4);
	LEDR(0) <= d;
    
   DP1: Datapath port map (s(3 downto 0), a(3 downto 0), Tw, Tc, Tm);
   C1: controle port map (c, Tm, Tw, Tc, d);
     
end arqmachine;