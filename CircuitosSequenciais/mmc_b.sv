module mmc_b (
	input ld, clk,
	input [31:0] i_a, i_b,
	output reg [31:0] res,
	output reg done);
	
	reg [31:0] a, b;
	reg en_a, en_b;

	always @(posedge clk) begin
		if (ld) begin
			a <= i_a;
			b <= i_b;
		end
		else begin
			if (a < b)
				a <= a + i_a;
			else
				b <= b + i_b;
		end
	end

	assign res = a;
	assign done = a == b;
endmodule

