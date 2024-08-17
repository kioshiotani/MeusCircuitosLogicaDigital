// Top module
module FFJKposedge (input J, K, clk, output Q, nQ);
	wire muxW;

	mux_4_to_1 m0 (Q, 1'b0, 1'b1, nQ, J,  K, muxW);
	FFDposedge ffd (muxW, clk, Q, nQ);

endmodule

// FFD ////////////////////////////////////////////////
module latchD(input wire D, En, output Q, nQ); // LatchD
  wire DEn, nDEn;  
  nand(DEn, D, En);
  nand(nDEn, ~D, En);
  nand(Q, DEn, nQ);
  nand(nQ, nDEn, Q);
endmodule

module FFDposedge (input D, clock, output Q, nQ); // TOPFFD
  wire clk;
  assign clk = ~clock;
  wire wl1;
  wire trash;
  latchD latch1 (D, clk, wl1, trash);
  latchD latch2 (wl1, ~clk, Q, nQ);
endmodule
///////////////////////////////////////////////////////

// mux4to1 ////////////////////////////////////////////
module mux_4_to_1 (input x0, x1, x2, x3, S0, S1, output F); //top mux4to1
    // Estrutural
    wire mux0, mux1;

    mux_2_to_1E m0 (x0, x1, S1, mux0);
    mux_2_to_1E m1 (x2, x3, S1, mux1);

    mux_2_to_1E m3 (mux0, mux1, S0, F);

endmodule

module mux_2_to_1E (input x0, x1, S, output F); // mux2to1
    // Se 0, entao x0, caso contrario x1
    wire nS, x0andnS, x1andS;

    not(nS, S);

    and(x0andnS, x0, nS);
    and(x1andS, x1, S);

    or(F, x0andnS, x1andS);
endmodule
/////////////////////////////////////////////////
