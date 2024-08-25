module nBitsRingCounter (start, clk, Q);
	parameter n = 4;
	input start;
	input clk;
	output [n-1:0] Q;

	ffd f0 (Q[n-1], clk, start, 1'b0, Q[0]);

	genvar i;

	generate
		for (i = 1; i < n; i = i + 1) begin
			ffd f (Q[i-1], clk, 1'b0, start, Q[i]);
		end
	endgenerate


endmodule

module ffd (input D, clk, preset,  rst, output Q);
	always @(posedge clk, posedge rst, posedge preset) begin
		if (rst) begin
			Q = 0;
		end
		else if (preset) begin
			Q = 1;
		end
		else begin
			Q = D;
		end
	end
endmodule
