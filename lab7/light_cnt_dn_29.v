module light_cnt_dn_29 (clk, rst, enable, cnt);
input		clk, rst, enable;
output	[7:0]	cnt;
reg[7:0]	cnt;//MSB[7:4] for 十位數,LSB[3:0] for 個位數
always@(posedge clk or posedge rst) begin
if(rst)
	cnt <= 8'b0; // initial state
else if(enable)  // 0 -> 29 -> 24 -> ... -> 1 -> 0 -> 29
	if(cnt== 8'b0)
		cnt <= 8'h29;  // 29
	else if(cnt[3:0] == 4'd0) begin  // 20 -> 19, 10 -> 09
		 cnt[7:4] <= cnt[7:4] - 4'd1; 
		 cnt[3:0] <= 4'b1001; 	  
	end else
		 cnt[3:0] <= cnt[3:0] - 4'd1;   // 19 -> 18, 18 -> 17, 17 -> 16, …
else cnt <= 8'b0;	
end
endmodule
