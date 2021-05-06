/*
 * Countdown_tb
 * ---------------------
 * For: University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * Test the whole module
 */
`timescale 1 s/100 us
 
module Countdown_tb;

 reg clock;
 reg reset;
 wire [1:0] seg;
 wire [7:0] bs;
 wire beep;
 parameter High_time=1,Low_time=25;
 
Countdown countdown_dut(
.clock(clock),
.reset(reset),
.seg(seg),
.bs(bs),
.beep(beep)
);

always begin
reset=1'b0;
//$display("%d ns\tSimulation Started",$time);
//$monitor("%d ns\tclock=%d\t reset=%d\t seg=%b\t bs=%b\t beep=%b",$time,clock,reset,seg,bs,beep);
 clock = 1;  
 #High_time;  
 clock = 0;  
 #Low_time;
//$display("%d ns\tSimulation Finished",$time); //Finished
end
endmodule
 