module row_gen(clk, rst, idx, row, idx_cnt);
input clk, rst;
input[6:0]idx;
output[7:0] row;
output[6:0]idx_cnt;

reg[7:0] row;
reg[6:0]idx_cnt;
reg[2:0]cnt;

//控制亮燈列
always@(posedge clk or posedge rst) begin
	if(rst) row <= 8'd1;
	else row <= {row[0], row[7:1]};//(輪流將每一列LED致能)0 row <= {row[0], row[7:1]}
end

//控制亮燈頁(idx 起始位置)
always@(posedge clk or posedge rst) begin
	if(rst) idx_cnt <= 7'd0;
	else idx_cnt <= idx + cnt;//(將初始位置加0到7)
end

always@(posedge clk or posedge rst) begin
	if(rst) cnt <= 3'd0;
	else cnt <= cnt + 3'd1;//(從0數到7) 
end
endmodule



