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
signal choose : std_logic_vector(4 downto 0);
signal doutTemp : std_logic_vector(32 downto 0);
--signal index : to_integer(unsigned(shift_val)) ;

begin

choose <= shift_lsl & shift_lsr & shift_asr & shift_ror & shift_rrx;

with choose select

doutTemp <= std_logic_vector( shift_left(unsigned('0'&din), to_integer(unsigned(shift_val)))) when "10000",
	    std_logic_vector( shift_right(unsigned(din&'0'), to_integer(unsigned(shift_val)))) when "01000",
	    std_logic_vector( shift_right(signed(din&'0'), to_integer(unsigned(shift_val)))) when "00100",

	    --'0'&(din(to_integer(unsigned(shift_val))-1 downto 0)&std_logic_vector( shift_right(unsigned(din), to_integer(unsigned(shift_val)))(31 downto to_integer(unsigned(shift_val))))) when "00010",
	    '0'&(din(to_integer(unsigned(shift_val))-1 downto 0)&din(31 downto to_integer(unsigned(shift_val)))) when "00010", --snif snif
	    '0'&din when "00001",
	    "000000000000000000000000000000000" when others;

with choose select
cout <= doutTemp(32) when "10000",
	doutTemp(0) when "01000",
	doutTemp(0) when "00100",
	doutTemp(0) when "00010",
	doutTemp(0) when "00001",
	'0' when others;

with choose select
  dout <= doutTemp(31 downto 0) when "10000",
	  doutTemp(32 downto 1) when "01000",
	doutTemp(32 downto 1) when "00100",
	doutTemp(31 downto 0) when "00010",
	cin&doutTemp(31 downto 1) when "00001",

	"00000000000000000000000000000000" when others;

end architecture;
