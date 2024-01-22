module seq_dec_moore(input logic clk, input logic rst, input logic d,
output logic y);
typedef enum logic [1:0]{s0,s1,s2,s3} statetype; 
statetype state,nextstate; 
always_ff@(posedge clk or posedge rst)
begin
if (rst==1)
state<=s0; 
else 
state<=nextstate;  
end
always_comb
case(state)
s0: if(d) nextstate=s1; else nextstate=s0;
s1: if(d) nextstate=s1; else nextstate=s2;
s2: if(d) nextstate=s3; else nextstate=s0;
s3: if(d) nextstate=s1; else nextstate=s0;
default: nextstate=s0;
endcase 
assign y=(state==s3); 
endmodule