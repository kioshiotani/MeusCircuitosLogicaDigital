// Mux de 2 entradas e 1 saida (Comportamental)

module mux_2_to_1C (input x0, x1, S, output F);
    // Se 0, entao x0, caso contrario x1
    always @(*) begin
        if (S == 0) begin
            F = x0;
        end
        else begin
            F = x1;
        end
    end 
endmodule
