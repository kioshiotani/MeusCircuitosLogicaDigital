module latchD(input wire D, En, output Q, nQ);
  wire DEn, nDEn;  
  nand(DEn, D, En);
  nand(nDEn, ~D, En);
  nand(Q, DEn, nQ);
  nand(nQ, nDEn, Q);
endmodule

module FFDposedge (input D, clock, output Q, nQ);
  wire clk;
  assign clk = ~clock;
  wire wl1;
  wire trash;
  latchD latch1 (D, clk, wl1, trash);
  latchD latch2 (wl1, ~clk, Q, nQ);
endmodule

module regdesloc(input In, clk, output Q1, Q2, Q3, Q4);
  wire t1, t2, t3, t4;
  FFDposedge i1 (In, clk, Q1, t1);
  FFDposedge i2 (Q1, clk, Q2, t2);
  FFDposedge i3 (Q2, clk, Q3, t3);
  FFDposedge i4 (Q3, clk, Q4, t4);
  
endmodule