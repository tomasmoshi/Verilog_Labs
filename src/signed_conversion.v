`timescale 1ns / 1ps

module signed_conversion(D, S, signed_mag);

	 // Inputs
    input [11:0] D;

    // Outputs
    output reg S;
    output reg [11:0] signed_mag;

    always @* begin
        // Extract sign bit (MSB)
        S = D[11];
        // Negative value
        if (S == 1) begin
				// Negate
            signed_mag = -D;
            // Handle T_min edge case
            if (signed_mag[11] == 1)
                signed_mag = 12'b011111111111;
        end else
            signed_mag = D;
    end

endmodule