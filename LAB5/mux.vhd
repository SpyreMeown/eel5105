library ieee;
use ieee.Std_logic_1164.all;

entity mux is
port    (F1           : in std_logic_vector(3 downto 0);
               F2           : in std_logic_vector(3 downto 0);
               F3           : in std_logic_vector(3 downto 0);
               F4           : in std_logic_vector(3 downto 0);
               Control: in std_logic_vector(1 downto 0);
               F              : out std_logic_vector(3 downto 0)
               );
end mux;

architecture behaviour_mux of mux is
begin
    F <= F1 when Control = "00" else
              F2 when Control = "01" else
              F3 when Control = "10" else
              F4 when Control = "11" else
              "1111";
 end behaviour_mux;