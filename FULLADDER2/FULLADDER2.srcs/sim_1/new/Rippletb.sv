`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2023 11:09:13
// Design Name: 
// Module Name: Rippletb
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


module Rippletb();
logic [3:0] sum;
logic cout;
logic [3:0] d1,d2;
logic cin;
rippleadder dut(.sum(sum),.cout(cout),.d1(d1),.d2(d2),.cin(cin));
initial
begin
d1=4'b0101;
d2=4'b1101;
cin=1'b01;

$finish;
end
endmodule
