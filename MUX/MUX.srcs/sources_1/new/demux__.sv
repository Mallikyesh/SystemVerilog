module demux_1(input f, input[1:0] sel, output a,b,c,d);

assign a=f&~sel[1] & ~sel[0];
assign b=f & sel[1] & ~sel[0];
assign c=f & ~sel[1] &  sel[0];
assign d=f & sel[1] &  sel[0];

endmodule
