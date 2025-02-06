module FPCVT_Pin_Descriptions (
);
    input [11:0] D, //12 bit 
    output reg S, //sign conversion
    output reg [2:0] E, //12
    output reg [3:0] F.
    //wires
    reg [11:0] signedMagnitude;
    reg [3:0] significand_temp;
    reg [3:0] round_bit;
    integer  leading_zero;

    




endmodule