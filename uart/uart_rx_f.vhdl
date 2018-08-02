library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity uart_rx is
generic (
    g_CLKS_PER_BIT : integer := 10     -- Needs to be set correctly
    );
	port(I_RX_Serial,clk : IN std_logic; RX_OUT : OUT std_logic_vector(7 downto 0); O_RX_Done,O_RX_Active : OUT std_logic);
end uart_rx;

architecture u1 of uart_rx is
signal clkcnt : integer range 0 to g_CLKS_PER_BIT-1 := 0;
signal index : integer range 0 to 7 := 0;
begin
	process(clk)
	variable state : std_logic_vector(2 downto 0):="000";
	variable O_Reg : std_logic_vector(7 downto 0);
	begin
		if(rising_edge(clk)) then
			case state is
				when "000" =>--idle
					O_RX_Done <= '0';
					O_RX_Active <= '0';
					if(I_RX_Serial = '0') then
						state := "001";
					else
						state := "000";
					end if;
				when "001" =>-- start confirm
					if(clkcnt < (g_CLKS_PER_BIT-1)/2) then
           					clkcnt <= clkcnt + 1;
          					state := "001";
       					else
         					clkcnt <= 0;
						O_Reg := "00000000";
          					if(I_RX_Serial = '0') then --start bit is confirm
							O_RX_Active <= '1';
							state := "010";
						else
							state := "000";
						end if;
         				end if;
				when "010" => --receive data
					O_Reg(index) := I_RX_Serial;
					if(clkcnt < g_CLKS_PER_BIT-1) then
           					clkcnt <= clkcnt + 1;
          					state := "010";
       					else
         					clkcnt <= 0;
          					if(index < 7) then
							index <= index + 1;
							state := "010";
						else
							index <= 0;
							state := "011";
						end if;
         				end if;
				when "011" => --stop bit
					if(I_RX_Serial = '1') then
						if(clkcnt < g_CLKS_PER_BIT-1)then
		           				 clkcnt <= clkcnt + 1;
		          				 state := "011";
		       				else
		         				 clkcnt <= 0;
							 O_RX_Done <='1';
							 O_RX_Active <= '0';
							 state := "000";
          				 
         					end if;
					end if;
				when others => state := "000";
			end case;	
			RX_OUT<=O_Reg;
		end if;
	end process;
end u1;