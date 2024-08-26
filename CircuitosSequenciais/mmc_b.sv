module mmc_b (
	input ld, clk,
	input [31:0] i_a, i_b,
	output reg [31:0] res,
	output reg done);
	
	reg [31:0] a, b, a_i_a, b_i_b;
	reg en_a, en_b;

	always @(posedge clk) begin
		if (ld)
		begin
			a <= i_a;
			b <= i_b;
			en_a <= 0;
			en_b <= 0;
		end
		else begin
			en_a <= a < b;
			en_b <= b < a;

			a_i_a <= a + i_a;
			b_i_b <= b + i_b;
		
			if (en_a) begin
				a <= a_i_a;
			end
			else if (en_b) begin
				b <= b_i_b;
			end

			done <= a == b ? 1'b1 : 1'b0;
			res <= a;
		end
	end
endmodule

