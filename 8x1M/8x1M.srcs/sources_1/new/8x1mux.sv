module mux2x1(input logic a, b, select, output logic y);
    always_comb begin
        if (select)
            y = b;
        else
            y = a;
    end
endmodule

module mux4x1(input logic [3:0] a, b, c, d, select, output logic y);
    logic [1:0] sel1;
    logic sel2;
    
    assign sel1 = select[1:0];
    assign sel2 = select[2];
    
    mux2x1 u1(.a(a), .b(b), .select(sel1[0]), .y(y1));
    mux2x1 u2(.a(c), .b(d), .select(sel1[1]), .y(y2));
    
    mux2x1 u3(.a(y1), .b(y2), .select(sel2), .y(y));
endmodule

module mux8x1(input logic [7:0] a, b, c, d, e, f, g, h, select, output logic y);
    logic [1:0] sel1;
    logic sel2;
    
    assign sel1 = select[1:0];
    assign sel2 = select[2];
    
    mux4x1 u1(.a(a), .b(b), .c(c), .d(d), .select(sel1), .y(y1));
    mux4x1 u2(.a(e), .b(f), .c(g), .d(h), .select(sel1), .y(y2));
    
    mux2x1 u3(.a(y1), .b(y2), .select(sel2), .y(y));
endmodule


