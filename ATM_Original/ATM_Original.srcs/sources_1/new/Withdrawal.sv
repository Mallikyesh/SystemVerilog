module Withdraw(
    input logic clk,
    input logic reset,
    input logic Down_Button,  // Input for withdrawing money
    output logic count_down   // Output signal to trigger decrement
);

    // Define states for the state machine
    typedef enum logic [1:0] {
        S00 = 2'b00,
        FLAG = 2'b01
    } state_t;

    // State variables
    state_t current_state, next_state;
    
    // Output control signal
    logic set_flag;

    //--------------------------------------------------------------------------------------------
    // Next state sequential logic
    //--------------------------------------------------------------------------------------------
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            // If reset, go to the initial state
            current_state <= S00;
        end else begin
            // Otherwise, update the state based on the next state
            current_state <= next_state;
        end
    end

    //--------------------------------------------------------------------------------------------
    // Next state combinational logic
    //--------------------------------------------------------------------------------------------
    always_comb begin
        case (current_state)
            S00: begin
                // If Down_Button is pressed, transition to FLAG state, otherwise stay in S00
                if (Down_Button) begin
                    next_state = FLAG;
                end else begin
                    next_state = S00;
                end
            end
            FLAG: begin
                // Always transition back to S00 from FLAG
                next_state = S00;
            end
            default: begin
                // Implied-latch free implementation: Default to S00
                next_state = S00;
            end
        endcase
    end

    //--------------------------------------------------------------------------------------------
    // Combinational output logic for each state
    //--------------------------------------------------------------------------------------------
    always_comb begin
        case (current_state)
            S00: begin
                // Set set_flag to 0 when in state S00
                set_flag = 1'b0;
            end
            FLAG: begin
                // Set set_flag to 1 when in state FLAG
                set_flag = 1'b1;
            end
            default: begin
                // Default case: Set set_flag to 0
                set_flag = 1'b0;
            end
        endcase
    end

    //--------------------------------------------------------------------------------------------
    // Output assignment
    //--------------------------------------------------------------------------------------------
    assign count_down = set_flag;

endmodule
