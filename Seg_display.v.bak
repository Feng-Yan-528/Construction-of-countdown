/*
 * Seg_display
 * ---------------------
 * For: University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * Digital tube display
 */
 module Seg_display(
 clock,
 reset,
 TimeH,
 TimeL,
 seg,
 bs
 );
 input clock;
 input reset;
 input [3:0]TimeH;
 input [3:0]TimeL;
 output reg[1:0] seg;//Segment selected data bit
 output reg[7:0] bs;//Bit selection data bit
		
 reg[3:0] display_num;//Current display data
 reg[15:0] div_cnt;//Delay counter counting bit
	
initial div_cnt = 0;
//Delay counter module
	always@ (posedge clock or negedge reset)
	begin
		if(!reset) 
			div_cnt <= 8'd0;
		else if(div_cnt==16'd50000)
			div_cnt <= 8'd0;		
		else 
			div_cnt <= div_cnt+1'b1;
	end
	
//Show the current data module
	always @(posedge clock or negedge reset)
	begin
	if(!reset) 
		display_num <= 4'h0;
	else if(div_cnt < 25000)
		display_num <= TimeH;
	else
		display_num <= TimeL;
	end

always @(posedge clock or negedge reset)
	begin
		if(!reset) 
			bs <= 8'h00;
		else begin
			case(display_num) 
				4'h0: bs <= 8'h3f;
				4'h1: bs <= 8'h06;
				4'h2: bs <= 8'h5b;
				4'h3: bs <= 8'h4f;
				4'h4: bs <= 8'h66;
				4'h5: bs <= 8'h6d;
				4'h6: bs <= 8'h7d;
				4'h7: bs <= 8'h07;
				4'h8: bs <= 8'h7f;
				4'h9: bs <= 8'h6f;
				default:bs <= 8'h00;
			endcase
		end
	end
always @(posedge clock or negedge reset)	
	begin
		if(!reset) 
			seg <=  2'b11;
		else if(div_cnt < 20000)
				seg <= 2'b01;
		else
				seg <= 2'b10;
		end
		
endmodule
