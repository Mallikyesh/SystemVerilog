`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2023 11:36:36
// Design Name: 
// Module Name: encoder_tb1
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


module encoder(en,Din,Dout);
input logic en;
input logic [ 7 : 0 ] Din;
output logic [ 2 : 0 ] Dout;
always_comb
begin
Dout = 3'bZZZ;
if(en == 1) // Active high enable
begin
//Dout = 3'bZZZ; // Initializing Dout to high Impedance
//end
//else
//begin
casex(Din)
8'b00000001 :Dout = 3'b000;
8'b0000001X :Dout = 3'b001;
8'b000001XX :Dout = 3'b010;
8'b00001XXX :Dout = 3'b011;
8'b0001XXXX :Dout = 3'b100;
8'b001XXXXX :Dout = 3'b101;
8'b01XXXXXX :Dout = 3'b110;
8'b1XXXXXXX :Dout = 3'b111;
endcase
end
end
endmodule
