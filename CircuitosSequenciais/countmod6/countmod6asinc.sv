module countmod6asinc (input En, clk, rst, output [2:0] Q);
    wire w0, w1;
    wire reset;

    mux2to1 m (w1, 1'b0, rst, reset);

    fft f0 (En, clk, ~reset, Q[0]);
    fft f1 (Q[0], clk, ~reset, Q[1]);

    and(w0, Q[0], Q[1]);
    fft f2 (w0, clk, ~reset, Q[2]);

    nand(w1, Q[0], Q[2]);
endmodule

module fft (input T, clk, rst, output reg Q);
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            Q = 0;
        end
        else begin
            Q = T ? ~Q : Q;
        end
    end
endmodule

module mux2to1 (input w0, w1, S, output out);
	assign out = S ? w1 : w0;
endmodule