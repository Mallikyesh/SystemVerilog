`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2023 12:40:59
// Design Name: 
// Module Name: Full
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


module fa(input logic a,b,carryin, output logic y,carryout);
assign y=a ^ b ^ carryin;
assign carryout = (a & b) | (a & carryin)|(b & carryin);
endmodule 