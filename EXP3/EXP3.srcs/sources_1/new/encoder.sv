module encoder(output logic [2:0] binary_out , 
input logic [7:0] encoder_in , 
input logic enable 
); 
always_comb
ENCODER : begin
binary_out = 0;
if (enable) begin
case (encoder_in)
8'h01 : binary_out = 0;
8'h02 : binary_out = 1;
8'h04 : binary_out = 2;
8'h08 : binary_out = 3;
8'h10 : binary_out = 4;
8'h20 : binary_out = 5;
8'h40 : binary_out = 6;
8'h80 : binary_out = 7;
endcase
end
end
endmodule