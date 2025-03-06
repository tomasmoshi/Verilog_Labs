`timescale 1ns / 1ps

module top_module(
    input clk,
    input rst,
    input roll,
    input toggle_player,
    input score_mode_switch,
    output [6:0] seg,
    output [3:0] an,
    output reg win_led,
    output reg loss_led,
    output reg score_mode_led
);
    
    wire [3:0] dice1, dice2;
    wire [3:0] point;
    wire win, loss, point_active;
    
    reg current_player;

    wire toggle_player_clean;
    button_debouncer debounce_toggle(
        .clk(clk),
        .rst(rst),
        .button_in(toggle_player),
        .button_out(toggle_player_clean)
    );

    
    // Clock Divider for game operations
    wire slow_clk;
    clock_divider clk_div(
        .clk(clk),
        .rst(rst),
        .slow_clk(slow_clk)
    );
    
    // LFSR Random Dice Generator
    lfsr_random dice_generator(
        .clk(slow_clk),
        .rst(rst),
        .roll(roll),
        .dice1(dice1),
        .dice2(dice2)
    );
    
    // Game Logic Module
    game_logic craps_game(
        .clk(slow_clk),
        .rst(rst),
        .roll(roll),
        .dice1(dice1),
        .dice2(dice2),
        .win(win),
        .loss(loss),
        .point(point),
        .point_active(point_active),
        .current_player(current_player)
    );
    
    // Seven-Segment Display Control
    seven_seg_display display_ctrl(
        .clk(slow_clk),
        .rst(rst),
        .dice1(dice1),
        .dice2(dice2),
        .point(point),
        .point_active(point_active),
        .seg(seg),
        .an(an)
    );
    
    // LED Control
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            current_player<=0;
            win_led<=0;
            loss_led<=0;
            score_mode_led<=0;
        end else begin
        if (toggle_player_clean)
            current_player <= ~current_player;
        win_led <= win;
        loss_led <= loss;
        score_mode_led <= score_mode_switch;
        end
    end
endmodule
