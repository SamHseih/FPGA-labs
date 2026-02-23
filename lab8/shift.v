module 	shift(left, right, reset, unable, out, clk);
input 		left, right, reset, clk, unable;
output reg	[7:0]out;

always@(posedge clk or posedge reset)
begin
	if(reset)
		out<=8'b0000_1000;
	else if(unable) 		//碰撞狀態
 		out<=8'b0000_0000;
 	else if(left)//up
		out<= out<<1;
	else if(right)//down
		out<= out>>1;
 	else
  		out<=out;
end
endmodule
