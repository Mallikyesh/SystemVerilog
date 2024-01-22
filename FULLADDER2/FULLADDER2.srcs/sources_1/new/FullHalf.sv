`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2023 12:32:13
// Design Name: 
// Module Name: FULLADDER2
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
module halfadder(a,b,sum,carry);
input logic a,b;
output logic sum,carry;
xor (sum,a,b);
and (carry,a,b);
endmodule

module fulladder(a,b,cin,sum,carry);
input logic a,b,cin;
output logic sum,carry;
logic s1,c1,c2;
halfadder h1(.a(a),.b(b),.sum(s1),.carry(c1));

halfadder h2(.a(s1),.b(cin),.sum(sum),.carry(c2));

or(carry,c1,c2);
endmodule
