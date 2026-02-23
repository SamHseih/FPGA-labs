module  	collision(clk, reset, red, green, coll);
input		clk, reset;
input		[7:0]red, green;
output reg 	coll;
always@(posedge clk or posedge reset)
begin
	if(reset)
		coll<=1'b0;
	else if((red & green) != 8'b0)    //發生碰撞
		coll<=1'b1;
	else
		coll<=coll;
end
endmodule
