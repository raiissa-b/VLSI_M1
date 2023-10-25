library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity Shifter is
port (
    shift_lsl : in std_logic;
    shift_lsr : in std_logic;
    shift_asr : in std_logic;
    shift_ror : in std_logic;
    shift_rrx : in std_logic;
    shift_val : in std_logic_vector(4 downto 0);

    din : in std_logic_vector(31 downto 0);
    cin : in std_logic;

    dout : out std_logic_vector(31 downto 0);
    cout : out std_logic;

    vdd : in bit;
    vss : in bit
);
end shifter;

architecture shifter_archi of Shifter is


begin

process

variable choose : std_logic_vector(4 downto 0);

begin

choose := shift_lsl & shift_lsr & shift_asr & shift_ror & shift_rrx;

case choose is
    when "10000" => dout <= std_logic_vector( shift_left(unsigned(din), to_integer(unsigned(shift_val)))); -- ne passe pas ici
    when others => dout <= "00000000000000000000000000000001";
end case;

wait;
end process;

end architecture;
