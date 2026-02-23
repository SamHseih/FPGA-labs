module key_led(clk_sel, reset, column, sel, key_code);
input clk_sel, reset;
input[2:0]column;	

output[2:0]sel;
output[3:0] key_code;

wire press;
wire[3:0] scan_code, key_code;

count4  M1(.clk(clk_sel), .reset(reset), .out(sel));//000 001 010 011

//sel, column, press, scan_code
key_decode M2 (.sel(sel),.column(column), .press(press), .scan_code(scan_code));

//module key_buf(clk, rst, press, scan_code, key_code);
key_buf M3 (.clk(clk_sel), .rst(reset), .press(press), .scan_code(scan_code), .key_code(key_code));
endmodule
