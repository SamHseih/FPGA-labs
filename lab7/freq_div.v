module freq_div(clk, rst, clk_out);
input clk,rst;
output reg clk_out;

reg [31:0] count;

parameter exp2 = 2;

always@(posedge clk or posedge rst)begin
	if(rst)begin
		clk_out<=0;
	end else 
		clk_out <= count[exp2];
end

always@(posedge clk or posedge rst)begin
	if(rst)begin
		count<=0;
	end else 
		count <= count + 1;
end

endmodule
