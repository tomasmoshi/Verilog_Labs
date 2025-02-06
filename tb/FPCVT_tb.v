`timescale 1ns / 1ps

module FPCVT_tb;

	// Inputs
	reg [11:0] D;

	// Outputs
	wire S;
	wire [2:0] E;
	wire [3:0] F;

    fpcvt uut (
        .D(D),
        .S(S),
        .E(E),
        .F(F)
    );

    initial begin
        D = 12'b011111111111;
        #100;
        D = 12'b000101010101;
        #100;
        D = 12'b000001101001;
        #100;
        D = 12'b000001111101;
        #100;
    end

endmodule