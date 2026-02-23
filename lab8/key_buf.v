module key_buf(clk, rst, press, scan_code, key_code);
input clk, rst, press;
input[3:0] scan_code;//按下去的code
output[3:0]key_code;
reg[3:0]key_code;
always@(posedge clk or posedge rst) begin
if(rst)
	key_code= 4'b1111;// initial value
else
	//key_code= press ? scan_code:4'b1111; 跳一次
	key_code= press ? scan_code:4'b0000; //會 hold住
end
endmodule
