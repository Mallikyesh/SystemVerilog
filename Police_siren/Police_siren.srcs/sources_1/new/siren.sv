module music (
  input logic clk,
  output logic speaker
);

logic [22:0] tone;

always_ff @(posedge clk) begin
  tone <= tone + 1;
end

logic [6:0] ramp = (tone[22] ? tone[21:15] : ~tone[21:15]);
logic [14:0] clkdivider = {2'b01, ramp, 6'b000000};

logic [14:0] counter;

always_ff @(posedge clk) begin
  if (counter == 0) begin
    counter <= clkdivider;
  end else begin
    counter <= counter - 1;
  end
end

always_ff @(posedge clk) begin
  if (counter == 0) begin
    speaker <= ~speaker;
  end
end

endmodule