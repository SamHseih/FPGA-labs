module key_buf6(clk, rst, press_valid, scan_code, display_code);
input clk, rst, press_valid;
input[3:0] scan_code;
output[23:0]display_code;
reg[23:0]display_code;
always@(posedge clk or posedge rst) begin
if(rst)display_code <= 24'hffffff;// initial value
//{Left_shift_value} :Previous_ value;
else if(press_valid) 
		display_code <= {display_code[19:0], scan_code};
else 	display_code <= display_code;
		
end
endmodule