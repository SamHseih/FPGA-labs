module 	red_dot_top(clk, row, red, green, column, sel, reset);

input 		reset, clk; // c16  w16
input 		[2:0]column; //AA13,AB12,Y16
output	[7:0]red, row, green;	
		//red D7,D6,A9,C9,A8,C8,C11,B11
		//row T22,R21,C6,B6,B5,A5,B7,A7
		//green A10,B10,A13,A12,B12,D12,A15,A14
output 	[2:0]sel;//AB10,AB11,AA12
wire 		ck, press, press_vaild, coll;
wire 		[3:0]keycode, scancode, addr;
wire		[2:0]idx;
wire		[7:0]hor, ver;

assign 	addr = { coll, idx };

freq_div#(14) M1 (clk,reset,ck);
//yellow
count6 M2 (ck,reset,sel);//掃描sel
key_decode M3 (sel, column, press, scancode);
valid M4 (ck,reset,press,press_vaild);
key_buf M5 (ck, reset, press_vaild, scancode,keycode);

//ver 垂直 hor 水平
move M6 (reset, coll, keycode, ver ,hor, ck);

//ver, hor, row, red
mix	M7 (ver, hor, row, red);
idx		M8 (.clk(ck), .reset(reset), .idx(idx), .row(row));
collision 	M10 (ck,reset,red,green,coll);
map		M11 (addr,green);


endmodule

