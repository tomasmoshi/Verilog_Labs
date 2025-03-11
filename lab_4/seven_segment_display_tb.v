`timescale 1ns / 1ps

module seven_seg_display_tb;

// Testbench Signals
reg clk;
reg rst;
reg [3:0] dice1;
reg [3:0] dice2;
reg [3:0] point;
reg point_active;
wire [6:0] seg;
wire [3:0] an;

// Instantiate the seven-segment display module
seven_seg_display uut (
    .clk(clk),
    .rst(rst),
    .dice1(dice1),
    .dice2(dice2),
    .point(point),
    .point_active(point_active),
    .seg(seg),
    .an(an)
);

// Clock Generation
always #5 clk = ~clk; // 10ns clock period (100 MHz)

// Testbench Process
initial begin
    $display("Starting Seven Segment Display Test...");

    // Initialize Inputs
    clk = 0;
    rst = 1;
    dice1 = 4'd3;
    dice2 = 4'd4;
    point = 4'd0;
    point_active = 0;

    // Reset System
    #20;
    rst = 0;
    #10;

    // Test Display of Dice 1
    dice1 = 4'd2;
    #50;
    $display("Dice 1 Displayed: %b", seg);

    // Test Display of Dice 2
    dice2 = 4'd5;
    #50;
    $display("Dice 2 Displayed: %b", seg);

    // Test Display of Point
    point = 4'd6;
    point_active = 1;
    #50;
    $display("Point Displayed: %b", seg);

    // End Simulation
    $stop;
end

endmodule
