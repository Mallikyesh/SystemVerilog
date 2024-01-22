module mux4(input logic[3:0]a,
input logic[1:0]s,
output logic o);

assign o=s[1]?(s[0]?a[3]:a[2]):(s[0]?a[1]:a[0]);

endmodule
