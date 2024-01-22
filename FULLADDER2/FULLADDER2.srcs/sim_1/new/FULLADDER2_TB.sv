`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2023 12:46:23
// Design Name: 
// Module Name: HALFULLTB
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


module HALFULLLTB();
logic sum,carry;
logic a,b,cin;
fulladder dut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
initial 
begin
a = 0;
b = 0;
cin = 0;
#10; 
a = 0;
b = 0;
cin = 1;
#10; 
a = 0;
b = 1;
cin = 0;
#10; 
a = 0;
b = 1;
cin = 1;
#10; 
a = 1;
b = 0;
cin = 0;
#10; 
a = 1;
b = 0;
cin = 1;
#10; 
a = 1;
b = 1;
cin = 0;
#10; 
a = 1;
b = 1;
cin = 1;
#10; 

$finish;
end
endmodule