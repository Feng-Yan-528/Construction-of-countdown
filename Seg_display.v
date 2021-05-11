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
 	else
    	if(div_cnt < 25000)
 		display_num <= TimeH;
 	else
 		display_num <= TimeL;
 	end

always @(posedge clock or negedge reset)
	begin
		if(!reset) begin
			bs0 <= 7'h40;
			bs1 <= 7'h40;
		end
		else begin
			case(display_num) 
				4'h0:begin	
				 bs0 <= 7'h40;
				 bs1 <= 7'h40;
			   end
				4'h1:begin
			    bs0 <= 7'h79;
				 bs1 <= 7'h79;
				end
				4'h2:begin
				 bs0 <= 7'h24;
				 bs1 <= 7'h24;
				end
				4'h3:begin
			    bs0 <= 7'h4f;
				 bs1 <= 7'h4f;
				end
				4'h4:begin
				 bs0 <= 7'h19;
				 bs1 <= 7'h19;
				end
				4'h5:begin
			  	 bs0 <= 7'h12;
				 bs1 <= 7'h12;
				end
				4'h6:begin
				 bs0 <= 7'h2;
				 bs1 <= 7'h2;
				end
				4'h7:begin
		       bs0 <= 7'h78;
				 bs1 <= 7'h78;
				end 
				4'h8:begin
				 bs0 <= 7'h00;
				 bs1 <= 7'h00;
				end
				4'h9:begin
				 bs0 <= 7'h10;
				 bs1 <= 7'h10;
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
