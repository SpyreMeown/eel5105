-----------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------------
entity ROM is
  port ( address : in std_logic_vector(3 downto 0); 
         data : out std_logic_vector(9 downto 0) );
end entity;

architecture Rom_Arch of ROM is
  type memory is array (00 to 15) of std_logic_vector(9 downto 0);
  constant my_Rom : memory := (
	00 => "0101001100",
	01 => "1010010100",
   02 => "1111000000",
	03 => "1101100000",
	04 => "1100110000",
	05 => "1100011000",
	06 => "1100001100",
	07 => "1100000110",
	08 => "1100000011",
	09 => "0110000011",
	10 => "0011000011",
	11 => "0001100011",
	12 => "0000110011",
	13 => "0000011011",
	14 => "0000001111",
	15 => "0011001010");
begin
   process (address)
   begin
     case address is
       when "0000" => data <= my_rom(00);
       when "0001" => data <= my_rom(01);
       when "0010" => data <= my_rom(02);
       when "0011" => data <= my_rom(03);
       when "0100" => data <= my_rom(04);
       when "0101" => data <= my_rom(05);
       when "0110" => data <= my_rom(06);
       when "0111" => data <= my_rom(07);
       when "1000" => data <= my_rom(08);
       when "1001" => data <= my_rom(09);
		 when "1010" => data <= my_rom(10);
		 when "1011" => data <= my_rom(11);
		 when "1100" => data <= my_rom(12);
		 when "1101" => data <= my_rom(13);
		 when "1110" => data <= my_rom(14);
		 when "1111" => data <= my_rom(15);
       when others => data <= "0000000000";
       end case;
  end process;
end architecture Rom_Arch;
