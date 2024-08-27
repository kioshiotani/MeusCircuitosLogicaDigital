module BCDcounter(input En, clk, clear, output [7:0] Q);
    wire load0, load1;
    wire and0, and1;
    wire Z0, Z1;

    and(and0, Q[0], Q[2]);
    or(load0, clear, and0);

    countParalelCharge c0 (En, load0, clk, 3'b000, Q[3:0], Z0);

    and(and1, Q[4], Q[7]);
    or(load1, clear, and1);
    countParalelCharge c1 (and0, load1, clk, 3'b000, Q[7:4], Z1);
endmodule





module countParalelCharge(En, load, clk, C, Q, Z);
	parameter N = 4;
	input En, load, clk;
	input [N-1:0] C;
	output [N-1:0] Q;
	output Z;

	wire [N-1:0] xr;
	wire [N-1:0] mx;
	wire [N-1:1] ad;

	xor(xr[0], En, Q[0]);
	mux2to1 m0 (xr[0], C[0], load, mx[0]);
	ffd f (mx[0], clk, Q[0]);
	
	and(ad[1], Q[0], En);
	xor(xr[1], ad[1], Q[1]);
	mux2to1 m (xr[1], C[1], load, mx[1]);
	ffd f1 (mx[1], clk, Q[1]);

	genvar i;
	generate
		for (i = 2; i < N; i = i + 1) begin
			and(ad[i], Q[i-1], ad[i-1]);  
			xor(xr[i], ad[i], Q[i]);
			mux2to1 m (xr[i], C[i], load, mx[i]);
			ffd f (mx[i], clk, Q[i]);
		end
	endgenerate

	assign Z = ad[N-1];

endmodule



module ffd (input D, clk, output reg Q);
	always @(posedge clk) begin
		Q = D;
	end
endmodule

module mux2to1 (input w0, w1, S, output out);
	assign out = S ? w1 : w0;
endmodule
