// game_logic.v - Game Logic Module
module game_logic (
    input clk,
    input reset,
    input roll,
    input toggle_player,
    input score_mode_switch,
    output reg [6:0] seg,
    output reg [3:0] an,
    output reg win_led,
    output reg loss_led,
    output reg score_mode_led,
    output reg current_player
);

    reg [3:0] state;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= 4'b0000;
            current_player <= 0;
            win_led <= 0;
            loss_led <= 0;
            score_mode_led <= 0;
        end else begin
            if (roll) state <= state + 1;
            if (toggle_player) current_player <= ~current_player;
            if (score_mode_switch) score_mode_led <= ~score_mode_led;
        end
    end
    
    always @(*) begin
        case (state)
            4'b0000: seg = 7'b1111110; // 0
            4'b0001: seg = 7'b0110000; // 1
            4'b0010: seg = 7'b1101101; // 2
            4'b0011: seg = 7'b1111001; // 3
            4'b0100: seg = 7'b0110011; // 4
            4'b0101: seg = 7'b1011011; // 5
            4'b0110: seg = 7'b1011111; // 6
            4'b0111: seg = 7'b1110000; // 7
            4'b1000: seg = 7'b1111111; // 8
            4'b1001: seg = 7'b1111011; // 9
            default: seg = 7'b0000000; // Off
        endcase
        an = 4'b1110;
    end
endmodule
