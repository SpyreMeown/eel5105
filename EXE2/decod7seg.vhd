library ieee;
use ieee.Std_logic_1164.all;

entity decod7seg is
port    (A: in std_logic_vector(4 downto 0);
               F: out std_logic_vector(6 downto 0)
               );
 end decod7seg;
 
 architecture behaviour of decod7seg is
 begin
    F <=  "1000000" when A = "00000" else  -- 0
               "1111001" when A= "00001" else  -- 1
               "0100100" when A = "00010" else  -- 2
               "0110000" when A = "00011" else  -- 3
               "0011001" when A = "00100" else  -- 4
               "0010010" when A = "00101" else  -- 5
               "0000010" when A = "00110" else  -- 6
               "1111000" when A = "00111" else  -- 7
               "0000000" when A = "01000" else  -- 8
               "0010000" when A = "01001" else  -- 9
               "0001000" when A = "01010" else  -- A
               "0000011" when A = "01011" else  -- B
               "1000110" when A = "01100" else  -- C
               "0100001" when A = "01101" else  -- D
               "0000110" when A = "01110" else  -- E
               "0001110" when A = "01111" else  -- F
               
               -- NEGA FUCKING TIVO
                "0001110"when A= "10001" else  -- -F
               "0000110" when A = "10010" else  -- -E
               "0100001" when A = "10011" else  -- -D
               "1000110" when A = "10100" else  -- -C
               "0000011" when A = "10101" else  -- -B
               "0001000" when A = "10110" else  -- -A
               "0010000" when A = "10111" else  -- -9
               "0000000" when A = "11000" else  -- -8
               "1111000" when A = "11001" else  -- -7
               "0000010" when A = "11010" else  -- -6
               "0010010" when A = "11011" else  -- -5
               "0011001" when A = "11100" else  -- -4
               "0110000" when A = "11101" else  -- -3
               "0100100" when A = "11110" else  -- -2
               "1111001" when A = "11111" else  -- -1
               "1111111";
 end behaviour;