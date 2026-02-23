module	move(reset, unable, keycode, ver, hor, clk);
input 		reset, clk, unable;
input 		[3:0]keycode;
output 	[7:0]ver, hor;
wire		left, right, up, down;

assign 	left   =~keycode[1]&  keycode[2];
assign 	right =  keycode[1]&  keycode[2];
assign 	up    =  keycode[1]&~keycode[2];
assign	down=  keycode[3];

//left, right, reset, unable, out, clk
shift S1(left,right,reset,unable,hor,clk); //left & right
shift S2(up,down,reset,unable,ver,clk); //up & down

endmodule
