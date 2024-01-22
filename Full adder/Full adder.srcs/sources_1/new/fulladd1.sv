module fulladder(SUMOUT,COUT,A,B,CIN );

output logic SUMOUT,COUT;
input logic A,B,CIN;
logic s1,c1,c2;
xor (s1,A,B);
xor (SUMOUT,s1,CIN);
and(C1,A,B);
and(C2,CIN,s1);
or(COUT,C1,C2);

endmodule