module count4bitsEn (input En, Clear_n, clk, output [3:0] Q);
    wire nQ[3:0];
    wire a0, a1, a2;

    FFT f0 (En, clk, ~Clear_n, Q[0], nQ[0]);
    
    and(a0, Q[0], En);
    FFT f1 (a0, clk, ~Clear_n, Q[1], nQ[1]);

    and(a1, Q[1], a0);
    FFT f2 (a1, clk, ~Clear_n, Q[2], nQ[2]);

    and(a2, Q[2], a1);
    FFT f3 (a2, clk, ~Clear_n, Q[3], nQ[3]);


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
