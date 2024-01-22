module seq_dec_moore_tb(
    );
    logic clk; logic rst; logic d; logic y;
    seq_dec_moore dut(.clk(clk),.rst(rst),.d(d),.y(y));
   initial begin clk=0;
    forever#5 clk=~clk;
    end
    
     initial begin
     rst=1; d=1; 
 //    #10 clk=1;
     #10 rst=0; 
   //  #10 clk=0;
     #20 d=0;
   //   #10 clk=1;
     #10 d=1;
    //  #10 clk=0;
     #10 d=0;
    //  #10 clk=1;
     #10 d=1;
    //  #10 clk=0;
     #10 d=1;
     // #10 clk=1;
     #10 d=0;
     // #10 clk=0;
     #10 d=0;
     #10 $finish;
     end
endmodule