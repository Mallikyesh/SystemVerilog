module jkff_tb(

    );
    logic j,k;
    logic clk;
    logic q,qbar;
    jkff dut(.q(q),.qbar(qbar),.j(j),.k(k),.clk(clk));
    initial begin
    clk=0;
    forever #10 clk=~clk;
    end
    initial begin
    j=1; k=0;
    #100 j=0; k=1;
    #100 j=0; k=0;
    #100 j=1; k=1;
    #10
    $finish;
    
    end
    
endmodule