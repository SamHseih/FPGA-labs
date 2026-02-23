module 	mix(ver, hor, row, red);
input		[7:0]ver, hor, row;
output 	[7:0]red;

assign  red = ((ver & row) != 8'b0) ? hor : 8'b0;

endmodule
/*
邏輯判斷： 當 「目前掃描的列 (row)」 剛好等於 「小紅點所在的列 (ver)」 時，我們才把小紅點的水平位置 (hor) 輸出給 red；
否則 red 應保持全暗 (0)，避免小紅點出現在錯誤的列上。

輸入 ver (Vertical): 代表小紅點目前所在的「列」位置（例如第 3 列是 1，其他是 0）。
輸入 row (Row Scan): 代表目前硬體正在掃描哪一列。
輸入 hor (Horizontal): 代表小紅點所在的「行」資料。
*/