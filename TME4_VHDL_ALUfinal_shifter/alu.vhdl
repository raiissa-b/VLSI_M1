library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Alu is

    port (
            op1  : in  std_logic_vector(31 downto 0);
            op2  : in  std_logic_vector(31 downto 0);
            cin  : in  std_logic_vector(0 downto 0);
            cmd  : in  std_logic_vector(1 downto 0);
            res  : out std_logic_vector(31 downto 0);
            cout : out std_logic;
            z    : out std_logic;
            n    : out std_logic;
            v    : out std_logic;
            vdd  : in  bit;
            vss  : in  bit );

end Alu;

architecture alu_archi of Alu is
signal tmp2 : std_logic_vector(0 downto 0);
begin

process (cmd,op1,op2)
variable tmp : std_logic_vector(32 downto 0):="000000000000000000000000000000000";

begin
case cmd is

when "00" =>
tmp := std_logic_vector('0'&unsigned(op1)+unsigned(op2)+unsigned(cin));
cout <= tmp(32);
res <= tmp(31 downto 0);

when "01" =>
res <= op1 AND op2;

when "10" =>
res <= op1 OR op2;

when "11" =>
res <= op1 XOR op2;

when others =>
res <= tmp(31 downto 0);
end case;


if tmp = "000000000000000000000000000000000" then
z <= '1';
else
z <= '0';
end if;

if tmp(31) = '1' then
n <= '1';
else
n <= '0';
end if;


tmp2 <= op1(31 downto 31) XOR op2(31 downto 31);

if (tmp2 = "0") AND ((tmp(31 downto 31) /= (op1(31 downto 31))))  then
v <= '1';
else
v <= '0';
end if;

end process;
end architecture;
