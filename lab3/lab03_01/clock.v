module clock(clk, reset, enable, count5, count4, count3, count2, count1, count0, carry);
input clk, reset, enable;
output[3:0]count5, count4, count3, count2, count1, count0;
output carry;
wire[3:0]count5, count4, count3, count2, count1, count0;
wire carry, carry3, carry2, carry1, carry0;
assign carry = carry0 & carry1 & carry2 ;
assign carry3 = carry0 & carry1 ;
//module count_00_23_bcd(clk, reset, enable, count1, count0, carry);
count_00_23_bcd(clk, reset, carry3, count5, count4, carry2); //hour

//module count_00_59_bcd(clk, reset, enable, count1, count0, carry);
count_00_59_bcd(clk, reset, carry0, count3, count2, carry1); //minute
count_00_59_bcd(clk, reset, 1'b1, count1, count0, carry0); //second
endmodule
