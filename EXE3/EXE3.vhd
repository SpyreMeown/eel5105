library ieee;
use ieee.std_logic_1164.all;
-- coisas do contador
use ieee.std_logic_unsigned.all;
entity exe3 is 

port(
	CLOCK_50: in std_logic;
   HEX0: out std_logic_vector(6 downto 0);
   HEX1: out std_logic_vector(6 downto 0);
   HEX2: out std_logic_vector(6 downto 0);
   HEX3: out std_logic_vector(6 downto 0);
   HEX4: out std_logic_vector(6 downto 0);
   HEX5: out std_logic_vector(6 downto 0);
   LEDR: out std_logic_vector(9 downto 0);
	KEY: in std_logic_vector(3 downto 0)
	);
end exe3;

architecture FSM of exe3 is 
type STATES is (F, E, D, C, B, A, NOVE, OITO, SETE, SEIS, CINCO, QUATRO, TRES, DOIS, UM, ZERO);
signal AEstado, PEstado: STATES;
-- coisas do contador 
signal C1Hz: std_logic;
signal cont: std_logic_vector(27 downto 0);
--------------------
begin
	process (KEY(0), CLOCK_50)
	 
		begin
	  
			if (KEY(0) <= '0') then
				AEstado <= F;
				
				--coisas do contador
				--cont <= x"0000000“;
				cont <= x"0000000";
			Elsif (CLOCK_50'event AND CLOCK_50 = '1') then 
				cont <= cont + 1;
				if cont = x"2FAF07F" then
					cont <= x"0000000";
						C1Hz <= '1';
						AEstado <= PEstado;

					else
						C1Hz <= '0';
				end if;
			end if;
		
	end process;
	
process(AEstado, KEY(0))
	begin
		case AEstado is
			when F =>
			HEX0 <= "0001110";
			HEX1 <= "0001110";
			HEX2 <= "0001110";
			HEX3 <= "0001110";
			HEX4 <= "0001110";
			HEX5 <= "0001110";
			
			LEDR(9 downto 0) <= "0101010101";
			PEstado <= E;
				
			when E =>
			HEX0 <= "0000110";
			HEX1 <= "0000110";
			HEX2 <= "0000110";
			HEX3 <= "0000110";
			HEX4 <= "0000110";
			HEX5 <= "0000110";
			
			LEDR(9 downto 0) <= "1010101010";
			PEstado <= D;
			
			when D =>
			HEX0 <= "0100001";
			HEX1 <= "0100001";
			HEX2 <= "0100001";
			HEX3 <= "0100001";
			HEX4 <= "0100001";
			HEX5 <= "0100001";
			LEDR(9 downto 0) <= "0101010101";

			PEstado <= C;
			
			when C =>
			HEX0 <= "1000110";
			HEX1 <= "1000110";
			HEX2 <= "1000110";
			HEX3 <= "1000110";
			HEX4 <= "1000110";
			HEX5 <= "1000110";
			LEDR(9 downto 0) <= "1010101010";

			PEstado <= B;
			
			when B =>
			HEX0 <= "0000011";
			HEX1 <= "0000011";
			HEX2 <= "0000011";
			HEX3 <= "0000011";
			HEX4 <= "0000011";
			HEX5 <= "0000011";
						LEDR(9 downto 0) <= "0101010101";

			PEstado <= A;
			
			when A =>
			HEX0 <= "0001000";
			HEX1 <= "0001000";
			HEX2 <= "0001000";
			HEX3 <= "0001000";
			HEX4 <= "0001000";
			HEX5 <= "0001000";
			LEDR(9 downto 0) <= "1010101010";

			PEstado <= NOVE;
			
			when NOVE =>
			HEX0 <= "0010000";
			HEX1 <= "0010000";
			HEX2 <= "0010000";
			HEX3 <= "0010000";
			HEX4 <= "0010000";
			HEX5 <= "0010000";
						LEDR(9 downto 0) <= "0101010101";

			PEstado <= OITO;
			
			when OITO =>
			
			HEX0 <= "0000000";
			HEX1 <= "0000000";
			HEX2 <= "0000000";
			HEX3 <= "0000000";
			HEX4 <= "0000000";
			HEX5 <= "0000000";
			LEDR(9 downto 0) <= "1010101010";

			PEstado <= SETE;
			
			when SETE =>
			HEX0 <= "1111000";
			HEX1 <= "1111000";
			HEX2 <= "1111000";
			HEX3 <= "1111000";
			HEX4 <= "1111000";
			HEX5 <= "1111000";
						LEDR(9 downto 0) <= "0101010101";

			PEstado <= SEIS;
			
			when SEIS =>
			HEX0 <= "0000010";
			HEX1 <= "0000010";
			HEX2 <= "0000010";
			HEX3 <= "0000010";
			HEX4 <= "0000010";
			HEX5 <= "0000010";
			LEDR(9 downto 0) <= "1010101010";

			PEstado <= CINCO;
			
			when CINCO =>
			HEX0 <= "0010010";
			HEX1 <= "0010010";
			HEX2 <= "0010010";
			HEX3 <= "0010010";
			HEX4 <= "0010010";
			HEX5 <= "0010010";
						LEDR(9 downto 0) <= "0101010101";

			PEstado <= QUATRO;
			
			when QUATRO =>
			HEX0 <= "0011001";
			HEX1 <= "0011001";
			HEX2 <= "0011001";
			HEX3 <= "0011001";
			HEX4 <= "0011001";
			HEX5 <= "0011001";
			LEDR(9 downto 0) <= "1010101010";

			PEstado <= TRES;
			
			when TRES =>
			HEX0 <= "0110000";
			HEX1 <= "0110000";
			HEX2 <= "0110000";
			HEX3 <= "0110000";
			HEX4 <= "0110000";
			HEX5 <= "0110000";
						LEDR(9 downto 0) <= "0101010101";

			PEstado <= DOIS;
			
			when DOIS =>
			HEX0 <= "0100100";
			HEX1 <= "0100100";
			HEX2 <= "0100100";
			HEX3 <= "0100100";
			HEX4 <= "0100100";
			HEX5 <= "0100100";
			LEDR(9 downto 0) <= "1010101010";

			PEstado <= UM;
			
			when UM =>
			HEX0 <= "1111001";
			HEX1 <= "1111001";
			HEX2 <= "1111001";
			HEX3 <= "1111001";
			HEX4 <= "1111001";
			HEX5 <= "1111001";
						LEDR(9 downto 0) <= "0101010101";

			PEstado <= ZERO;
			
			when ZERO =>
			HEX0 <= "1000000";
			HEX1 <= "1000000";
			HEX2 <= "1000000";
			HEX3 <= "1000000";
			HEX4 <= "1000000";
			HEX5 <= "1000000";
			LEDR(9 downto 0) <= "1010101010";

			PEstado <= F;
			
		end case;
	end process;
end FSM;
