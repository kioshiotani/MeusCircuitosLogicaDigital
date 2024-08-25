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
