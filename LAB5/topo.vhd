library IEEE;
use IEEE.std_logic_1164.all;

------------------------------------------------------------------------------

entity topo is

port (SW: in std_logic_vector(9 downto 0); --switches da placa
		LEDR: out std_logic_vector (9 downto 0); -- LEDS
		HEX0: out std_logic_vector(6 downto 0) -- display de 7-seg // apenas LED(0) e SW(3 downto 1) utilizados
);

end topo;
	
------------------------------------------------------------------------------
	
architecture circuitotopo of topo is 

signal mux_output: std_logic_vector (3 downto 0);
signal complement_2_output: std_logic_vector(3 downto 0);

component decoder 

port (C: in std_logic_vector(3 downto 0);
		F: out std_logic_vector(6 downto 0)
);
end component;

component multiplexer_4x1  
port (multiplexer_input_0: in std_logic_vector(3 downto 0);
		  multiplexer_input_1: in std_logic_vector(3 downto 0);
		  multiplexer_output : out std_logic_vector(3 downto 0);
		  control_signal     : in std_logic
);  

end component;

component complement_2 
port (X: in std_logic_vector(3 downto 0);
      Y: out std_logic_vector(3 downto 0)
);
 
end component;
begin

decodificador: decoder port map (mux_output, HEX0); 
  
multiplexer: multiplexer_4x1 port map (SW(3 downto 0), complement_2_output, mux_output, SW(3));
  
Complemento2: complement_2 port map (SW(3 downto 0), complement_2_output);
  
LEDR(0)<= SW(3); -- acende caso o bit mais significativo seja 1.
end architecture;
 
