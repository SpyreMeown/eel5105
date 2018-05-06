library IEEE;
use IEEE.std_logic_1164.all;


entity decodC2to7seg is


port (Y:in std_logic_vector(7 downto 0);
      HEX0: out std_logic_vector(6 downto 0);
      HEX1: out std_logic_vector(6 downto 0));
end decodC2to7seg;

architecture circuitotopo of decodC2to7seg is 
signal Smux: std_logic_vector(7 downto 0); --saida mux
signal Scomp: std_logic_vector(7 downto 0); --saida do complementador

component decod 
port (C: in std_logic_vector(3 downto 0);
		  F: out std_logic_vector(6 downto 0));
end component;

component multiplex2x1  
port (m0 : in std_logic_vector(7 downto 0);
		  m1 : in std_logic_vector(7 downto 0);
		  Sm : out std_logic_vector(7 downto 0);
		  C  : in  std_logic
);  

end component;

component Compl2 
port (X: in std_logic_vector(7 downto 0);
		  Y: out std_logic_vector(7 downto 0)
);
 
end component;
begin
decod1: decod port map (Smux(7 downto 4), HEX0); 
decod2: decod port map(Smux(3 downto 0), HEX1); 
Mux: multiplex2x1 port map (Y(7 downto 0), Scomp, Smux, Y(7));
Complemento2:Compl2 port map (Y(7 downto 0), Scomp);

end architecture;
 
