`timescale 1ns / 1ps

module top_module_tb;

// Testbench Signals
reg clk;
reg rst;
reg roll;
reg toggle_player;
reg score_mode_switch;
wire [6:0] seg;
wire [3:0] an;
wire win_led;
wire loss_led;
wire score_mode_led;

// Instantiate the top module
top_module uut (
    .clk(clk),
    .rst(rst),
    .roll(roll),
    .toggle_player(toggle_player),
    .score_mode_switch(score_mode_switch),
    .seg(seg),
    .an(an),
    .win_led(win_led),
    .loss_led(loss_led),
    .score_mode_led(score_mode_led)
);

// Clock Generation
always #5 clk = ~clk; // 10ns clock period (100 MHz)

// Testbench Process
initial begin
    // Initialize Inputs
    clk = 0;
    rst = 1;
    roll = 0;
    toggle_player = 0;
    score_mode_switch = 0;

    // Reset System
    #20;
    rst = 0;
    #10;

    // Player 1 rolls the dice
    roll = 1; #10; roll = 0;
    #50;

    // Player 2 takes a turn
    toggle_player = 1; #10; toggle_player = 0;
    #20;

    // Player 2 rolls the dice
    roll = 1; #10; roll = 0;
    #50;

    // Check Win Condition
    if (win_led) begin
        $display("Test Passed: Player won!");
    end else if (loss_led) begin
        $display("Test Passed: Player lost!");
    end else begin
        $display("Test Running: No win/loss detected yet.");
    end

    // Enable Score Display
    score_mode_switch = 1; #10; score_mode_switch = 0;
    #50;

    // End Simulation
    $stop;
end

endmodule
