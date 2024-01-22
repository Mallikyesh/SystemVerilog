module encoder_tb;
reg [7:0] encoder_in;
reg enable;
wire [2:0] binary_out;
encoder_using_case uut (binary_out,encoder_in, enable);
initial
begin
enable=1;
encoder_in = 8'b00000001; #10;
encoder_in = 8'b00000010; #10;
encoder_in = 8'b00000100; #10;
encoder_in = 8'b00001000; #10;
encoder_in = 8'b00010000; #10;
encoder_in = 8'b00100000; #10;
encoder_in = 8'b01000000; #10;
encoder_in = 8'b10000000; #10;
enable=0;
encoder_in = 8'b00000001; #10;
end
endmodule

