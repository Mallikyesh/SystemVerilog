module bcd_tb();
logic  clk, rst, ud;
logic [3:0]q;
bcdud dut( clk, rst, ud, q);
initial begin
clk=0;
forever #10 clk=~clk;
end
initial begin
rst=0; ud=0; #100
rst=1; ud=0; #300
rst=1; ud=1; #300
$finish;
end
endmodule