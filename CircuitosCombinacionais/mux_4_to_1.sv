module mux_4_to_1 (input x0, x1, x2, x3, S0, S1, output F);
    // Estrutural
    wire mux0, mux1;
    
    mux_2_to_1E m0 (x0, x1, S1, mux0);
    mux_2_to_1E m1 (x2, x3, S1, mux1);

    mux_2_to_1E m3 (mux0, mux1, S0, F);

endmodule

module mux_2_to_1E (input x0, x1, S, output F);
    // Se 0, entao x0, caso contrario x1
    wire nS, x0andnS, x1andS;
    
    not(nS, S);

    and(x0andnS, x0, nS);
    and(x1andS, x1, S);

    or(F, x0andnS, x1andS);
endmodule
