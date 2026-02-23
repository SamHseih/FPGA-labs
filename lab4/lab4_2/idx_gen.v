module idx_gen(clk, rst, idx);
input clk, rst;
output[6:0] idx;
reg[6:0]idx;
always@(posedge clk or posedge rst) begin
if(rst)
idx= 7'd0;
else if(idx==7'd80) //由上往下 0~9
idx= 7'd0;
else
idx=idx+7'd01;
end
endmodule
