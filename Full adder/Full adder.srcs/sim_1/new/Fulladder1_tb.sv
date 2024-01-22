module FULLADDERTB();
logic SUMOUT,COUT;
logic A,B,CIN;
fulladder dut(.A(A),.B(B),.CIN(CIN),.SUMOUT(SUMOUT),.COUT(COUT));
initial 
begin
A = 0;
B = 0;
CIN = 0;
#10; 
CIN = 1;
#10;
B = 1; CIN = 0;
#10; CIN = 1;
#10; A = 1;B = 0; CIN = 0;
#10; 
CIN = 1;
#10;
B = 1; CIN = 0;
#10; CIN = 1;
$finish;
end
endmodule