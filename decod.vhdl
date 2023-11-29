
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

signal reg_r0 : std_logic_vector(31 downto 0);
signal reg_r1 : std_logic_vector(31 downto 0);
signal reg_r2 : std_logic_vector(31 downto 0);
signal reg_r3 : std_logic_vector(31 downto 0);
signal reg_r4 : std_logic_vector(31 downto 0);
signal reg_r5 : std_logic_vector(31 downto 0);
signal reg_r6 : std_logic_vector(31 downto 0);
signal reg_r7 : std_logic_vector(31 downto 0);
signal reg_r8 : std_logic_vector(31 downto 0);
signal reg_r9 : std_logic_vector(31 downto 0);
signal reg_r10 : std_logic_vector(31 downto 0);
signal reg_r11 : std_logic_vector(31 downto 0);
signal reg_r12 : std_logic_vector(31 downto 0);
signal reg_r13 : std_logic_vector(31 downto 0);
signal reg_r14 : std_logic_vector(31 downto 0);
signal reg_r15 : std_logic_vector(31 downto 0); --PC

signal reg_r0v : std_logic;
signal reg_r1v : std_logic;
signal reg_r2v : std_logic;
signal reg_r3v : std_logic;
signal reg_r4v : std_logic;
signal reg_r5v : std_logic;
signal reg_r6v : std_logic;
signal reg_r7v : std_logic;
signal reg_r8v : std_logic;
signal reg_r9v : std_logic;
signal reg_r10v : std_logic;
signal reg_r11v : std_logic;
signal reg_r12v : std_logic;
signal reg_r13v : std_logic;
signal reg_r14v : std_logic;
signal reg_r15v : std_logic;


