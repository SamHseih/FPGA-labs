module count_00_99(clk, reset, enable, count1_out, count0_out, carry);
input	clk, reset, enable;
output[3:0] count1_out, count0_out;
output	carry = carry1 & carry0;
wire	carry0, carry1;
count_0_9 C1(clk, reset, 1'b1, count0_out, carry0);
count_0_9 C2(clk, reset, carry0, count1_out, carry1);
endmodule