module johnsonCounter (clk, Q, reset);
	parameter n = 12;
	input reset;
	input clk;
	output [n-1:0] Q;
	
	genvar i;

	ffd f0 (~Q[n-1], clk, reset, Q[0]);
	ffd fn (Q[n-2], clk, reset, Q[n-1]);

	generate
		for (i = 1; i < n-1; i = i + 1) begin
			ffd f (Q[i-1], clk, reset, Q[i]);
		end
	endgenerate
endmodule

module ffd (input D, clk, reset, output Q);
	always @(posedge clk, posedge reset) begin
		if (reset) begin
			Q <= 0;
		end
		else begin
			Q <= D;
		end
	end
endmodule
