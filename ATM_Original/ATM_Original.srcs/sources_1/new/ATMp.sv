module ATM(
   input logic [5:0] switch,
   output logic [7:0] amount,
   output logic LED
   );

   logic [7:0] bill_amount = 8'b00000000;
   always @(switch)
   begin
        case(switch)
            1: bill_amount = 8'b00000001; // 1 rupee
            2: bill_amount = 8'b00000101; // 5 rupees
            4: bill_amount = 8'b00001010; // 10 rupees
            8: bill_amount = 8'b00010100; // 20 rupees
           16: bill_amount = 8'b00110010; // 50 rupees
           32: bill_amount = 8'b01100100; // 100 rupees
           default: bill_amount = 8'b00000000; // 0 rupees
        endcase
    end

    assign amount = bill_amount;
    logic active = 1'b0;
    always @(switch)
    begin
        case(switch)
            0, 1, 2, 4, 16, 32: active = 1'b0;
            default: active = 1'b1;
        endcase
    end
    
    assign LED = active;
endmodule
