module count_0_9(clk, reset, enable, count_out, carry);
input clk, reset, enable;
output[3:0] count_out;
output carry;
reg[3:0] count_out;
assign carry = (count_out== 4'b1001) ? 1 : 0;
always@ (posedge clk or posedge reset)begin
if(reset)
count_out = 4'b0;
else if(enable == 1) begin
if(count_out== 4'b1001)
//~~~~your code~~~~//count_out back to 0
	count_out = 4'd0;
else
//~~~~your code~~~~//count_out add 1
	count_out = count_out + 4'd1;
end
end
endmodule
