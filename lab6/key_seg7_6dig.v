module key_seg7_6dig(clk_sel, rst, column, sel, key_code);
input clk_sel, rst;
input[2:0]column;
output[2:0]sel;

output[3:0]key_code;
wire press, press_valid;
wire[3:0] scan_code, key_code;
wire[23:0]display_code;

//掃描
count6(.clk(clk_sel),.reset(rst),.out(sel));

//輸出為解碼數字鍵盤4bit scan_code , 1bit press
key_decode(.sel(sel), .column(column), .press(press), .scan_code(scan_code));

//輸入為有效press 紀錄某時刻某段七段顯示器的的press
debounce_ctl(.clk(clk_sel), .rst(rst), .press(press), .press_valid(press_valid));

//輸出24 bit display_code
key_buf6(.clk(clk_sel), .rst(rst), .press_valid(press_valid), .scan_code(scan_code), .display_code(display_code));

//根據 sel 從display_code 選擇輸出某一個七段顯示器的數值
key_code_mux(.display_code(display_code), .sel(sel), .key_code(key_code));

endmodule