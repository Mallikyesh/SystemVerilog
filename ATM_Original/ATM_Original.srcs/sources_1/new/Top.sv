module Top_Module (
  input logic clk,          // System clock 100 MHz
  input logic Up_Button,   // Top button for deposit
  input logic Down_Button, // Bottom button for withdrawal
  input logic reset,       // Center button for resetting
  input logic [5:0] sw,    // 6 different bills ($1, $5, $10, $20, $50, $100)
  output logic [2:0] LED,  // For errors and warnings
  output logic [3:0] an,   // To enable the segments on Basys 3 board
  output logic [6:0] seg   // Seven-segment display
);

  parameter zero = 4'b0000;

  // All wires that connect the output of submodules to the input of other submodules
  logic clk_out;            // 100 Hz clock
  logic deposit;            // Triggered signal that indicates money was deposited into the bank
  logic withdrawal;         // Triggered signal that indicates money was withdrawn from the bank
  logic [3:0] mux_out;      // Output of the Multiplexer
  logic [1:0] counter_out;  // Output of the 2-bit counter
  logic [3:0] ones, tens, hundreds,thousands; // Number that will be displayed on the segment
  logic [7:0] amount_count; // Bill amount, $1, $5, etc.
  logic Up_deb, Down_deb;   // Debounced signal from the pushbuttons
  logic [7:0] amount;       // Displays the total balance/amount/count in the account, $0 to $255

  // #8 FPGA Project Playlist - Binary to BCD Conversion (lines 32 to 42)
  // https://youtu.be/YM8s4SfHBPU

  debounce U0(clk, Up_Button, Up_deb);
  debounce U1(clk, Down_Button, Down_deb);
  Binary_BCD_Converter U2(amount_count, ones, tens, hundreds);
  four_to_one_Mux U3(ones, tens, hundreds, zero, counter_out, mux_out);
  SlowClock_100Hz U4(clk, clk_out);
  eight_bit_counter U5(clk_out, counter_out);
  Decoder U6(counter_out, an);
  BCD_Seven_Segment U7(mux_out, seg);

  // Lines 45 and 47, triggered signal indicating whether money is deposited or withdrawn
  Deposit U8(clk, reset, Up_deb, deposit);
  Withdraw U9(clk, reset, Down_deb, withdrawal);

  // Lines 49, 52, ATM Functioning, LED warning in case of overflows
  counter U10(clk, reset, deposit, withdrawal, amount, amount_count, LED[1], LED[2]);
  ATM U11(sw, amount, LED[0]);

endmodule
