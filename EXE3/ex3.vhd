library IEEE;
use IEEE.Std_Logic_1164.all;

entity ex3 is
port (SW: in std_logic_vector(2 downto 0);
		LEDR: out std_logic_vector(9 downto 0);
		HEX0: out std_logic_vector (6 downto 0);
		HEX1: out std_logic_vector (6 downto 0);
		HEX2: out std_logic_vector (6 downto 0);
		HEX3: out std_logic_vector (6 downto 0);
		HEX4: out std_logic_vector (6 downto 0);
		HEX5: out std_logic_vector (6 downto 0);
		KEY: in std_logic_vector(1 downto 0);
		CLOCK_50: in std_logic
	);
end ex3;

architecture circuito of ex3 is
	signal J: std_logic_vector(3 downto 0);
	signal S: std_logic_vector(2 downto 0);
	signal Dec: std_logic_vector(6 downto 0);
	signal toLeds: std_logic_vector(9 downto 0);
	
	
	component Contador
	port (
		switches: in std_logic_vector(2 downto 0);
		contagem: out std_logic_vector(3 downto 0);
		clock: in std_logic;
		reset: in std_logic;
		leds: out std_logic_vector(9 downto 0)
	);
	end component;
	
	component decod7seg
	port (
		A: in std_logic_vector(3 downto 0);
		F: out std_logic_vector(6 downto 0)
	);
	end component;
	
Begin
--	L0: Contador port map (SW(2 downto 0), J, CLOCK_50, KEY(0), toLeds(9 downto 0));
	Decod0: decod7seg port map (J(3 downto 0), Dec (6 downto 0));
	HEX0 <= Dec;
	HEX1 <= Dec;
	HEX2 <= Dec;
	HEX3 <= Dec;
	HEX4 <= Dec;
	HEX5 <= Dec;
	LEDR <= toLeds;
end circuito;