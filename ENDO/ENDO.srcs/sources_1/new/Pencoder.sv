// priority encoder 
module pencoder (en,Din,Dout);
input logic en;
input logic [ 7 : 0 ] Din;
output logic [ 2 : 0 ] Dout;
always_comb
begin
Dout = 3'bZZZ;
if(en == 1)
begin
casex(Din)
8'b00000001 :Dout = 3'b000;
8'b0000001X :Dout = 3'b001;
8'b000001XX :Dout = 3'b010;
8'b00001XXX :Dout = 3'b011;
8'b0001XXXX :Dout = 3'b100;
8'b001XXXXX :Dout = 3'b101;
8'b01XXXXXX :Dout = 3'b110;
8'b1XXXXXXX :Dout = 3'b111;
endcase
end
end
endmodule