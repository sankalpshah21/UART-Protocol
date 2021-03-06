set_property IOSTANDARD LVCMOS33 [get_ports {RX_OUT[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RX_OUT[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RX_OUT[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RX_OUT[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RX_OUT[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RX_OUT[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RX_OUT[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RX_OUT[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {TX_IN[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {TX_IN[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {TX_IN[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {TX_IN[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {TX_IN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {TX_IN[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {TX_IN[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {TX_IN[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports en]
set_property IOSTANDARD LVCMOS33 [get_ports O_RX_Active]
set_property IOSTANDARD LVCMOS33 [get_ports O_RX_Done]
set_property IOSTANDARD LVCMOS33 [get_ports o_TX_Active]
set_property IOSTANDARD LVCMOS33 [get_ports o_TX_Done]
set_property PACKAGE_PIN Y9 [get_ports clk]
set_property PACKAGE_PIN P16 [get_ports en]
set_property PACKAGE_PIN M15 [get_ports {TX_IN[7]}]
set_property PACKAGE_PIN H17 [get_ports {TX_IN[6]}]
set_property PACKAGE_PIN H18 [get_ports {TX_IN[5]}]
set_property PACKAGE_PIN H19 [get_ports {TX_IN[4]}]
set_property PACKAGE_PIN F21 [get_ports {TX_IN[3]}]
set_property PACKAGE_PIN H22 [get_ports {TX_IN[2]}]
set_property PACKAGE_PIN G22 [get_ports {TX_IN[1]}]
set_property PACKAGE_PIN F22 [get_ports {TX_IN[0]}]
set_property PACKAGE_PIN U14 [get_ports {RX_OUT[7]}]
set_property PACKAGE_PIN U19 [get_ports {RX_OUT[6]}]
set_property PACKAGE_PIN W22 [get_ports {RX_OUT[5]}]
set_property PACKAGE_PIN V22 [get_ports {RX_OUT[4]}]
set_property PACKAGE_PIN U21 [get_ports {RX_OUT[3]}]
set_property PACKAGE_PIN U22 [get_ports {RX_OUT[2]}]
set_property PACKAGE_PIN T21 [get_ports {RX_OUT[1]}]
set_property PACKAGE_PIN T22 [get_ports {RX_OUT[0]}]
set_property PACKAGE_PIN Y11 [get_ports O_RX_Active]
set_property PACKAGE_PIN AA11 [get_ports O_RX_Done]
set_property PACKAGE_PIN Y10 [get_ports o_TX_Active]
set_property PACKAGE_PIN AA9 [get_ports o_TX_Done]

set_switching_activity -deassert_resets 

create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]
