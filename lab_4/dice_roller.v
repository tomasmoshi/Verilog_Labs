module dice_roller(
    input clk, //clock signal to generate random values
    input roll_button, //a push button input that triggers the dice roll
    // two 4-bit register to store the value of the dice
    output reg[3:0] dice1,
    output reg[3:0] dice2,
);

//random number generator that holds a pseudo-random value that changes with every clock cycle.
// LFSRs to generate random numbers (initialized with non-zero values)
    reg [7:0] lfsr1 = 8'b10101011; 
    reg [7:0] lfsr2 = 8'b11001101; 

// LFSR feedback function
    wire feedback1 = lfsr1[7] ^ lfsr1[5] ^ lfsr1[4] ^ lfsr1[3];
    wire feedback2 = lfsr2[7] ^ lfsr2[5] ^ lfsr2[4] ^ lfsr2[3];

// modded (% 6) to map them into a dice range (1 to 6).
// clk switching from 0 to 1
always @(posedge clk) begin
    //if roll button is pressed
    if (roll_button) begin
        //discard out of range values
        if (lfsr1 >252) lfsr1 <= lfsr1>>1;
        if (lfsr2 >252) lfsr2 <= lfsr2>>1;
        //generate a random number between 1 and 6 for each dice
        lfsr1 <= lfsr1 % 6 + 1;
        lfsr2 <= lfsr2 % 6 + 1;
    end
end


