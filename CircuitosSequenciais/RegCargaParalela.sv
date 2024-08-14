module latchD(input wire D, En, 
              output Q, nQ);
  wire DEn, nDEn;  
  nand(DEn, D, En);
  nand(nDEn, ~D, En);
  nand(Q, DEn, nQ);
  nand(nQ, nDEn, Q);
endmodule

module FFDposedge (input D, clock, 
                   output Q, nQ);
  wire clk;
  assign clk = ~clock;
  wire wl1;
  wire trash;
  latchD latch1 (D, clk, wl1, trash);
  latchD latch2 (wl1, ~clk, Q, nQ);
endmodule

module RegCargaParalela (input SerInput, load, clk,
                         input [3:0] ParInput,
                         output [3:0] Q);
  
  wire inFFD0, inFFD1, inFFD2, inFFD3;
  wire [3:0] trash;
  
  mux2to1 mux3 (SerInput, ParInput[3], load, inFFD3);
  mux2to1 mux2 (Q[3], ParInput[2], load, inFFD2);
  mux2to1 mux1 (Q[2], ParInput[1], load, inFFD1);
  mux2to1 mux0 (Q[1], ParInput[0], load, inFFD0);
  
  FFDposedge FFD3 (inFFD3, clk, Q[3], trash[3]);
  FFDposedge FFD2 (inFFD2, clk, Q[2], trash[2]);
  FFDposedge FFD1 (inFFD1, clk, Q[1], trash[1]);
  FFDposedge FFD0 (inFFD0, clk, Q[0], trash[0]);
  
endmodule

module mux2to1 (input w0, w1, s, 
                output out);
  
  assign out = s ? w1 : w0;
  
endmodule
  

