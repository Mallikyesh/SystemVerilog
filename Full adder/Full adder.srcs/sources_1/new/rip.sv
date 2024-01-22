`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2023 11:01:45
// Design Name: 
// Module Name: rippleadder
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


module rippleadder(output logic[3:0] sum, output logic cout,input logic [3:0]d1,d2, input logic cin);
logic c1,c2,c3;
fulladder FA1(sum[0],c1,d1[0],d2[0],cin);
fulladder FA2(sum[1],c2,d1[1],d2[1],c1);
fulladder FA3(sum[2],c3,d1[2],d2[2],c2);
fulladder FA4(sum[3],cout,d1[3],d2[3],c3);

endmodule
