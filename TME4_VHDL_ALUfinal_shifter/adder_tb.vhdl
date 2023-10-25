library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_tb is
end adder_tb;

architecture simu of adder_tb is
signal entree1, entree2, sortie: unsigned(3 downto 0);

begin

add0 : entity work.adder
port map (
    a => entree1,
    b => entree2,
    s => sortie
);

process
begin
for cpt1 in 0 to 15 loop
    entree1 <= to_unsigned(cpt1,4);
    for cpt2 in 0 to 15 loop
        entree2 <= to_unsigned(cpt2,4);
        wait for 5 ns;
    end loop;
end loop;
wait;
end process;
end architecture;


