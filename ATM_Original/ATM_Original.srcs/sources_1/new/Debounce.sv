module debounce(
	input logic clk,
	input logic pushbutton,
	output logic pulse_out);

	logic [11:0] count;
	logic new_press;
	logic stable;
	logic now_stable;

	always @(posedge clk) begin
		if (pushbutton == new_press) begin
			if (count == 4095)
				stable <= pushbutton;
			else
				count <= count + 1;
		end
		
		else begin
			count <= 0;
			new_press <= pushbutton;
		end
   end


   always @(posedge clk) begin
         now_stable <= stable;
   end
 
   //Sends one shot pulse out if stable
   assign pulse_out = (now_stable == 0 & stable == 1);
   
endmodule