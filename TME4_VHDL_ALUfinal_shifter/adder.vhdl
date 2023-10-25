library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
port (
    a, b : in unsigned(3 downto 0);
    s : out unsigned(3 downto 0)
);
end entity;

architecture adder_archi of adder is
begin
s <= a+b;
end adder_archi;


