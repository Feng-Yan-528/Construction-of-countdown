/*
 * F_d
 * ---------------------
 * For: University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * Divide the 25MHz frequency into 1Mhz
 */
 
 module F_d(
 clock,
 reset,
 clock_1
 );
 
 input clock;
 input  reset;
 output reg clock_1;
 
 reg  [23:0] cnt;//The register is used to store the value of the counter
 initial cnt = 0;
 
 parameter TIME=50000;//Clock50MHz
 always@(posedge clock or negedge reset)
	begin
		if(!reset)
			begin
				clock_1<=1'b0;
				cnt <=24'd0;
			end
		else 
		 if(cnt < TIME-1'b1)
		  begin
			cnt <=cnt + 1'b1;
			if(cnt<(TIME/2-1))
			clock_1<=1'b0;
		else
		clock_1<=1'b1;
		end
		else
			begin
				cnt<=24'd0;
				clock_1<=1'b0;
			end
	end
endmodule
