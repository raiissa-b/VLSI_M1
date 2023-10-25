library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_tb is
end alu_tb;

architecture simu of alu_tb is
signal op1, op2, res : std_logic_vector(31 downto 0);
signal cin  :  std_logic_vector(0 downto 0);
signal cmd  :   std_logic_vector(1 downto 0);
signal cout :  std_logic;
signal z    :  std_logic;
signal n    :  std_logic;
signal v    :  std_logic;
signal vdd  :  bit;
signal vss  :  bit;


begin

alu : entity work.alu

port map (
    op1  => op1,
    op2  => op2,
    cin  => cin,
    cmd  => cmd,
    res  => res,
    cout => cout,
    z    => z,
    n    => n,
    v    => v,
    vdd => vdd ,
    vss => vss);


process
begin
op1 <= "00000000000000000000000000000000", "10101010101010101010101010101010" after 100 ns, "01111111111111111111111111111111" after 200 ns, "00000000000000000000000000000000" after 300 ns, "00000000000000000000000000000010" after 400 ns, "00000000000000000000000000000000" after 600 ns, "00000000000000000000000000000010" after 700 ns, "00000000000000000000000000000001" after 800 ns;
op2 <= "00000000000000000000000000000000", "10001000100010001000100010001000" after 150 ns, "01111111111111111111111111111111" after 200 ns, "00000000000000000000000000000010" after 300 ns, "00000000000000000000000000000000" after 500 ns, "00000000000000000000000000000010" after 600 ns, "00000000000000000000000000000010" after 700 ns, "11111111111111111111111111111111" after 2000 ns;
cmd <=  "00", "01" after 300 ns, "10" after 500 ns, "11" after 700 ns;
cin <= "0";
wait;
end process;
end architecture;


