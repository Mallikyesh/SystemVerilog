`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2023 12:14:49
// Design Name: 
// Module Name: JK_ff
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


module JK_ff( input logic clk, j, k, output logic q, qbar);
logic clkdiv;
logic[27:0]cout;
always_ff@(posedge clk)
begin
cout<=cout+1;
if(cout[27]==1)
begin
cout<=0;
end
end
always@(posedge cout[27])
begin
if(j==0&k==1)
begin
q<=0; qbar<=1;
end
else if(j==1&k==0)
begin
q<=1; qbar<=0;
end
else if(j==0&k==0)
begin
q<=q; qbar<=qbar;
end
else if(j==1&k==1)
begin
q=~q; qbar=~qbar;
end
end
endmodule