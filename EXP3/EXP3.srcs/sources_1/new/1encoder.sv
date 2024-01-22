`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2023 12:39:06
// Design Name: 
// Module Name: 1encoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module encoder(output logic [2:0] binary_out , // 3 bit binary Output
input logic [7:0] encoder_in , // 8-bit Input
input logic enable // Enable for the encoder
); //--------------Code Starts Here-----------------------
always_comb
ENCODER : begin
binary_out = 0;
if (enable) begin
case (encoder_in)
8'h01 : binary_out = 0;
8'h02 : binary_out = 1;
8'h04 : binary_out = 2;
8'h08 : binary_out = 3;
8'h10 : binary_out = 4;
8'h20 : binary_out = 5;
8'h40 : binary_out = 6;
8'h80 : binary_out = 7;
endcase
end
end
endmodule
