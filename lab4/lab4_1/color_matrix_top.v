module color_matrix_top(clk, rst, row, sel, column_green, column_red);
input clk, rst;//W16 ,C16
input[1:0] sel;	//選擇LDE亮紅燈OR綠燈
//pin AA15 ,AA14
output[7:0] row, column_green, column_red;
//row:pin T22 ,R21 ,C6 ,B6 ,B5 ,A5 ,B7 ,A7

//column_green/red比照Lab1
//Green A10 B10 A13 A12 B12 D12 A15 A14
//Red D7 D6 A9 C9 A8 C8 C11 B11
wire clk_shift, clk_scan;
wire[6:0] idx, idx_cnt;
wire[7:0] column_out;

assign column_green= (sel== 2'b01 || sel== 2'b11)? column_out: 8'b0;
assign column_red= (sel== 2'b10 || sel== 2'b11)? column_out: 8'b0;

freq_div#(22) M1 (.clk_in(clk), .reset(rst), .clk_out(clk_shift));
freq_div#(12) M2 (.clk_in(clk), .reset(rst), .clk_out(clk_scan));

//產生起始位址,由上往下0~9 慢
idx_gen M3 (.clk(clk_shift), .rst(rst), .idx(idx)); 
//row控制第幾列為1 idx_cnt當下要亮燈  
row_gen M4 (.clk(clk_scan), .rst(rst), .idx(idx), .row(row), .idx_cnt(idx_cnt));
// module rom_char(addr, data); //產生位址轉data
rom_char M5 ( .addr(idx_cnt) ,.data(column_out) );

endmodule