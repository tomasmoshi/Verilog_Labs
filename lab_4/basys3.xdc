## FPGA Board: Basys 3
## XDC File for Two-Player Casino Craps Game

## CLOCK SIGNAL
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## RESET BUTTON (JA1)
set_property PACKAGE_PIN JA1 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## GAME INPUT BUTTONS (JA2 - JA6)
set_property PACKAGE_PIN JA2 [get_ports roll]
set_property IOSTANDARD LVCMOS33 [get_ports roll]

set_property PACKAGE_PIN JA3 [get_ports toggle_player]
set_property IOSTANDARD LVCMOS33 [get_ports toggle_player]

set_property PACKAGE_PIN JA4 [get_ports score_mode_switch]
set_property IOSTANDARD LVCMOS33 [get_ports score_mode_switch]

## SEVEN-SEGMENT DISPLAY (JB1 - JC6)
set_property PACKAGE_PIN JB1 [get_ports {seg[0]}]
set_property PACKAGE_PIN JB2 [get_ports {seg[1]}]
set_property PACKAGE_PIN JB3 [get_ports {seg[2]}]
set_property PACKAGE_PIN JB4 [get_ports {seg[3]}]
set_property PACKAGE_PIN JB5 [get_ports {seg[4]}]
set_property PACKAGE_PIN JB6 [get_ports {seg[5]}]
set_property PACKAGE_PIN JC1 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports seg]

## ANODE CONTROL (JC2 - JC6)
set_property PACKAGE_PIN JC2 [get_ports {an[0]}]
set_property PACKAGE_PIN JC3 [get_ports {an[1]}]
set_property PACKAGE_PIN JC4 [get_ports {an[2]}]
set_property PACKAGE_PIN JC5 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports an]

## LED OUTPUTS (JXAC Line)
set_property PACKAGE_PIN JXAC1 [get_ports win_led]
set_property IOSTANDARD LVCMOS33 [get_ports win_led]

set_property PACKAGE_PIN JXAC2 [get_ports loss_led]
set_property IOSTANDARD LVCMOS33 [get_ports loss_led]

set_property PACKAGE_PIN JXAC3 [get_ports score_mode_led]
set_property IOSTANDARD LVCMOS33 [get_ports score_mode_led]
