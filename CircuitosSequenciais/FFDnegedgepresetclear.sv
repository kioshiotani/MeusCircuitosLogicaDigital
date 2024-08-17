module FFDnegedgepresetclear (input D, clk, preset_n, clear_n, output Q2, nQ);
  wire Q1, nQ1, Q2, nQ2;

  // LatchD1
  wire DEn1, nDEn1; // En = clk 
  nand(DEn1, D, clk);
  nand(nDEn1, ~D, clk);

  nand(Q1, DEn1, nQ1, preset_n);
  nand(nQ1, nDEn1, Q1, clear_n);

  // LatchD2
  wire DEn2, nDEn2;  
  nand(DEn2, Q1, ~clk);
  nand(nDEn2, nQ1, ~clk);

  nand(Q2, DEn2, nQ2, preset_n);
  nand(nQ2, nDEn2, Q2, clear_n);

endmodule


