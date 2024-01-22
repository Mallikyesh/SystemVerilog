module DFF(
input logic clk, input logic rst,d,
output logic q,qn
    );
    always_ff@(posedge clk, posedge rst)
    if(rst)
    begin
    q<=0;
    qn<=1;
    end
    else begin 
    q<=d; qn<=~d;
    end
endmodule
