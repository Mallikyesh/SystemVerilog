module counter(
    input logic clk,
    input logic reset,
    input logic increment,
    input logic decrement,
    input logic [7:0] amount,
    output logic [7:0] count,
    output logic LED2,
    output logic LED3
);

    logic [7:0] current_count = 8'h00; // will do the math here, addition if deposit, subtraction if withdrawal

    // Computing the balance in the account after deposit or withdrawal
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            current_count <= 8'h00; // reset count to 0
        else if (increment && (count + amount) > count)
            current_count <= count + amount; // increased count by amount
        else if (decrement && amount <= count)
            current_count <= count - amount; // decrement count by amount
        else
            current_count <= count; // if no input, count remains the same
    end

    assign count = current_count;

    logic set2 = 1'b0;

    // Determine LED2, exceeds maximum account value, i.e., 255
    always_ff @(posedge clk or posedge reset) begin
        if (reset || increment && (count + amount) > count)
            set2 <= 1'b0;
        else if (increment && amount <= count)
            set2 <= 1'b0;
        else if (increment && (count + amount) < count)
            set2 <= 1'b1;
        else
            set2 <= LED2;
    end

    assign LED2 = set2;

    logic set3 = 1'b0;

    // Determine LED3, exceeds maximum account value, i.e., 255
    always_ff @(posedge clk or posedge reset) begin
        if (reset || increment && (count + amount) > count)
            set3 <= 1'b0;
        else if (increment && amount <= count)
            set3 <= 1'b0;
        else if (increment && amount > count)
            set3 <= 1'b1;
        else
            set3 <= LED3;
    end

    assign LED3 = set3;
endmodule
