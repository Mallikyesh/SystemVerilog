module bcdud(
             input logic clk, rst, ud,
             output logic [3:0]q
             );
logic [27:0]count;
always_ff@(posedge clk)
begin
count <= count +1;             
if(count[27]==1)
    count<=0;
end
always_ff@(posedge count[27], negedge rst)
begin
if(!rst)
q<=4'b0000;
else if(ud==0)
    if(q==4'b1001)
        q<=0;
    else
        q<=q+1;
else
    if(q==0)
        q<=4'b1001;
    else
        q<=q-1;
end
endmodule