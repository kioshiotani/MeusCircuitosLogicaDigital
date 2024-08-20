// TOP ///////////////////////////////////////////
module FFDposedgereset (input D, clock, reset, output Q, nQ);
  wire clk;
  assign clk = ~clock;
  wire wl1;
  wire trash;
  latchD latch1 (D, clk, wl1, trash);
  latchD_reset latch2 (wl1, ~clk, reset, Q, nQ);
endmodule
/////////////////////////////////////////////////

// LatchD ////////////////////////////////////
module latchD(input wire D, En, output Q, nQ);
  wire DEn, nDEn;  
  nand(DEn, D, En);
  nand(nDEn, ~D, En);
  nand(Q, DEn, nQ);
  nand(nQ, nDEn, Q);
endmodule
/////////////////////////////////////////////

// LatchD_reset /////////////////////////////
module latchD_reset(input wire D, En, reset, output Q, nQ);
  wire DEn, nDEn;
  wire mux1, mux2;
  
  nand(DEn, D, En);
  nand(nDEn, ~D, En);

  mux_2_to_1E i1 (DEn, 1'b0, reset, mux1);
  mux_2_to_1E i2 (nDEn, 1'b1, reset, mux2);

  nand(Q, mux1, nQ);
  nand(nQ, mux2, Q);

endmodule
// Para dar reset, reset de ser igual a 1
/////////////////////////////////////////////

// mux2to1 ///////////////////////////////////
module mux_2_to_1E (input x0, x1, S, output F);
    // Se 0, entao x0, caso contrario x1
    wire nS, x0andnS, x1andS;
    
    not(nS, S);

    and(x0andnS, x0, nS);
    and(x1andS, x1, S);

    or(F, x0andnS, x1andS);
endmodule
//////////////////////////////////////////////