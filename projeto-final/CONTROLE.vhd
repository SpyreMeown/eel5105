library ieee;
use ieee.std_logic_1164.all; 
---------------------------------------------------------------------

entity CONTROLE is
port(R1, R2, E1, E2, E3, E4, E5: out std_logic;
	  BTN0, BTN1, CLOCK_50, sw_error, end_game, end_time, end_round: in std_logic
	 );
end CONTROLE;

---------------------------------------------------------------------

architecture FSM of CONTROLE is

type STATES is (start, setup, play, check, result, next_round);
signal EAtual, PEstado: STATES;
signal reset, enter: std_logic;

---------------------------------------------------------------------

begin

reset <= BTN0;
enter <= BTN1;

	process(CLOCK_50, BTN0)--dar uma olhada no clock direito
		begin
			if(BTN0 = '0') then
				EAtual <= start;
			elsif (CLOCK_50'event AND CLOCK_50 ='1') then
					EAtual <= PEstado;
			end if;
	end process;
	
---------------------------------------------------------------------

process (EAtual, BTN0, BTN1)
begin
	case EAtual is
			
			when start =>
				R1 <= '1';
				R2 <= '1';
				E1 <= '0';
				E2 <= '0';
				E3 <= '0';
				E4 <= '0';
				E5 <= '0';
				if(enter = '1') then
					PEstado <= start;
				elsif(enter = '0') then
					PEstado <= setup;
				end if;
				 
			when setup =>
				R1 <= '0';
				R2 <= '0';
				E1 <= '0';
				E2 <= '1';
				E3 <= '0';
				E4 <= '0';
				E5 <= '0';
				if(enter = '1') then
					PEstado <= setup;
				elsif(enter = '0') then
					PEstado <= play;
				end if;
			
			when play =>
				R1 <= '0';
				R2 <= '0';
				E1 <= '1';
				E2 <= '0';
				E3 <= '0';
				E4 <= '0';
				E5 <= '0';
				 if(enter = '1' AND end_time = '0') then
					PEstado <= play;
				 elsif(enter = '0' AND end_time = '0') then
					PEstado <= check;
				 elsif(end_time = '1') then
					PEstado <= result;
				 end if;
			
			when check =>
				R1 <= '0';
				R2 <= '0';
				E1 <= '0';
				E2 <= '0';
				E3 <= '1';
				E4 <= '0';
				E5 <= '0';
					if(end_round = '1' OR sw_error = '1' OR end_game = '1') then
						PEstado <= result;
					elsif(end_round = '0' AND sw_error = '0' AND end_game = '0') then
						PEstado <= next_round;
					end if;
			
			when result =>
				R1 <= '0';
				R2 <= '0';
				E1 <= '0';
				E2 <= '0';
				E3 <= '0';
				E4 <= '1';
				E5 <= '1';
					if(enter = '1') then
						PEstado <= result;
					else 
						PEstado <= start;
					end if;
			
			when next_round =>
				R1 <= '1';
				R2 <= '0';
				E1 <= '0';
				E2 <= '0';
				E3 <= '0';
				E4 <= '1';
				E5 <= '0';
					if(enter = '1') then
						PEstado <= next_round;
					else
						PEstado <= play;
					end if;
		end case;
	end process;	
end FSM;
				
			
