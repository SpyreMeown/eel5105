library IEEE;
use IEEE.Std_Logic_1164.all;

------------------------------------------------------------------------

entity multiplexer_4x1 is 
port (multiplexer_input_0: in std_logic_vector(3 downto 0);
		multiplexer_input_1: in std_logic_vector(3 downto 0);
		multiplexer_output : out std_logic_vector(3 downto 0);
		control_signal     : in std_logic
);
end multiplexer_4x1;
  
------------------------------------------------------------------------

architecture multiplexer of multiplexer_4x1 is
begin

 
 multiplexer_output <= multiplexer_input_0 when control_signal = '0' else 
 multiplexer_input_1;
 
 end architecture; 
