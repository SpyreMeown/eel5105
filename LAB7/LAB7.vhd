--Eu não escrevi esse aqui. Fiz o projeto separadamente, mas acabei perdendo o original. Esse é de autoria do meu colega da matéria. 

library ieee;
use ieee.std_logic_1164.all;

Entity lab7 is 

Port (
  Key:in std_logic_vector(3 downto 0);
  CLOCK_50: in std_logic;
  LEDR: out std_logic_vector(9 downto 0 )	

);
end lab7; 


architecture fsm of lab7 is 

  Type STATES is ( Ini, Esp1, Cor1,Esp2, Cor2, FimAb, FimFe);
  
  Signal AEstado, PEstado: STATES;
  
  Begin 
  
    Process (Key(3), CLOCK_50)
	 
     Begin
	  
      if (Key(3) <= '0') then
	     AEstado <= Ini; 
	    Elsif (CLOCK_50'event AND CLOCK_50 = '1') then 
	    AEstado <= PEstado;
	    End if;
		
	End process;
	
    Process (AEstado, Key (2 downto 0))
     Begin
    	 Case AEstado is 
			When Ini => --ESTADO INICO 
				LEDR (0)<= '0';
				If (Key(2 downto 0)= "111") then 
					PEstado <= Ini; 
				elsif  (Key(2 downto 0)= "011") then 
					PEstado <= Esp1; 
				else PEstado <= FimFe;
				end if;
				
			When Esp1 => --Estado espera SOLTAR 1 
				LEDR(0) <='0';
				if(Key(2)='0')then
					PEstado <=Esp1;
				elsif (Key(2)='1') then
					PEstado <= Cor1;
				End if;
				
			When Cor1 => --ESTADO CORRETO 1 
				LEDR (0)<='0';
			   if(Key (2 downto 0)="111") then
				   PEstado <= Cor1;
				elsif (Key(2 downto 0) = "110") then
					PEstado <= Esp2;
				else PEstado <= FimFe;	
				end if; 
				
			When Esp2 =>-- ESPERA SOLTAR 2
				LEDR(0) <= '0';
				if (Key(0)='0')then 
				   Pestado <=Esp2;
				elsif (Key(0)='1') then
					PEstado <= Cor2;
				end if;
				
			When Cor2 => --CORRETO 2
				LEDR(0) <='0';
				if(Key (2 downto 0)="111") then
				 PEstado <= Cor2;
				elsif(Key(2 downto 0)="101") then 
				  PEstado <= FimAb;
				else PEstado <= FimAb;
				end if;
				
			When FimAb => -- Fim ABERTO
				LEDR(0)<= '1';
				Pestado <= FimAb;
				
			When FimFe => --FIM FECHADO
				  LEDR(0) <= '0';
				  PEstado <=FimFe;
		end Case;		  
	end Process;			
end fsm;				
	
