module lab01_03(clk, reset, shiftR_out,  shiftG_out, ctl_bit);
input 	clk; // pin W16
input 	reset; // pin C16
output	[7:0]shiftR_out; 
// pin D7, D6, A9, C9, A8, C8, C11, B11
output	[7:0]shiftG_out; 
// pin A10 ,B10 ,A13 ,A12 ,B12 ,D12 ,A15 ,A14
assign shiftR_out =0;
output 	ctl_bit; // pin T22
assign 	ctl_bit= 1'b1;
freq_div#(20) M1 (clk, reset, clk_work); 
scroll M2 (clk_work, reset, shiftG_out);
endmodule	