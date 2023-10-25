library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shifter_tb is
end shifter_tb;

architecture simu of shifter_tb is
signal shift_lsl :  std_logic;
signal shift_lsr :  std_logic;
signal shift_asr :  std_logic;
signal shift_ror :  std_logic;
signal shift_rrx :  std_logic;
signal shift_val :  std_logic_vector(4 downto 0);

signal din :  std_logic_vector(31 downto 0);
signal cin :  std_logic := '0';

signal dout :  std_logic_vector(31 downto 0);
signal cout :  std_logic;

signal vdd :  bit;
signal vss :  bit;

begin

shifter : entity work.shifter

port map (
     shift_lsl => shift_lsl,
     shift_lsr => shift_lsr,
     shift_asr => shift_asr,
     shift_ror => shift_ror,
     shift_rrx => shift_rrx,
     shift_val => shift_val,

     din => din,
     cin => cin,

     dout => dout,
     cout => cout,

     vdd => vdd,
     vss => vss
);

process
begin
din <= "10001000100010001000100010001011";
shift_val <= "00100", "00010" after 200 ns ,"00000" after 500 ns;
shift_lsl <= '0';
 shift_lsr <= '0';
 shift_asr <= '0';
 shift_ror <= '0';
 shift_rrx <= '1';
 cin <=  not cin after 50 ns;
wait;
end process;
end architecture;


