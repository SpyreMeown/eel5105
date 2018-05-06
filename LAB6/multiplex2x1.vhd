library IEEE;
use IEEE.Std_Logic_1164.all;

Entity multiplex2x1 is 
port 
(	m0 : in std_logic_vector(7 downto 0);
   m1 : in std_logic_vector(7 downto 0);
   Sm : out std_logic_vector(7 downto 0);
   C  : in  std_logic);

end multiplex2x1;

architecture cirtuito of multiplex2x1 is
begin

 
 Sm <= m0 when C = '0' else 
 m1;
 
 end architecture; 
