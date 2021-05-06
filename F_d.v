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
 clock_25,
 reset,
 clock_1
 );
 
 input clock_25;
 input  reset;
 output reg clock_1;
 
 reg  [24:0] cnt;//The register is used to store the value of the counter
 initial cnt = 0;
 
 parameter TIME=24'd1250_0000;//Clock25MHz
 always@(posedge clock_25 or negedge reset)
	begin
		if(!reset)
			begin
				clock_1<=1'b0;
				cnt <=25'd0;
			end
		else if(cnt ==TIME-1'b1)
		begin
			clock_1 <=~clock_1;
			cnt <=1'b0;
		end
		else
			cnt <=cnt + 1'b1;
	end
endmodule
