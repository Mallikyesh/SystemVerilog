`timescale 1ns / 1ps

//module Decoder(
//    input logic[1:0] en,
//    output logic [3:0] an //changed from regular output to register
//    );
    
//    always @(en) //this is basically a counter that will go from 0 to 3
//        begin
//        case(en)
//        0: an=4'b1110;
//        1: an=4'b1101;
//        2: an=4'b1011;
//        3: an=4'b1111;
//        endcase
//        end
    
//endmodule
`timescale 1ns / 1ps

module Decoder(
    input logic[1:0] en,  // Changed to 2 bits
    output logic [3:0] an // Keeping the output as 4 bits
);

    always @(en)
    begin
        case(en[1:0])  // Extracting the least significant 2 bits for the case statement
            2'b00: an = 4'b1110;
            2'b01: an = 4'b1101;
            2'b10: an = 4'b1011;
            2'b11: an = 4'b1111;
            default: an = 4'b0000; // Add a default case to handle unexpected values
        endcase
    end

endmodule
