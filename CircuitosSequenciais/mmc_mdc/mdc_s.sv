module mdc_s (
	input ld, clk,
	input [31:0] i_a, i_b,
	output [31:0] res,
	output done);

	wire [31:0] a, b, a_b, b_a;
	wire en_a, en_b;

	reg32 ra (ld, clk, en_a, i_a, a_b, a);
	reg32 rb (ld, clk, en_b, i_b, b_a, b);	

	assign en_a = b <= a;
	assign en_b = b > a;

	assign a_b = a - b;
	assign b_a = b - a;

	assign res = a + b;
	assign done = !(a && b);

endmodule

module reg32(
	input ld, clk, en,
	input [31:0] data_l, data_i,
	output reg [31:0] data_o);

	always @(posedge clk)
		if (ld) data_o = data_l;
		else if (en) data_o = data_i;
endmodule
