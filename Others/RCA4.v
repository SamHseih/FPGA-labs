module RCA4(sum, c_out, a, b, c_in);
input [3:0]a, b;
input c_in;
output [3:0] sum;
output c_out;

FA M1(.a(a[0]),.b(b[0]),.sum(),.cin(),.cout());
wire c_in2, c_in3, c_in4;

FA G1(.sum(sum[0]), .cout(c_in2), .a(a[0]), .b(b[0]), .cin(c_in));
FA G2(.sum(sum[1]), .cout(c_in3), .a(a[1]), .b(b[1]), .cin(c_in2));
FA G3(.sum(sum[2]), .cout(c_in4), .a(a[2]), .b(b[2]), .cin(c_in3));
FA G4(.sum(sum[3]), .cout(c_out), .a(a[3]), .b(b[3]), .cin(c_in4));

endmodule