begin

    process(ck, reset_n)

    begin

		if reset_n = '0' then
			reg_r0v <= '1';
			reg_r1v <= '1';
			reg_r2v <= '1';
			reg_r3v <= '1';
			reg_r4v <= '1';
			reg_r5v <= '1';
			reg_r6v <= '1';
			reg_r7v <= '1';
			reg_r8v <= '1';
			reg_r9v <= '1';
			reg_r10v <= '1';
			reg_r11v <= '1';
			reg_r12v <= '1';
			reg_r13v <= '1';
			reg_r14v <= '1';
			reg_r15v <= '1';

		elsif rising_edge(ck) then
			
			if inval1 = '1' then
				case inval_adr1 is 
					when "0000" => reg_r0v <= '0';
					when "0001" => reg_r1v <= '0';
					when "0010" => reg_r2v <= '0';
					when "0011" => reg_r3v <= '0';
					when "0100" => reg_r4v <= '0';
					when "0101" => reg_r5v <= '0';
					when "0110" => reg_r6v <= '0';
					when "0111" => reg_r7v <= '0';
					when "1000" => reg_r8v <= '0';
					when "1001" => reg_r9v <= '0';
					when "1010" => reg_r10v <= '0';
					when "1011" => reg_r11v <= '0';
					when "1100" => reg_r12v <= '0';
					when "1101" => reg_r13v <= '0';
					when "1110" => reg_r14v <= '0';
					when "1111" => reg_r15v <= '0';
					when others => reg_r15v <= '0'; 
				end case;
			end if;

			if inval2 = '1' then
				case inval_adr2 is 
					when "0000" => reg_r0v <= '0';
					when "0001" => reg_r1v <= '0';
					when "0010" => reg_r2v <= '0';
					when "0011" => reg_r3v <= '0';
					when "0100" => reg_r4v <= '0';
					when "0101" => reg_r5v <= '0';
					when "0110" => reg_r6v <= '0';
					when "0111" => reg_r7v <= '0';
					when "1000" => reg_r8v <= '0';
					when "1001" => reg_r9v <= '0';
					when "1010" => reg_r10v <= '0';
					when "1011" => reg_r11v <= '0';
					when "1100" => reg_r12v <= '0';
					when "1101" => reg_r13v <= '0';
					when "1110" => reg_r14v <= '0';
					when "1111" => reg_r15v <= '0';
					when others => reg_r15v <= '0';
				end case;
			end if;

			--Only EXEC

			if wadr1 = wadr2 and wen1 = '1' and wen2 = '1' then 
				
				case wadr1 is 
					when "0000" => reg_r0 <= wdata1;
					when "0001" => reg_r1 <= wdata1;
					when "0010" => reg_r2 <= wdata1;
					when "0011" => reg_r3 <= wdata1;
					when "0100" => reg_r4 <= wdata1;
					when "0101" => reg_r5 <= wdata1;
					when "0110" => reg_r6 <= wdata1;
					when "0111" => reg_r7 <= wdata1;
					when "1000" => reg_r8 <= wdata1;
					when "1001" => reg_r9 <= wdata1;
					when "1010" => reg_r10 <= wdata1;
					when "1011" => reg_r11 <= wdata1;
					when "1100" => reg_r12 <= wdata1;
					when "1101" => reg_r13 <= wdata1;
					when "1110" => reg_r14 <= wdata1;
					when "1111" => reg_r15 <= wdata1;
					when others => reg_r15v <= '0';
				end case;

				case wadr1 is 
					when "0000" => reg_r0v <= '0';
					when "0001" => reg_r1v <= '0';
					when "0010" => reg_r2v <= '0';
					when "0011" => reg_r3v <= '0';
					when "0100" => reg_r4v <= '0';
					when "0101" => reg_r5v <= '0';
					when "0110" => reg_r6v <= '0';
					when "0111" => reg_r7v <= '0';
					when "1000" => reg_r8v <= '0';
					when "1001" => reg_r9v <= '0';
					when "1010" => reg_r10v <= '0';
					when "1011" => reg_r11v <= '0';
					when "1100" => reg_r12v <= '0';
					when "1101" => reg_r13v <= '0';
					when "1110" => reg_r14v <= '0';
					when "1111" => reg_r15v <= '0';
					when others => reg_r15v <= '0';
				end case;


			--EXEC and MEM
			elsif wadr1 /= wadr1 then

				if wen1 = '1' then
					case wadr1 is 
						when "0000" => reg_r0 <= wdata1;
						when "0001" => reg_r1 <= wdata1;
						when "0010" => reg_r2 <= wdata1;
						when "0011" => reg_r3 <= wdata1;
						when "0100" => reg_r4 <= wdata1;
						when "0101" => reg_r5 <= wdata1;
						when "0110" => reg_r6 <= wdata1;
						when "0111" => reg_r7 <= wdata1;
						when "1000" => reg_r8 <= wdata1;
						when "1001" => reg_r9 <= wdata1;
						when "1010" => reg_r10 <= wdata1;
						when "1011" => reg_r11 <= wdata1;
						when "1100" => reg_r12 <= wdata1;
						when "1101" => reg_r13 <= wdata1;
						when "1110" => reg_r14 <= wdata1;
						when "1111" => reg_r15 <= wdata1;
						when others => reg_r15v <= '0';
					end case;
				end if;

				case wadr1 is 
					when "0000" => reg_r0v <= '0';
					when "0001" => reg_r1v <= '0';
					when "0010" => reg_r2v <= '0';
					when "0011" => reg_r3v <= '0';
					when "0100" => reg_r4v <= '0';
					when "0101" => reg_r5v <= '0';
					when "0110" => reg_r6v <= '0';
					when "0111" => reg_r7v <= '0';
					when "1000" => reg_r8v <= '0';
					when "1001" => reg_r9v <= '0';
					when "1010" => reg_r10v <= '0';
					when "1011" => reg_r11v <= '0';
					when "1100" => reg_r12v <= '0';
					when "1101" => reg_r13v <= '0';
					when "1110" => reg_r14v <= '0';
					when "1111" => reg_r15v <= '0';
					when others => reg_r15v <= '0';
				end case;

				if wen2 = '1' then
					case wadr2 is 
						when "0000" => reg_r0 <= wdata2;
						when "0001" => reg_r1 <= wdata2;
						when "0010" => reg_r2 <= wdata2;
						when "0011" => reg_r3 <= wdata2;
						when "0100" => reg_r4 <= wdata2;
						when "0101" => reg_r5 <= wdata2;
						when "0110" => reg_r6 <= wdata2;
						when "0111" => reg_r7 <= wdata2;
						when "1000" => reg_r8 <= wdata2;
						when "1001" => reg_r9 <= wdata2;
						when "1010" => reg_r10 <= wdata2;
						when "1011" => reg_r11 <= wdata2;
						when "1100" => reg_r12 <= wdata2;
						when "1101" => reg_r13 <= wdata2;
						when "1110" => reg_r14 <= wdata2;
						when "1111" => reg_r15 <= wdata2;
						when others => reg_r15v <= '0';
					end case;
				end if;

				case wadr2 is 
					when "0000" => reg_r0v <= '0';
					when "0001" => reg_r1v <= '0';
					when "0010" => reg_r2v <= '0';
					when "0011" => reg_r3v <= '0';
					when "0100" => reg_r4v <= '0';
					when "0101" => reg_r5v <= '0';
					when "0110" => reg_r6v <= '0';
					when "0111" => reg_r7v <= '0';
					when "1000" => reg_r8v <= '0';
					when "1001" => reg_r9v <= '0';
					when "1010" => reg_r10v <= '0';
					when "1011" => reg_r11v <= '0';
					when "1100" => reg_r12v <= '0';
					when "1101" => reg_r13v <= '0';
					when "1110" => reg_r14v <= '0';
					when "1111" => reg_r15v <= '0';
					when others => reg_r15v <= '0';
				end case;

				
			end if;

			if cspr_wb = '1' then
				if inval_czn = '1' then 
					reg_cry <= wcry;
					reg_neg <= wneg;
					reg_zero <= wzero;
				end if;
				
				if inval_ovr = '1' then 
					reg_ovr <= wovr;
				end if;
				
				reg_cznv <= inval_czn;
				reg_vv <= inval_ovr;

			end if;

			case radr1 is 
				when "0000" => reg_rd1 <= reg_r0;
				when "0001" => reg_rd1 <= reg_r1;
				when "0010" => reg_rd1 <= reg_r2;
				when "0011" => reg_rd1 <= reg_r3;
				when "0100" => reg_rd1 <= reg_r4;
				when "0101" => reg_rd1 <= reg_r5;
				when "0110" => reg_rd1 <= reg_r6;
				when "0111" => reg_rd1 <= reg_r7;
				when "1000" => reg_rd1 <= reg_r8;
				when "1001" => reg_rd1 <= reg_r9;
				when "1010" => reg_rd1 <= reg_r10;
				when "1011" => reg_rd1 <= reg_r11;
				when "1100" => reg_rd1 <= reg_r12;
				when "1101" => reg_rd1 <= reg_r13;
				when "1110" => reg_rd1 <= reg_r14;
				when "1111" => reg_rd1 <= reg_r15;
				when others => reg_r15v <= '0';
			end case;

			case radr1 is 
				when "0000" => reg_v1 <= reg_r0v;
				when "0001" => reg_v1 <= reg_r1v;
				when "0010" => reg_v1 <= reg_r2v;
				when "0011" => reg_v1 <= reg_r3v;
				when "0100" => reg_v1 <= reg_r4v;
				when "0101" => reg_v1 <= reg_r5v;
				when "0110" => reg_v1 <= reg_r6v;
				when "0111" => reg_v1 <= reg_r7v;
				when "1000" => reg_v1 <= reg_r8v;
				when "1001" => reg_v1 <= reg_r9v;
				when "1010" => reg_v1 <= reg_r10v;
				when "1011" => reg_v1 <= reg_r11v;
				when "1100" => reg_v1 <= reg_r12v;
				when "1101" => reg_v1 <= reg_r13v;
				when "1110" => reg_v1 <= reg_r14v;
				when "1111" => reg_v1 <= reg_r15v;
				when others => reg_r15v <= '0';
			end case;


			case radr2 is 
				when "0000" => reg_rd2 <= reg_r0;
				when "0001" => reg_rd2 <= reg_r1;
				when "0010" => reg_rd2 <= reg_r2;
				when "0011" => reg_rd2 <= reg_r3;
				when "0100" => reg_rd2 <= reg_r4;
				when "0101" => reg_rd2 <= reg_r5;
				when "0110" => reg_rd2 <= reg_r6;
				when "0111" => reg_rd2 <= reg_r7;
				when "1000" => reg_rd2 <= reg_r8;
				when "1001" => reg_rd2 <= reg_r9;
				when "1010" => reg_rd2 <= reg_r10;
				when "1011" => reg_rd2 <= reg_r11;
				when "1100" => reg_rd2 <= reg_r12;
				when "1101" => reg_rd2 <= reg_r13;
				when "1110" => reg_rd2 <= reg_r14;
				when "1111" => reg_rd2 <= reg_r15;
				when others => reg_r15v <= '0';
			end case;

			case radr2 is 
				when "0000" => reg_v2 <= reg_r0v;
				when "0001" => reg_v2 <= reg_r1v;
				when "0010" => reg_v2 <= reg_r2v;
				when "0011" => reg_v2 <= reg_r3v;
				when "0100" => reg_v2 <= reg_r4v;
				when "0101" => reg_v2 <= reg_r5v;
				when "0110" => reg_v2 <= reg_r6v;
				when "0111" => reg_v2 <= reg_r7v;
				when "1000" => reg_v2 <= reg_r8v;
				when "1001" => reg_v2 <= reg_r9v;
				when "1010" => reg_v2 <= reg_r10v;
				when "1011" => reg_v2 <= reg_r11v;
				when "1100" => reg_v2 <= reg_r12v;
				when "1101" => reg_v2 <= reg_r13v;
				when "1110" => reg_v2 <= reg_r14v;
				when "1111" => reg_v2 <= reg_r15v;
				when others => reg_r15v <= '0';
			end case;


			case radr3 is 
				when "0000" => reg_rd3 <= reg_r0;
				when "0001" => reg_rd3 <= reg_r1;
				when "0010" => reg_rd3 <= reg_r2;
				when "0011" => reg_rd3 <= reg_r3;
				when "0100" => reg_rd3 <= reg_r4;
				when "0101" => reg_rd3 <= reg_r5;
				when "0110" => reg_rd3 <= reg_r6;
				when "0111" => reg_rd3 <= reg_r7;
				when "1000" => reg_rd3 <= reg_r8;
				when "1001" => reg_rd3 <= reg_r9;
				when "1010" => reg_rd3 <= reg_r10;
				when "1011" => reg_rd3 <= reg_r11;
				when "1100" => reg_rd3 <= reg_r12;
				when "1101" => reg_rd3 <= reg_r13;
				when "1110" => reg_rd3 <= reg_r14;
				when "1111" => reg_rd3 <= reg_r15;
				when others => reg_r15v <= '0';
			end case;

			case radr3 is 
				when "0000" => reg_v3 <= reg_r0v;
				when "0001" => reg_v3 <= reg_r1v;
				when "0010" => reg_v3 <= reg_r2v;
				when "0011" => reg_v3 <= reg_r3v;
				when "0100" => reg_v3 <= reg_r4v;
				when "0101" => reg_v3 <= reg_r5v;
				when "0110" => reg_v3 <= reg_r6v;
				when "0111" => reg_v3 <= reg_r7v;
				when "1000" => reg_v3 <= reg_r8v;
				when "1001" => reg_v3 <= reg_r9v;
				when "1010" => reg_v3 <= reg_r10v;
				when "1011" => reg_v3 <= reg_r11v;
				when "1100" => reg_v3 <= reg_r12v;
				when "1101" => reg_v3 <= reg_r13v;
				when "1110" => reg_v3 <= reg_r14v;
				when "1111" => reg_v3 <= reg_r15v;
				when others => reg_r15v <= '0';
			end case;

			if inc_pc = '1' then
				reg_pc <= std_logic_vector(to_unsigned( to_integer(unsigned(reg_r15)) + 4, 4));
			else 
				reg_pc <= reg_r15;
			end if;

			reg_pcv <= reg_r15v;

		end if;
        
    end process;

end Behavior;
