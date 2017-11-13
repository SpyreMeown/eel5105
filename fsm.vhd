library ieee;
use ieee.std_logic_1164.all;

entity fsm is
port(
    clock: in std_logic; -- internal
    enter: in std_logic; -- KEY1
    reset: in std_logic; -- not mapped yet
    restart_game: in std_logic; -- KEY0
    speed_select: in std_logic_vector(1 downto 0); -- SW(9..8);
    memory_select: in std_logic_vector(1 downto 0); -- SW(1..0);
    right_answer_count: out std_logic_vector(3 downto 0) -- later conversion
);
end fsm;

architecture behavior_fsm of fsm is
    type states is: init, setup, game, result;
    signal EA, PE : states;
begin

  P1: process(clock, reset)
  begin
    if reset = '0' then EA <= S0;
    EA <= PE;
  end process;

  P2: process(clock, EA)
  begin
    case EA is
    when init => if enter = '1' then PE <= setup;
    when setup => if enter = '1' then PE <= game;
                  -- implement UI and speed/memory selection procedures
    when game => if -- end of memory -- then PE <= result;
                 -- implement right_answer_count
    when result => -- implement show stuff
                 if enter = '1' then PE <= init;a
  end process;

end behavior_fsm;
