// priority encoder test bench
module pencoder_test();
logic en;
logic [7:0] Din;
logic [2:0] Dout;
pencoder dut(en, Din, Dout);
initial begin
    en = 1; // always 1
    Din = 8'b00000001;
    #10 Din = 8'b0000001X;
    #10 Din = 8'b000001XX;
    #10 Din = 8'b00001XXX;
    #10 Din = 8'b0001XXXX;
    #10 Din = 8'b001XXXXX;
    #10 Din = 8'b01XXXXXX;
    #10 Din = 8'b1XXXXXXX;
    #10 $finish;
end;

endmodule