library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity DATAPATH is
port(
	SWITCHES: in std_logic_vector(9 downto 0);
	HEX1: out std_logic_vector(6 downto 0);
	HEX2: out std_logic_vector(6 downto 0);
	HEX3: out std_logic_vector(6 downto 0);
	HEX4: out std_logic_vector(6 downto 0);
	  

	--controlador -> datapath
	R1: in std_logic;
	R2: in std_logic;
	
	E1: in std_logic;
	E2: in std_logic;
	E3: in std_logic;
	E4: in std_logic;
	E5: in std_logic;

	--datapath -> controlador
	
	sw_erro: out std_logic;
	end_game: out std_logic;
	end_time: out std_logic;
	end_round: out std_logic
);
end DATAPATH;

architecture PATH of DATAPATH is

component ROM

port(address : in std_logic_vector(3 downto 0); 
     data : out std_logic_vector(9 downto 0)
);

end component;

signal SAIDA_ROM: std_logic_vector(9 downto 0);
begin
--memoria: ROM port map(SW(9 downto 6), SAIDA_ROM(9 downto 0));

end architecture;
