module threebitscountS (input clk, reset, output [2:0] Q, output [2:0] nQ); // TOP

  FFT_posedgeResetB Q0 (1'b1, clk, reset, Q[0], nQ[0]);
  FFT_posedgeResetB Q1 (1'b1, nQ[0], reset, Q[1], nQ[1]);
  FFT_posedgeResetB Q2 (1'b1, nQ[1], reset, Q[2], nQ[2]);

endmodule

// FFT_posedgeResetB /////////////////////////////////////////
module FFT_posedgeResetB (input T, clk, reset, output Q, nQ);
    always @ (posedge reset, posedge clk) begin
        if (reset) begin
            Q = 0;
            nQ = ~Q;
        end
        else begin
            Q = T ? ~Q : Q;
            nQ = ~Q;
        end
    end
endmodule
/////////////////////////////////////////////////////////////