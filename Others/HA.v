module HA(a,b,sum,cout);
input a,b;
output cout,sum;

assign cout = a & b;
assign sum = a ^ b ;

endmodule