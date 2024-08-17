// Mux de 2 entradas e 1 saida (Estrutural)

module mux_2_to_1E (input x0, x1, S, output F);
    // Se 0, entao x0, caso contrario x1
    wire nS, x0andnS, x1andS;
    
    not(nS, S);

    and(x0andnS, x0, nS);
    and(x1andS, x1, S);

    or(F, x0andnS, x1andS);
endmodule
