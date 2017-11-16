library ieee;
use ieee.Std_logic_1164.all;

entity circuito1 is
port    (A: in std_logic_vector (2 downto 0);
               B: in std_logic_vector (2 downto 0);
               F1 : out std_logic_vector(3 downto 0);
               F2 : out std_logic_vector(3 downto 0);
               F3 : out std_logic_vector(3 downto 0);
               F4 : out std_logic_vector(3 downto 0)
               );
 end circuito1;
 
 architecture behaviour_circuito of circuito1 is
 begin
    F1 <= '0' & A;
    F2 <= A & '0';
    F3 <= '0' & B;
    F4 <= B & '0';
    
 end behaviour_circuito;