module mul4(input logic [3:0] a,b,output logic [7:0] y);
logic [7:0] carry = 0;
logic [1:0] s1,c1,s2,c2,s3,c3;
fa f1(carry[1],a[1]&b[0],a[0]&b[1],y[1],carry[2]);
fa f2(carry[2],a[2]&b[0],a[1]&b[1],s1[0],c1[0]);
fa f3(s1[0],a[0]&b[2],0,y[2],carry[3]);
fa f4(carry[3],c1[0],a[3]&b[0],s1[1],c1[1]);
fa f5(s1[1],a[2]&b[1],a[1]&b[2],s2[0],c2[0]);
fa f6(s2[0],a[0]&b[3],0,y[3],carry[4]);
fa f7(c1[1],c2[0],carry[4],s2[1],c2[1]);
fa f8(s2[1],a[3]&b[1],a[2]&b[2],s3[0],c3[0]);
fa f9(s3[0],a[1]&b[3],0,y[4],carry[5]);
fa f10(carry[5],c3[0],c2[1],s3[1],c3[1]);
fa f11(s3[1],a[3]&b[2],a[2]&b[3],y[5],carry[6]);
fa f12(carry[6],c3[1],a[3]&b[3],y[6],carry[7]);
assign y[7]=carry[7];
assign y[0]=a[0]&b[0];
endmodule
