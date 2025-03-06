`timescale 1ns / 1ps

module clock_divider #(
    parameter DIVISOR = 25000000 // Adjust for desired speed
)(
    input clk,
    input rst,
    output reg slow_clk
);


    reg [24:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            slow_clk <= 0;
        end else begin
            if (counter == DIVISOR) begin
                counter <= 0;
                slow_clk <= ~slow_clk;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
