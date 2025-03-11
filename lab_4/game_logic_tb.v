`timescale 1ns / 1ps

module game_logic_tb;

// Testbench Signals
reg clk;
reg rst;
reg roll;
reg [3:0] dice1, dice2;
wire win;
wire loss;
wire [3:0] point;
wire point_active;

// Instantiate the game logic module
game_logic uut (
    .clk(clk),
    .rst(rst),
    .roll(roll),
    .dice1(dice1),
    .dice2(dice2),
    .win(win),
    .loss(loss),
    .point(point),
    .point_active(point_active)
);

// Clock Generation
always #5 clk = ~clk; // 10ns clock period (100 MHz)

// Testbench Process
initial begin
    $display("Starting Game Logic Test...");

    // Initialize Inputs
    clk = 0;
    rst = 1;
    roll = 0;
    dice1 = 4'd0;
    dice2 = 4'd0;

    // Reset System
    #20;
    rst = 0;
    #10;

    // First Roll - Win Condition (7)
    dice1 = 4'd3; dice2 = 4'd4;
    roll = 1; #10; roll = 0;
    #50;
    if (win) $display("Test Passed: Instant Win Detected!");

    // Reset System
    rst = 1; #10; rst = 0; #10;

    // First Roll - Loss Condition (2)
    dice1 = 4'd1; dice2 = 4'd1;
    roll = 1; #10; roll = 0;
    #50;
    if (loss) $display("Test Passed: Instant Loss Detected!");

    // Reset System
    rst = 1; #10; rst = 0; #10;

    // First Roll - Enter Point Phase (5)
    dice1 = 4'd2; dice2 = 4'd3;
    roll = 1; #10; roll = 0;
    #50;

    // Rolling Point Number to Win
    dice1 = 4'd2; dice2 = 4'd3;
    roll = 1; #10; roll = 0;
    #50;
    if (win) $display("Test Passed: Player Won After Point!");

    // End Simulation
    $stop;
end

endmodule
