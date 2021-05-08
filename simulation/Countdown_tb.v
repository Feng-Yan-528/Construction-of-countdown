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
`timescale 1ns/100 ps
 
module Countdown_tb;

 reg clock;
 reg reset;
 wire [6:0] bs0;
 wire [6:0] bs1;
 wire beep;

Countdown countdown_dut(
.clock(clock),
.reset(reset),
.bs1(bs1),
.bs0(bs0),
.beep(beep)
);

initial begin
$display("%d ns\tSimulation Started",$time);
$monitor("%d ns\tclock=%d\t reset=%d\t bs1=%b\t bs0=%b\t beep=%b ",$time,clock,reset,bs1,bs0,beep);
clock=1'b1;
reset=1'b0;

#1000;
$display("%d ns\tSimulation Finished",$time); //Finished
end
always #20 clock=~clock;

endmodule
 