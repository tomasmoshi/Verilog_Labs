`timescale 1ns / 1ps

module led_control(
    input clk,
    input rst,
    input win,
    input loss,
    input score_mode,
    output reg win_led,
    output reg loss_led,
    output reg score_mode_led
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        win_led <= 0;
        loss_led <= 0;
        score_mode_led <= 0;
    end else begin
        win_led <= win;
        loss_led <= loss;
        score_mode_led <= score_mode;
    end
end
endmodule
