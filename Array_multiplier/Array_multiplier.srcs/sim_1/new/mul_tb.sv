module mul4_tb();
logic [3:0] a,b;
logic [7:0] y;
mul4 dut(a,b,y);
initial begin
a=4'd12;
b=4'd13;
#100
a=4'd15;
b=4'd15;
#100
a=4'd14;
b=4'd10;
#100
a=4'd12;
b=4'd13;
#100
a=4'd10;
b=4'd8;
#100 $finish;
end
endmodule