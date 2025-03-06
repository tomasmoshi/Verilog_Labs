`timescale 1ns / 1ps

module state_machine(
    input clk,
    input rst,
    input roll,
    input score_mode_switch,
    input win,
    input loss,
    output reg [1:0] state
);

    // State Definitions
    localparam IDLE = 2'b00;
    localparam ROLLING = 2'b01;
    localparam SCORE_MODE = 2'b10;
    localparam GAME_OVER = 2'b11;
    
    always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= IDLE;
    end else begin
        case (state)
            IDLE: 
                if (roll) state <= ROLLING;
                else if (score_mode_switch) state <= SCORE_MODE;
            ROLLING: 
                if (win || loss) state <= GAME_OVER;
            SCORE_MODE: 
                if (!score_mode_switch) state <= IDLE;
            GAME_OVER: 
                if (rst) state <= IDLE;
            default: 
                state <= IDLE; // Catch unexpected states
        endcase
    end
end

endmodule
