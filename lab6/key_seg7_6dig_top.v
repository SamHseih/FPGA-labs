//key_seg7_6dig_top
module lab5_2 (clk, rst, column, sel, seg7);
input clk, rst;		//pin W16,C16
input[2:0]column;		// pin AA13, AB12, Y16
output[2:0]sel;		// pin AB10, AB11, AA12
output[6:0]seg7;		// pin AB7,AA7,AB6,AB5,AA9,Y9,AB8 

wire clk_sel;
wire[3:0] key_code;
freq_div#(13) (.clk_in(clk), .reset(rst), .clk_out(clk_sel));

// 輸出為 4 bit 數值
key_seg7_6dig(.clk_sel(clk_sel), .rst(rst), .column(column), .sel(sel), .key_code(key_code));

//根據4bit數值 顯示於七段顯示器
bcd_to_seg7(.bcd_in(key_code), .seg7(seg7));

endmodule