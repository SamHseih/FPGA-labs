module lab02_03(clk, reset, seg7_sel, enable, seg7_out, dpt_out, carry, led_com);//count_00_99_top
input		clk, reset, enable; 	//pin W16,C16,AA15
output[2:0]	seg7_sel; 	//pin AB10,AB11,AA12 
output[6:0]	seg7_out;          // pin AB7,AA7,AB6,AB5,AA9,Y9,AB8 
output	dpt_out, led_com, carry;//pin AA8,N20,E2
wire		clk_count, clk_sel;
wire[3:0] 	count_out, count1, count0;
assign	dpt_out= 1'b0;
assign	led_com= 1'b1;
assign count_out= (seg7_sel == 3'b101 )? count0 : count1; //MUX
freq_div #(21) M1 (clk, reset, clk_count); // slow
freq_div #(17) M2 (clk, reset, clk_sel); // high

//module count_00_99(clk, reset, enable, count1_out, count0_out, carry);
count_00_99	 (clk_count, reset, enable, count1, count0, carry);

//module bcd_to_seg7(bcd_in, seg7);
bcd_to_seg7	 (count_out , seg7_out);

//module seg7_select(clk, reset, seg7_sel);
seg7_select #(2) (clk_sel, reset, seg7_sel);

endmodule