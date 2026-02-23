module ryg_ctl (clk_fst, clk_cnt_dn, rst, day_night, g1_cnt, g2_cnt, g1_en, g2_en, light_led);
input	clk_fst, clk_cnt_dn, rst, day_night;
input[7:0]	g1_cnt, g2_cnt;
output	g1_en, g2_en;
output[5:0]	light_led;
reg		g1_en, g2_en;
reg[5:0]	light_led;
reg[2:0]	mode;


always@(posedge clk_fst or posedge rst) begin
if (rst)begin
	light_led <= 6'b001_100; // g1 : r2
	mode <= 3'b0;
	g1_en <= 1'b0;
	g2_en <= 1'b0;
   	end
else if(day_night == 1'b1) // day time
	case(mode)
	3'd0: begin
		light_led <= 6'b001_100; // g1 : r2
		g1_en <= 1'b1; 	// g1 count down
		if(g1_cnt == 8'b0000_1001) 	// after 20 seconds
		mode <= mode + 3'b1; 
		end
	3'd1: begin	// g1 flashes : r2
		if (g1_cnt == 8'b0000_0100) //after 5 seconds
		mode <= mode + 3'b1; 
		else
		light_led[3] <= clk_cnt_dn;	// g1 flashes
		end
	3'd2: begin
		light_led = 6'b010_100; 	 // y1 : r2
		if (g1_cnt == 8'b0000_0000) begin	// after 4 seconds
		g1_en <= 1'b0;
		mode <= mode + 3'b1;	
		end
		end
	3'd3: begin
		light_led <= 6'b100_001; 	// r1 : g2
		g2_en <= 1'b1;
		if(g2_cnt == 8'b0000_1001)	// after 20 seconds
		mode <= mode + 3'b1; 
		end
	3'd4: begin	// r1 : g2 flashes
		if(g2_cnt == 8'b0000_0100)	// after 5 seconds
		mode <= mode + 3'b1; 
		else
		light_led[0] <= clk_cnt_dn;	// g2 flashes
		end
	3'd5: 	begin	
		light_led <= 6'b100_010;	// r1 : y2
		if (g2_cnt == 8'b0000_0000) begin	// after 4 seconds
		g2_en <= 1'b0;
		mode <= 3'b0;
		end
		end
	default: begin	// back to mode0
		light_led <= 6'b001_100; 	// g1 : r2
		g1_en <= 1'b1; // g1 count down
		if(g1_cnt == 8'b0000_1001) 	// after 20 seconds
		mode <= mode + 3'b1; 
		end
	endcase
else if(day_night == 1'b0)begin  // night time
	light_led <= {{1'b0, clk_cnt_dn, 1'b0}, {1'b0, clk_cnt_dn, 1'b0}}; 
	// y1 flashes : y2 flashes
	g1_en <= 1'b0;
	g2_en <= 1'b0;
end
end
endmodule
