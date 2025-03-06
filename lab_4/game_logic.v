`timescale 1ns / 1ps

module game_logic(
    input clk,
    input rst,
    input roll,
    input [3:0] dice1,
    input [3:0] dice2,
    output reg win,
    output reg loss,
    output reg [3:0] point,
    output reg point_active,
    input current_player
);

    reg [3:0] sum;
    reg [1:0] state;
    
    // State Definitions
    localparam IDLE = 2'b00;
    localparam FIRST_ROLL = 2'b01;
    localparam POINT_PHASE = 2'b10;
    localparam GAME_OVER = 2'b11;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum <= 4'd0;
            win <= 0;
            loss <= 0;
            point <= 4'd0;
            point_active <= 0;
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    if (roll) begin
                        sum <= dice1 + dice2;
                        state <= FIRST_ROLL;
                    end
                end

                FIRST_ROLL: begin
                    if (sum == 7 || sum == 11) begin
                        win <= 1;
                        state <= GAME_OVER;
                    end else if (sum == 2 || sum == 3 || sum == 12) begin
                        loss <= 1;
                        state <= GAME_OVER;
                    end else begin
                        point <= sum;
                        point_active <= 1;
                        state <= POINT_PHASE;
                    end
                end

                POINT_PHASE: begin
                    if (roll) begin
                        sum <= dice1 + dice2;
                        if (sum == point) begin
                            win <= 1;
                            state <= GAME_OVER;
                        end else if (sum == 7) begin
                            loss <= 1;
                            state <= GAME_OVER;
                        end
                    end
                end

                GAME_OVER: begin
                    if (rst) begin
                        win <= 0;
                        loss <= 0;
                        point <= 4'd0;
                        point_active <= 0;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule
