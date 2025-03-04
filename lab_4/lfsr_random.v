`timescale 1ns / 1ps

module lfsr_random(
    input clk,
    input rst,
    input roll,
    output reg [3:0] dice1,
    output reg [3:0] dice2
);

    reg [3:0] lfsr1 = 4'b1011;
    reg [3:0] lfsr2 = 4'b1101;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            lfsr1 <= 4'b1011;
            lfsr2 <= 4'b1101;
            dice1 <= 4'd1;
            dice2 <= 4'd1;
        end else if (roll) begin
            lfsr1 <= {lfsr1[2:0], lfsr1[3] ^ lfsr1[2]};
            lfsr2 <= {lfsr2[2:0], lfsr2[3] ^ lfsr2[1]};
            
            dice1 <= (lfsr1 % 6) + 1;
            dice2 <= (lfsr2 % 6) + 1;
        end
    end
endmodule
