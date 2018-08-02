vcom uart_tx_f.vhdl
vcom uart_rx_f.vhdl
vcom uart_top.vhdl
vsim uart_top 
add wave *

force -freeze sim:/uart_top/en 0 0
force -freeze sim:/uart_top/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/uart_top/TX_IN 8'h48 0
run
run
run
force -freeze sim:/uart_top/en 1 0
run
run
run
force -freeze sim:/uart_top/en 0 0
run 10200

force -freeze sim:/uart_top/en 0 0
force -freeze sim:/uart_top/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/uart_top/TX_IN 8'h45 0
run
run
run
force -freeze sim:/uart_top/en 1 0
run
run
run
force -freeze sim:/uart_top/en 0 0
run 10200

force -freeze sim:/uart_top/en 0 0
force -freeze sim:/uart_top/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/uart_top/TX_IN 8'h4C 0
run
run
run
force -freeze sim:/uart_top/en 1 0
run
run
run
force -freeze sim:/uart_top/en 0 0
run 10200

force -freeze sim:/uart_top/en 0 0
force -freeze sim:/uart_top/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/uart_top/TX_IN 8'h4C 0
run
run
run
force -freeze sim:/uart_top/en 1 0
run
run
run
force -freeze sim:/uart_top/en 0 0
run 10200

force -freeze sim:/uart_top/en 0 0
force -freeze sim:/uart_top/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/uart_top/TX_IN 8'h4F 0
run
run
run
force -freeze sim:/uart_top/en 1 0
run
run
run
force -freeze sim:/uart_top/en 0 0
run 10200