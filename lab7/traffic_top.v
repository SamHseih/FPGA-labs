module	 traffic_top(clk, rst, day_night, light_led, led_com, seg7_out, seg7_sel,light_off);
input clk,rst;//w16 c16
input		day_night;
output[5:0]	light_led;//pin E2 ,D3 ,C2 ,N1 ,AA2 ,AA1
output[5:0] light_off;//C1 L2 L1 G2 G1 U2
output	led_com;//pin N20
output[2:0]	seg7_sel;//pin AB10 ,AB11, AA12
output[6:0]	seg7_out;// pin AB7,AA7,AB6,AB5,AA9,Y9,AB8 

wire		led_com;
wire		clk_cnt_dn;
wire[7:0]	g1_cnt;
wire[7:0]	g2_cnt;
wire[3:0]	count_out;

assign light_off = 6'd0;
assign	led_com= 1'b1;

//倒數值
assign count_out = (!day_night)?4'd0:
					(seg7_sel==3'b101)?g1_cnt[3:0]:
					(seg7_sel==3'b100)?g1_cnt[7:4]:
					(seg7_sel==3'b011)?g2_cnt[3:0]:
					(seg7_sel==3'b010)?g2_cnt[7:4]:4'd0;

freq_div#(23) M0(clk, rst, clk_cnt_dn);
freq_div#(21) M1(clk, rst, clk_fst);
freq_div#(15) M2(clk, rst, clk_sel);

traffic M3(clk_fst,clk_cnt_dn,rst,day_night,g1_cnt,g2_cnt,light_led);

seg7_select#(4) M5(clk_sel, rst, seg7_sel);
bcd_to_seg7 M4(count_out,seg7_out);
endmodule

