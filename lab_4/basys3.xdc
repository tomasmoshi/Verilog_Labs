## Clock and Reset
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN V17 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## Button Inputs (JA1 - JA4)
set_property PACKAGE_PIN J1 [get_ports roll]
set_property PACKAGE_PIN L2 [get_ports toggle_player]
set_property PACKAGE_PIN J2 [get_ports score_mode_switch]
set_property PACKAGE_PIN G2 [get_ports current_player]
set_property IOSTANDARD LVCMOS33 [get_ports {roll toggle_player score_mode_switch current_player}]

## Seven-Segment Display Outputs (JB1 - JC6)
set_property PACKAGE_PIN A14 [get_ports seg[0]]
set_property PACKAGE_PIN A16 [get_ports seg[1]]
set_property PACKAGE_PIN B15 [get_ports seg[2]]
set_property PACKAGE_PIN B16 [get_ports seg[3]]
set_property PACKAGE_PIN C15 [get_ports seg[4]]
set_property PACKAGE_PIN C16 [get_ports seg[5]]
set_property PACKAGE_PIN K17 [get_ports seg[6]]
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0] seg[1] seg[2] seg[3] seg[4] seg[5] seg[6]}]

## LED Outputs
set_property PACKAGE_PIN U16 [get_ports win_led]
set_property PACKAGE_PIN U18 [get_ports loss_led]
set_property PACKAGE_PIN T17 [get_ports score_mode_led]
set_property IOSTANDARD LVCMOS33 [get_ports {win_led loss_led score_mode_led}]
