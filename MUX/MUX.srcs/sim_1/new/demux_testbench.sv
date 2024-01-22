module tb;

reg f;
reg [1:0] sel;
wire a,b,c,d;

demux_1 u0(.f(f), .sel(sel), .a(a), .b(b), .c(c), .d(d));

initial 
begin
#10 f=0; sel[0]=0; sel[1]=0;
#10 f=0; sel[0]=0; sel[1]=1;
#10 f=1; sel[0]=1; sel[1]=0;
#10 f=1; sel[0]=1; sel[1]=1;

end
endmodule