library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

	entity Contador is port(
		switches: in std_logic_vector(2 downto 0);
		clock: in std_logic;
		reset: in std_logic;
		contagem: out std_logic_vector(3 downto 0);
		leds: out std_logic_vector(9 downto 0)
		);
	end;
	
	architecture bhv of Contador is
		type STATES is (E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15);
		signal EA, PE: STATES;
		signal C1Hz: std_logic; -- vai para 1 quando o valor da contagem for 49.999.999
		signal cont: std_logic_vector(27 downto 0); -- registra valor da contagem
		
	begin
		P1: process(clock, reset)
		begin
			if reset= '0' then
				cont <= x"0000000";
				EA <= E0;
			elsif clock'event and clock= '1' then
				cont <= cont + 1;
				if switches = "000" and cont = x"0BEBC1F" then
					cont <= x"0000000";
					C1Hz <= '1';
				elsif switches = "001" and cont = x"17D783F" then
					cont <= x"0000000";
					C1Hz <= '1';
				elsif switches = "010" and cont = x"2FAF07F" then
					cont <= x"0000000";
					C1Hz <= '1';
				elsif switches = "011" and cont = x"3E95BA7" then
					cont <= x"0000000";
					C1Hz <= '1';
				elsif switches = "100" and cont = x"5F5E0FE" then
					cont <= x"0000000";
					C1Hz <= '1';
				elsif switches = "101" and cont = x"7D2B74D" then
					cont <= x"0000000";
					C1Hz <= '1';
				elsif switches = "110" and cont = x"BEBC1FC" then
					cont <= x"0000000";
					C1Hz <= '1';
				elsif switches = "111" then
					cont <= x"0000000";
				else
					C1Hz <= '0';
				end if;
			elsif clock'event and clock= '0' and C1Hz = '1' then
				EA <= PE;
			end if;
		end process;
		
		P2: process(EA)
		begin
			case EA is
				when E0 =>
						contagem <= "1111";
						PE <= E1;
						leds <= "0000000000";
				when E1 =>
						contagem <= "1110";
						PE <= E2;
						leds <= "1010101010";
				when E2 =>
						contagem <= "1101";
						PE <= E3;
						leds <= "0101010101";
				when E3 =>
						contagem <= "1100";
						PE <= E4;
						leds <= "1111111111";
				when E4 =>
						contagem <= "1011";
						PE <= E5;
						leds <= "0000000000";
				when E5 =>
						contagem <= "1010";
						PE <= E6;
						leds <= "1010101010";
				when E6 =>
						contagem <= "1001";
						PE <= E7;
						leds <= "0101010101";
				when E7 =>
						contagem <= "1000";
						PE <= E8;
						leds <= "1111111111";
				when E8 =>
						contagem <= "0111";
						PE <= E9;
						leds <= "0000000000";
				when E9 =>
						contagem <= "0110";
						PE <= E10;
						leds <= "1010101010";
				when E10 =>
						contagem <= "0101";
						PE <= E11;
						leds <= "0101010101";
				when E11 =>
						contagem <= "0100";
						PE <= E12;
						leds <= "1111111111";
				when E12 =>
						contagem <= "0011";
						PE <= E13;
						leds <= "0000000000";
				when E13 =>
						contagem <= "0010";
						PE <= E14;
						leds <= "1010101010";
				when E14 =>
						contagem <= "0001";
						PE <= E15;
						leds <= "0101010101";
				when E15 =>
						contagem <= "0000";
						PE <= E0;
						leds <= "1111111111";	
			end case;
		end process;
	end bhv;
	
