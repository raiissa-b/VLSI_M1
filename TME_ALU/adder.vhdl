library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
port (
    a, b : in unsigned(3 downto 0);
    cin : in  unsigned;
    s : out unsigned(3 downto 0);
    cout: out  unsigned
);
end entity;

architecture adder_archi of adder is
signal tmp : std_logic_vector(4 downto 0);
begin
tmp <= std_logic_vector('0'&a+b+cin);
cout <= unsigned(tmp(4 downto 4));
s <= unsigned(tmp(3 downto 0));
end adder_archi;
