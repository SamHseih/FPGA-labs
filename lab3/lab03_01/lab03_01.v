module lab03_01(clk, reset, enable, seg7_sel, seg7_out, dpt, carry, led_com);//clock_top
input clk, reset, enable;//pin W16,C16,AA15
output[2:0]seg7_sel;//pin AB10,AB11,AA12 
output[6:0] seg7_out;//pin AB7,AA7,AB6,AB5,AA9,Y9,AB8 
output dpt, carry, led_com;//pin AA8,E2,N20

wire clk_count, clk_sel;
	wire[3:0] count_out, count5, count4, count3, count2, count1, count0;

assign led_com= 1'b1;
assign count_out= (seg7_sel == 3'b101 )? count0 : (seg7_sel == 3'b100 )? count1 :
(seg7_sel == 3'b011 )? count2 : 
(seg7_sel == 3'b010 )? count3 : 
(seg7_sel == 3'b001 )? count4 : count5;

assign dpt= (seg7_sel == 3'b101 )? 1'b1 : (seg7_sel == 3'b100 )? 1'b0 :
(seg7_sel == 3'b011 )? 1'b1 : 
(seg7_sel == 3'b010 )? 1'b0 : 
(seg7_sel == 3'b001 )? 1'b1 :1'b0;
//module freq_div(clk_in, reset, clk_out);
freq_div#(20)(clk, reset, clk_count); //slow
freq_div#(14)(clk, reset, clk_sel); //fast
//module clock(clk, reset, enable, count5, count4, count3, count2, count1, count0, carry);
clock(clk_count, reset, enable, count5, count4, count3, count2, count1, count0, carry);
//module bcd_to_seg7(bcd_in, seg7);
bcd_to_seg7(count_out, seg7_out);
//module seg7_select(clk, reset, seg7_sel);
seg7_select#(6) (clk_sel, reset, seg7_sel);
endmodule 

