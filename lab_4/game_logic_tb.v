// game_logic_tb.v - Testbench for Game Logic Module
module game_logic_tb;
    reg clk;
    reg reset;
    reg roll;
    reg toggle_player;
    reg score_mode_switch;
    wire [6:0] seg;
    wire [3:0] an;
    wire win_led, loss_led, score_mode_led;

    // Instantiate the game_logic module with correct port mapping
    game_logic uut (
        .clk(clk),
        .reset(reset),
        .roll(roll),
        .toggle_player(toggle_player),
        .score_mode_switch(score_mode_switch),
        .seg(seg),
        .an(an),
        .win_led(win_led),
        .loss_led(loss_led),
        .score_mode_led(score_mode_led)
    );

    // Clock Generation
    always #5 clk = ~clk;  // 10ns period

    initial begin
        clk = 0; reset = 1; roll = 0; toggle_player = 0; score_mode_switch = 0;
        #10 reset = 0;
        #20 roll = 1;
        #20 roll = 0;
        #20 toggle_player = 1;
        #20 toggle_player = 0;
        #20 score_mode_switch = 1;
        #20 score_mode_switch = 0;
        #100 $finish;
    end
endmodule
