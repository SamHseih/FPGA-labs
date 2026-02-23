module Moore_FSM(out,clk,Reset,In,State);
input clk,Reset,In;
output reg out;
output reg[1:0]State;

reg [1:0]Nextstate;
parameter S0=2'd0, S1=2'd1,S2=2'd2,S3=2'd3;

always@(posedge clk or posedge Reset)begin
	if(Reset)
		State <= S0;
		else
		State <= Nextstate;
end

always@(In or State)begin
case(State)
	S0:begin
		if(In==1)
		Nextstate = S2;
		else
		Nextstate = S0;
	end
	S1:begin
		if(In==1)
		Nextstate = S2;
		else
		Nextstate = S0;
	end
	S2:begin
		if(In==1)
		Nextstate = S3;
		else
		Nextstate = S2;
	end
	S3:begin
		if(In==1)
		Nextstate = S1;
		else
		Nextstate = S3;
	end
	default:
		Nextstate = S0;
endcase
end

always@(State)begin
case(State)
S0:out = 0;
S1:out = 1;
S2:out = 1;
S3:out = 0;
endcase
end

endmodule
