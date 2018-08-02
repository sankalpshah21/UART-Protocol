library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity uart_tx is
generic (
    g_CLKS_PER_BIT : integer := 10     -- Needs to be set correctly
    );
	port(en,clk : IN std_logic; TX_IN : IN std_logic_vector(7 downto 0) ;
		o_TX_Active : out std_logic;
    		o_TX_Serial : out std_logic; -- main serial out portd
		o_TX_Done   : out std_logic);
end uart_tx;

architecture u1 of uart_tx is

signal clkcnt : integer range 0 to g_CLKS_PER_BIT-1 := 0;
signal bitind : integer range 0 to 7 := 0;
begin
	process(en,clk)
	variable state : std_logic_vector(2 downto 0):="000";
	variable id : std_logic_vector(7 downto 0);

	begin 
		id:=TX_IN;
		--state:="000";
		if(rising_edge(clk)) then
		case state is
			when "000" =>--idle
				o_TX_Active <= '0';
          			o_TX_Serial <= '1';         
       				o_TX_Done   <= '0';
   				clkcnt <= 0;
          			bitind <= 0;
				if(en='1') then
					state:="001";
				else
					state:="000";
				end if;
			when "001" =>--start bit
				o_TX_Active <= '1';
          			o_TX_Serial <= '0';
				if(clkcnt < g_CLKS_PER_BIT-1)then
           				 clkcnt <= clkcnt + 1;
          				 state := "001";
       				else
         				 clkcnt <= 0;
          				 state := "010";
         			end if;
			when "010" =>--data transmission
				o_TX_Serial <= id(bitind);
				if(clkcnt < g_CLKS_PER_BIT-1)then
           				 clkcnt <= clkcnt + 1;
          				 state := "010";
       				else
         				 clkcnt <= 0;
					 if(bitind<7) then
					 	bitind <= bitind + 1;
					 	state := "010";
					 else
						state := "011";
						bitind <= 0;
					end if;
          				 
         			end if;
				
			when "011" =>--stop bit
				o_TX_Serial <= '1';
				if(clkcnt < g_CLKS_PER_BIT-1)then
           				 clkcnt <= clkcnt + 1;
          				 state := "011";
       				else
         				 clkcnt <= 0;
					 O_TX_Done<='1';
					 O_TX_Serial<='0';
					 state := "100";
          				 
         			end if;
			when "100" =>--cleanup
				O_TX_Serial <= '1';
				O_TX_Active <= '0';
				O_TX_Done <= '0';
				state := "000";
			when others => state := "000";
		end case;
		end if;
	end process;
end u1;