`timescale 1ns / 1ps
module FPCVT(D, S, E, F);

	// Inputs
	input [11:0] D;

	// Outputs
	output S;
	output [2:0] E;
	output [3:0] F;

	// Wires
	wire [11:0] signed_mag;
	wire fifth_bit;
	wire [2:0] exp;
	wire [3:0] sig;

	// Convert D from Two's Complement to Signed Magnitude
	signed_conversion m1 (.D(D), .S(S), .signed_mag(signed_mag));

	// Count leading zeroes and extract leading bits
	count_zeroes m2 (.D(signed_mag), .E(exp), .F(sig), .fifth_bit(fifth_bit));

	// Round
	handle_round m3 (.E_in(exp), .F_in(sig), .fifth_bit(fifth_bit), .E_out(E), .F_out(F));

endmodule