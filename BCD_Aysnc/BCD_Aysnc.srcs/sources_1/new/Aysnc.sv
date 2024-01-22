module ABD(
input logic clk,
input logic rst,
output logic [3:0]q

    );
    logic [27:0]count;
     always_ff@(posedge clk)
       begin
       count<=count+1;
       if(count[27]==1)
       count<=0;
       end
    logic q0,q1,q2,q3;
    logic qn0,qn1,qn2,qn3;
    DFF DFF0(.clk(count[27]), .rst(rst), .d(qn0), .q(q0), .qn(qn0));
     DFF DFF1(.clk(q0), .rst(rst), .d(qn1), .q(q1), .qn(qn1));
      DFF DFF2(.clk(q1), .rst(rst), .d(qn2), .q(q2), .qn(qn2));
       DFF DFF3(.clk(q2), .rst(rst), .d(qn3), .q(q3), .qn(qn3));
    assign q={q0,q1,q2,q3};
endmodule
