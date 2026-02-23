module lab5_1(clk, reset, column, sel, led, led_com);
input clk, reset;      //pinW16,C16
input[2:0]column;    // pin AA13, AB12, Y16
//啟用鍵盤 
output[2:0]sel;       // pin AB10, AB11, AA12
output[9:0]led;       // pin E2, D3, C2, C1 ,L2, L1, G2, G1, U2, N1
output led_com;      // pin N20
assign led_com= 1'b1;
wire clk_sel;
wire[3:0] key_code;

freq_div#(13) (.clk_in(clk), .reset(reset), .clk_out(clk_sel));
//module key_led(clk_sel, reset, column, sel, key_code);
key_led(.clk_sel(clk_sel), .reset(reset), .column(column), .sel(sel), .key_code(key_code));
bcd_led(.key_code(key_code), .led(led));
endmodule
