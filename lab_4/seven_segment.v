module seven_seg_display(
    input clk, 
    input [3:0] dice1,
    input [3:0] dice2,
    input [3:0] point,
    input point_active,
    output reg [6:0] seg,
    output reg [3:0] an
);