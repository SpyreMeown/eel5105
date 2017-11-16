library ieee;
use ieee.std_logic_1164.all;

entity Controle is 

port ( c, Tm, CLOCK_50: in std_logic;
            KEY: in std_logic_vector(3 downto 0);
            Tc, Tw, d: out std_logic);
end Controle;

architecture archControle of controle is
    type STATES is (inicio, eMoeda, eSoltar, soma, entrega);
    signal EAtual, PEstado: STATES;
begin
    process (CLOCK_50, KEY)
    begin
        if (KEY = "0000") then
        EAtual <= inicio;
        elsif (CLOCK_50'event AND CLOCK_50 = '1') then
        EAtual <= PEstado;
        end if;
    end process;
    
process (KEY, EAtual)
begin
    case EAtual is
        when inicio =>
            d <= '0';
            Tc <= '1';
            Tw <= '0';
            PEstado <= eMoeda;
            
        when eMoeda =>
            d <= '0';
            Tc <= '0';
            Tw <= '0';
            if (c = '0' AND Tm = '1') then
                PEstado <= eMoeda;
            elsif (c = '1') then
                PEstado <= eSoltar;
            elsif (c ='0' AND Tm = '0') then
                PEstado <= entrega;
            end if;
            
        when eSoltar =>
            d <= '0';
            Tc <= '0';
            Tw <= '0';
            if (c = '0') then
                PEstado <= eSoltar;
            elsif (c = '1') then
                PEstado <= soma;
            end if;
            
        when soma =>
            d <= '0';
            Tc <= '0';
            Tw <= '1';
            PEstado <= eMoeda;
        
        when entrega =>
            d <= '1';
            Tc <= '1';
            Tw <= '0';
            PEstado <= entrega;
 end case;
 end process;   
end archControle; 