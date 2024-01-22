module dlatch_tb();
logic d;
logic clk;
logic reset;
logic q;
dlatch d10(.d(d),.clk(clk),.reset(reset),.q(q));
initial begin
reset <=0;
d<=0;
clk<=0;
#10 reset<=1;
d<=0;
clk<=0;

#10
reset<=0;
d<=1;
clk<=1;
end
endmodule