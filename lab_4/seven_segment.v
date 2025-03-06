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
reg [19:0] refresh_counter;

function [6:0] decode_digit(input [3:0] digit);
    case(digit)
        4'd0: decode_digit = 7'b1000000; // 0
        4'd1: decode_digit = 7'b1111001; // 1
        4'd2: decode_digit = 7'b0100100; // 2
        4'd3: decode_digit = 7'b0110000; // 3
        4'd4: decode_digit = 7'b0011001; // 4
        4'd5: decode_digit = 7'b0010010; // 5
        4'd6: decode_digit = 7'b0000010; // 6
        default: decode_digit = 7'b1111111; // Turn off segment for invalid numbers
    endcase
endfunction


always @(posedge clk or posedge rst) begin
    if (rst) begin
        refresh_counter <= 0;
        display_state <= 0;
        an <= 4'b1111; // Turn off all digits
        seg <= 7'b1111111;
    end else begin
        refresh_counter <= refresh_counter + 1;
        if (refresh_counter[15] == 1) begin  // Slows down refresh
            display_state <= display_state + 1;
        end

        case(display_state)
            2'b00: begin // Display first digit
                an <= 4'b1110;
                if (point_active) begin
                    seg <= decode_digit(point);
                end else begin
                    seg <= decode_digit(dice1);
                end
            end
            2'b01: begin
                an <= 4'b1101;
                if (point_active) begin
                    seg <= decode_digit(point);
                end else begin
                    seg <= decode_digit(dice2);
                end
            end
            2'b10: begin
                an <= 4'b1011;
                seg <= decode_digit(point);
            end
            default: begin
                an <= 4'b1111;
                seg <= 7'b1111111;
            end
        endcase
    end
end
