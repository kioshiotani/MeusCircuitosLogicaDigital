// Contador de 3 bits de decremento de borda positiva
module bits3countdecrease(input clk, reset, output [2:0] Q);
    wire [2:0] nQ;

    FFT f0 (1'b1, clk, reset, Q[0], nQ[0]);
    FFT f1 (1'b1, Q[0], reset, Q[1], nQ[1]);
    FFT f2 (1'b1, Q[1], reset, Q[2], nQ[2]);

endmodule
