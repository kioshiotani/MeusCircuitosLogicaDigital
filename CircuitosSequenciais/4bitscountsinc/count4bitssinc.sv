module count4bitssinc (input clk, reset, output [3:0] Q);
    wire [3:0] nQ;
    wire w0, w1;

    FFT f0 (1'b1, clk, reset, Q[0], nQ[0]);
    FFT f1 (Q[0], clk, reset, Q[1], nQ[1]);
    
    and (w0, Q[0], Q[1]);
    
    FFT f2 (w0, clk, reset, Q[2], nQ[2]);
    
    and (w1, Q[2], w0);

    FFT f3 (w1, clk, reset, Q[3], nQ[3]);

endmodule

module FFT (input T, clk, reset, output Q, nQ);
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
