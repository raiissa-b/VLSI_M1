
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Reg is
	port(
	-- Write Port 1 prioritaire
		wdata1		: in Std_Logic_Vector(31 downto 0);
		wadr1			: in Std_Logic_Vector(3 downto 0);
		wen1			: in Std_Logic;

	-- Write Port 2 non prioritaire
		wdata2		: in Std_Logic_Vector(31 downto 0);
		wadr2		: in Std_Logic_Vector(3 downto 0);
		wen2		: in Std_Logic;

	-- Write CSPR Port
		wcry		: in Std_Logic;
		wzero		: in Std_Logic;
		wneg		: in Std_Logic;
		wovr		: in Std_Logic;
		cspr_wb		: in Std_Logic;

	-- Read Port 1 32 bits
		reg_rd1		: out Std_Logic_Vector(31 downto 0);
		radr1		: in Std_Logic_Vector(3 downto 0);
		reg_v1		: out Std_Logic;

	-- Read Port 2 32 bits
		reg_rd2		: out Std_Logic_Vector(31 downto 0);
		radr2		: in Std_Logic_Vector(3 downto 0);
		reg_v2		: out Std_Logic;

	-- Read Port 3 32 bits
		reg_rd3		: out Std_Logic_Vector(31 downto 0);
		radr3		: in Std_Logic_Vector(3 downto 0);
		reg_v3		: out Std_Logic;

	-- read CSPR Port
		reg_cry		: out Std_Logic;
		reg_zero	: out Std_Logic;
		reg_neg		: out Std_Logic;
		reg_cznv	: out Std_Logic;
		reg_ovr		: out Std_Logic;
		reg_vv		: out Std_Logic;

	-- Invalidate Port
		inval_adr1	: in Std_Logic_Vector(3 downto 0);
		inval1		: in Std_Logic;

		inval_adr2	: in Std_Logic_Vector(3 downto 0);
		inval2		: in Std_Logic;

		inval_czn	: in Std_Logic;
		inval_ovr	: in Std_Logic;

	-- PC
		reg_pc		: out Std_Logic_Vector(31 downto 0);
		reg_pcv		: out Std_Logic;
		inc_pc		: in Std_Logic;

	-- global interface
		ck				: in Std_Logic;
		reset_n		: in Std_Logic;
		vdd			: in bit;
		vss			: in bit);
end Reg;

architecture Behavior OF Reg is

component fifo_128b
	port(
		din			: in std_logic_vector(127 downto 0);
		dout			: out std_logic_vector(127 downto 0);

		-- commands
		push			: in std_logic;
		pop			: in std_logic;

		-- flags
		full			: out std_logic;
		empty			: out std_logic;

		reset_n		: in std_logic;
		ck			: in std_logic;
		vdd			: in bit;
		vss			: in bit);
end component;

component fifo_32b
	port(
		din			: in std_logic_vector(31 downto 0);
		dout			: out std_logic_vector(31 downto 0);

		-- commands
		push			: in std_logic;
		pop			: in std_logic;

		-- flags
		full			: out std_logic;
		empty			: out std_logic;

		reset_n		: in std_logic;
		ck			: in std_logic;
		vdd			: in bit;
		vss			: in bit);
end component;

signal reg_pc_tmp : std_logic_vector(31 downto 0);

begin

--Component instanciation

	port map (
					din(31 downto 0)  => reg_pc_tmp,

					dout(71)	 => exe_mem_lw,
					dout(70)	 => exe_mem_lb,
					dout(69)	 => exe_mem_sw,
					dout(68)	 => exe_mem_sb,

					dout(67 downto 64) => exe_mem_dest,
					dout(63 downto 32) => exe_mem_data,
					dout(31 downto 0)  => exe_mem_adr,

					push		 => exe_push,
					pop		     => mem_pop,

					empty		 => exe2mem_empty,
					full		 => exe2mem_full,

					reset_n	 => reset_n,
					ck		 => ck,
					vdd		 => vdd,
					vss		 => vss);

    process

    begin
        if (mem_pop = '1') then
            if (rising_edge(ck) and dec2exe_empty = '0') then
                if exe2mem_full = '0' then
                    reg_pc_tmp <= reg_pc;
                else
                    exe_pop <= '0';
                end if;
                if exe2mem_full = '0' then
                    wait;
                end if;
            end if;
        end if;
    end process;

    reg_cry <= wcry when reg_cznv = '1' else '0';
    reg_zero <= wzero when reg_cznv = '1' else '0';
    reg_neg <= wneg when reg_cznv = '1' else '0';
    reg_ovr <= wovr when reg_vv = '1' else '0';



    --???
    if wadr1 = wadr2 then
        reg_rd1 <= wdata1;
    else
        reg_rd1 <= wdata1;
        reg_rd3 <= wdata2;
    end if;





end Behavior;
