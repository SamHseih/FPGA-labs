module CMP4(BIGV,A,B,C,D,CLK);

parameter size = 8;

input CLK;
input [size-1:0]A,B,C,D;
output	[size-1:0]BIGV;

reg [size-1:0]BIGV;

always@(posedge CLK)begin
if(A>B)begin
	if(A>C)
		if(A>D) BIGV <= A;
		else BIGV <= D;
	else 
		if(C>D) BIGV <= C;
		else BIGV <= D;
end else begin
	if(B>C)
		if(B>D) BIGV <= B;
		else BIGV <= D;
	else 
		if(C>D) BIGV <= C;
		else BIGV <= D;
end

end

endmodule
