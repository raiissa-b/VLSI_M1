library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_tb is
end adder_tb;


architecture archi of adder_tb is

signal A,B: unsigned(3 downto 0):= "0000";
signal S : unsigned(3 downto 0);
signal Cin : unsigned :='0';
signal Cout : unsigned;

begin

    my_add : entity work.adder
    port map( a => A, b => B, s => S, cin => Cin, cout => Cout) ;


A <= "0000", "1000" after 100 ns, "1111" after 200 ns ;
B <= "0000", "1010" after 150 ns, "1000" after 200 ns, "1111" after 500 ns;
Cin <= '0', '1' after 200 ns;

end archi;
