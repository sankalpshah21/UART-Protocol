library ieee;
use ieee.std_logic_1164.all;

entity uart_top is
	port(en,clk : IN std_logic; TX_IN : IN std_logic_vector(7 downto 0);
		o_TX_Active : out std_logic;
    		o_TX_Done   : out std_logic;
		RX_OUT : OUT std_logic_vector(7 downto 0); 
		O_RX_Done,O_RX_Active : OUT std_logic);
end uart_top;

architecture u1 of uart_top is
signal a:std_logic;
component uart_tx is

	port(en,clk : IN std_logic; TX_IN : IN std_logic_vector(7 downto 0) ;
		o_TX_Active : out std_logic;
    		o_TX_Serial : out std_logic; -- main serial out portd
		o_TX_Done   : out std_logic);
end component uart_tx;

component uart_rx is
	port(I_RX_Serial,clk : IN std_logic; RX_OUT : OUT std_logic_vector(7 downto 0); O_RX_Done,O_RX_Active : OUT std_logic);
end component uart_rx;
 begin
ad1: uart_tx port map(en,clk,TX_IN,o_TX_Active,a,o_TX_Done);
ad2: uart_rx port map(a,clk,RX_OUT,O_RX_Done,O_RX_Active);
end u1;
