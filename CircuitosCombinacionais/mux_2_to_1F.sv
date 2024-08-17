// Mux de 2 entradas e 1 saida (Funcional)

module mux_2_to_1F (input x0, x1, S, output F);
    // Se 0, entao x0, caso contrario x1
    assign F = S ? x1 : x0;
endmodule
