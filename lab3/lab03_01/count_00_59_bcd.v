module count_00_59_bcd(clk, reset, enable, count1, count0, carry);
input clk, reset, enable;
output [3:0] count1, count0;
reg[3:0] count1, count0;
output carry;
wire carry = (count1 == 4'b0101 && count0 == 4'b1001) ? 1 : 0;
always@ (posedge clk or posedge reset)begin
	if(reset) begin
	count1 = 4'b0000; // 00
	count0 = 4'b0000;
	end
	else if(enable == 1'b1) begin
		if (count1 == 4'b0101 && count0 == 4'b1001) begin// 59
		count1 = 4'b0000; // 00
		count0 = 4'b0000;
		end
	else if(count0 == 4'b1001) begin
		count0 = 4'b0000;
		count1 = count1+ 1'b1;
	end
	else
		count0 = count0+ 1'b1;
	end
end
endmodule
