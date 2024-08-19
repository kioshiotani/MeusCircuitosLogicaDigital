module FFDposedge (input D, clock, output Q, nQ);
  wire clk;
  assign clk = ~clock;
  wire wl1;
  wire trash;
  latchD latch1 (D, clk, wl1, trash);
  latchD latch2 (wl1, ~clk, Q, nQ);
endmodule

// LatchD //////////////////////////////////////////
module latchD(input wire D, En, output Q, nQ);
  wire DEn, nDEn;  
  nand(DEn, D, En);
  nand(nDEn, ~D, En);
  nand(Q, DEn, nQ);
  nand(nQ, nDEn, Q);
endmodule
/////////////////////////////////////////////////////
