module traffic (clk_fst, clk_cnt_dn, rst, day_night, g1_cnt, g2_cnt, light_led);
input 	clk_fst, clk_cnt_dn, rst, day_night;
output[5:0]	light_led;
output[7:0]	g1_cnt;
output[7:0]	g2_cnt;
wire		g1_en, g2_en;
wire[7:0]	g1_cnt;//29 倒數計時1
wire[7:0]	g2_cnt;//29 倒數計時2

//輸入 day_night, g1_cnt, g2_cnt 輸出 g1_en g2_en light_led
ryg_ctl M0(clk_fst, clk_cnt_dn, rst, day_night, g1_cnt, g2_cnt, g1_en, g2_en, light_led);

light_cnt_dn_29 M1(clk_cnt_dn, rst, g1_en, g1_cnt); // for light 1 產生 g1_cnt
light_cnt_dn_29 M2(clk_cnt_dn, rst, g2_en, g2_cnt); // for light 2  產生 g2_cnt
endmodule
