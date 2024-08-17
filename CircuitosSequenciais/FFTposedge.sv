// top ///////////////////////////////////////////
module FFTposedge (input T, clk, teste, output Q, nQ);
	wire m;
 	
	mux_2_to_1E mux (Q, nQ, T, m);
    FFDposedge FFD (D, clk, Q, nQ);
    assign D = teste;
    assign D = m;


endmodule
/////////////////////////////////////////////////

// mux2to1 //////////////////////////////////////
module mux_2_to_1E (input x0, x1, S, output F);
    // Se 0, entao x0, caso contrario x1
    wire nS, x0andnS, x1andS;
    
    not(nS, S);

    and(x0andnS, x0, nS);
    and(x1andS, x1, S);

    or(F, x0andnS, x1andS);
endmodule
/////////////////////////////////////////////////

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

