module valid (clk, rst, press, press_valid);
input press, clk, rst;
output press_valid;
reg[5:0] gg;//(幾Bit取決於致能count數，由於七段顯示器需用到count6為了重複利用count訊號因此直接設6bit)
	
assign press_valid = ~(gg[5]||(~press));

always@(posedge clk or posedge rst)
begin
if(rst)gg<= 6'b0;
else
gg <= {gg[4:0],press};
end

endmodule
