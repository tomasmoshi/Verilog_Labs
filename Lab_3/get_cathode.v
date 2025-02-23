`timescale 1ns/1ps

module get_cathode(
	input [3:0] display_state,
	output reg [6:0] cathode
);

	// Get constants
	`include "stopwatch_definitions.v"

	always @* begin
		// Translate state to cathode value
		case(display_state)
			0 : cathode = ST_0000;
			1 : cathode = ST_0001;
			2 : cathode = ST_0010;
			3 : cathode = ST_0011;
			4 : cathode = ST_0100;
			5 : cathode = ST_0101;
			6 : cathode = ST_0110;
			7 : cathode = ST_0111;
			8 : cathode = ST_1000;
			9 : cathode = ST_1001;
		endcase
	end

endmodule