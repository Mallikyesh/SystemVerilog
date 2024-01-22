module siren_tb;

  // Define parameters
  parameter SIM_CLK_PERIOD = 10; // Simulation clock period (in time units)

  // Declare signals
  logic clk;
  logic speaker;
  logic [4:0] leds;

  // Instantiate the music module
  siren uut (
    .clk(clk),
    .speaker(speaker),
    .leds(leds)
  );

  // Clock generation
  always begin
    #SIM_CLK_PERIOD clk = ~clk; // Generate a 50% duty cycle clock
  end

  // Initial block to initialize signals
  initial begin
    clk = 0;
    speaker = 0;
    leds = 0;
    // Initialize simulation time to allow initial signal setup
    $finish;
  end

  // Monitor the speaker signal
  always @(posedge clk) begin
    $display("Time: %0t, Speaker: %b", $time, speaker);
  end

  // Monitor the LED signal
  always @(posedge clk) begin
    $display("Time: %0t, LEDs: %b", $time, leds);
  end

  // Stimulus generation
  initial begin
    // Run the simulation for a specific duration
    #500;

    // Stop the simulation
    $finish;
  end

endmodule

module main;
  // Instantiate the testbench
  music_tb tb;
  
  // Start the simulation
  initial begin
    $dumpfile("music_tb.vcd");
    $dumpvars(0, tb);
    $display("Simulation started");
    $timeformat(-9, 1, " ns", 0);
    $monitor("Time: %0t, CLK: %b", $time, tb.clk);
    $start(); // Start the simulation
  end

  // Finish the simulation
  initial begin
    $display("Simulation finished");
    $finish;
  end
endmodule
