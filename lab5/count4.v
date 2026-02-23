module count4(clk,reset,out);
input clk,reset;
output reg[2:0]out;

always@(posedge clk or posedge reset)begin
	if(reset) out<=3'd0;
	else out <= out + 3'd1;
end
endmodule