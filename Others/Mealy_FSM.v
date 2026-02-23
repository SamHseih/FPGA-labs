module Mealy_FSM(out,clk,Reset,In,State);
input clk,Reset,In;
output reg out;
output reg [1:0]State;

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
		if(In==1)begin
		Nextstate = S2;
		out = 1;
		end
		else begin
		Nextstate = S0;
		out = 0;
		end
	end
	S1:begin
		if(In==1) begin
		Nextstate = S2;
		out = 0;
		end
		else begin
		Nextstate = S0;
		out = 1;
		end
	end
	S2:begin
		if(In==1) begin
		Nextstate = S3;
		out = 1;
		end
		else begin
		Nextstate = S2;
		out = 0;
		end
	end
	S3:begin
		if(In==1) begin
		Nextstate = S1;
		out = 1;
		end
		else begin
		Nextstate = S3;
		out = 0;
		end
	end
		default:
			Nextstate = S0;
endcase
end

endmodule
