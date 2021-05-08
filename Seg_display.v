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
 //seg,
 bs0,
 bs1
 );
 input clock;
 input reset;
 input [3:0]TimeH;
 input [3:0]TimeL;
 //output reg[1:0] seg;
 
 output reg[6:0] bs0;//Bit selection data bit
 output reg[6:0] bs1;
 
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
		if(!reset) begin
			bs0 <= 7'h00;
			bs1 <= 7'h00;
		end
		else begin
			case(display_num) 
				4'h0:begin	
				 bs0 <= 7'h3f;
				 bs1 <= 7'h3f;
			   end
				4'h1:begin
			    bs0 <= 7'h06;
				 bs1 <= 7'h06;
				end
				4'h2:begin
				 bs0 <= 7'h5b;
				 bs1 <= 7'h5b;
				end
				4'h3:begin
			    bs0 <= 7'h4f;
				 bs1 <= 7'h4f;
				end
				4'h4:begin
				 bs0 <= 7'h66;
				 bs1 <= 7'h66;
				end
				4'h5:begin
			  	 bs0 <= 7'h6d;
				 bs1 <= 7'h6d;
				end
				4'h6:begin
				 bs0 <= 7'h7d;
				 bs1 <= 7'h7d;
				end
				4'h7:begin
		       bs0 <= 7'h07;
				 bs1 <= 7'h07;
				end 
				4'h8:begin
				 bs0 <= 7'h7f;
				 bs1 <= 7'h7f;
				end
				4'h9:begin
				 bs0 <= 7'h6f;
				 bs1 <= 7'h6f;
				end
			endcase
		end
	end
/*always @(posedge clock or negedge reset)	
	begin
		if(!reset) 
			seg <=  2'b11;
		else if(div_cnt < 20000)
			seg <= 2'b01;
		else
			seg <= 2'b10;
		end
*/
endmodule
