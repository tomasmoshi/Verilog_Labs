module seven_seg_display(
    input clk, // control fresh rate of display
    input rst, // reset signal
    input [3:0] dice1,
    input [3:0] dice2,
    input [3:0] point, // point value
    input point_active, // point active signal
    output reg [6:0] seg, // 7-segment display output
    output reg [3:0] an // controls which digit is active
);
reg [1:0] display_state; // state to control which digit to display

function [6:0] decode_digit(input[3:0] digit);
    case(digit)
        4'd0: decode_digit = 7'b1000000; // 0
        4'd1: decode_digit = 7'b1111001; // 1
        4'd2: decode_digit = 7'b0100100; // 2
        4'd3: decode_digit = 7'b0110000; // 3
        4'd4: decode_digit = 7'b0011001; // 4
        4'd5: decode_digit = 7'b0010010; // 5
        4'd6: decode_digit = 7'b0000010; // 6
        default: decode_digit = 7'b1111111; // Blanks the display
    endcase

endfunction

always @(posedge clk) begin
    display_state <= display_state + 1; // cycle through display states
    case(display_state)
        2'b00: begin //display first
            an <= 4'b1110; // activate first digit
            if (point_active) begin
                seg <= decode_digit(point);
            end else begin
                seg <= decode_digit(dice1);
            end
        end
        2'b01: begin
            an <= 4'b1101; // activate second digit
            if (point_active) begin
                seg <= decode_digit(point);
            end else begin
                seg <= decode_digit(dice2);
            end
        end
        2'b10: begin
            an <= 4'b1011; // activate third digit
            seg <= decode_digit(point);
        end
        default: begin
            an <= 4'b1111; // deactivate all digits
            seg <= 7'b1111111; // turn off display
        end
    endcase
end
endmodule