module unsigned_acc_tb;
  logic [7:0] datain;
  logic clk;
  logic rst;
  logic [9:0] out;

  unsigned_acc uut(.datain(datain), .clk(clk), .rst(rst), .out(out));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin 
    rst = 0;
    #50 rst = 1; datain = 8'b11110000;
    #50 datain = 8'b10101111;
    #50 datain = 8'b10000000;
    #50 $finish;
  end
endmodule
