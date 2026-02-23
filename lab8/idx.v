module idx(clk, reset, idx, row);
    input reset, clk;
    output reg [2:0] idx;
    output reg [7:0] row;
/*
idx 同時與en_row 同步
*/
    always@(posedge clk or posedge reset) begin
        if(reset) begin
            idx <= 3'b000;
            row <= 8'b1000_0000; // 初始掃描第一列 (假設低電位動作或高電位動作需對應你的硬體，通常是循環移位)
        end
        else begin
            idx <= idx + 1;
            row <= {row[0], row[7:1]}; // 循環移位，達成掃描效果
        end
    end
endmodule
