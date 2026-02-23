module count_00_23_bcd(clk, reset, enable, count1, count0, carry);
input clk, reset, enable;
output[3:0] count1, count0;
reg[3:0] count1, count0;
output carry;
//~~~~~your code~~~~~~~ 23
assign carry = (count1 == 4'b0010 && count0 == 4'b0011) ? 1 : 0;

always@ (posedge clk or posedge reset)begin
	if(reset) begin
		count1 = 4'd0; //00
		count0 = 4'd0;
	end
	else if(enable == 1'b1) begin
	if (count1 == 4'b0010 && count0 == 4'b0011) begin// 23
		count1 = 4'd0; //00
		count0 = 4'd0;
	end
	else if(count0 == 4'b1001 ) begin
		count1 = count1 + 4'b0001; //0++ 0
		count0 = 4'd0;
	end
	else
		count0 = count0 + 4'd1;
	end
end
endmodule
