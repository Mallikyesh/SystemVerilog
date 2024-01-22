module test_mux;
    logic [7:0] data;
    logic [2:0] select;
    logic y;

    mux8x1 uut(
        .a(data[7:0]),
        .b(data[7:0]),
        .c(data[7:0]),
        .d(data[7:0]),
        .e(data[7:0]),
        .f(data[7:0]),
        .g(data[7:0]),
        .h(data[7:0]),
        .select(select),
        .y(y)
    );

    initial begin
        data = 8'b0000_1010; // Example input data
        select = 3'b000;    // Select line
        #100;
        select = 3'b001;    // Select line
        #100;
        select = 3'b010;    // Select line
        #100;
        select = 3'b011;    // Select line
        #10;
        select = 3'b100;    // Select line
        #100;
        select = 3'b101;    // Select line
        #100;
        select = 3'b110;    // Select line
        #100;          
        select = 3'b111;    // Select line
        #100;      
        $finish;
    end
endmodule
