module unsigned_acc(input logic [7:0] datain, input logic clk, input logic rst, output logic [9:0] out );
logic [7:0]a;
logic [7:0]Acc;
logic [7:0]sum;
logic carry; logic [7:0]S;
assign a=datain;
always_ff @(posedge clk or negedge rst)
begin if(~rst)
begin
sum[7:0]<=0;
out[8]<=0;
out[9]<=0;
Acc<=0;
end
else
begin
Acc <=a;
{carry, S} <= Acc+sum;
sum<=S;
out[7:0]<=sum;
out[8]<=carry;
if (Acc[7]!= sum[7])
out[9]<=1;
else
out[9]<=0;
end
end
endmodule