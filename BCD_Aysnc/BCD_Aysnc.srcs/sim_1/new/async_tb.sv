module ABD_tb(  );
     logic rst;
           logic clk;
        
           logic [3:0]q;
            ABD dut(.clk(clk),.rst(rst),.q(q));
           initial begin
           clk=0;
           forever #10 clk=~clk;
           end
           initial begin
           rst=0; 
           #100 rst=1;
           #100 rst=0;
         #500
                    
           
           $finish;
           end
endmodule
