`timescale 1ns / 1ps

module button_debouncer(
    input clk,
    input rst,
    input button_in,
    output reg button_out
);

    reg [15:0] counter;
    reg stable_state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            stable_state <= 0;
            button_out <= 0;
        end else begin
            if (button_in == stable_state) begin
                counter <= 0;
            end else begin
                counter <= counter + 1;
                if (counter == 16'hFFFF) begin
                    stable_state <= button_in;
                    button_out <= button_in;
                end
            end
        end
    end
endmodule
