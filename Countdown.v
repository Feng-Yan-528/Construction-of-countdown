/*
 * Countdown
 * ---------------------
 * For: University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * Connect each module
 */
 
module Countdown(
clock,
reset,
beep,
bs0,
bs1,
clock_5,
clock_10,
clock_f,
TimeH,
TimeL
);

 input clock;
 input reset;
 output [6:0] bs0;
 output [6:0] bs1;
 output beep;
 output clock_5;
 output clock_10;
 output clock_f;
 output [3:0] TimeL;
 output [3:0] TimeH;
 


 FD f(
 .clock(clock),
 .reset(reset),
 .clock_F(clock_f),
 .clock_5(clock_5),
 .clock_10(clock_10)
 );
 
 Counter counter(
 .clock_1(clock_f),
 .reset(reset),
 .TimeH(TimeH),
 .TimeL(TimeL),
 .beep(beep)
 );
 
 Seg_display seg_display(
 .clock(clock_f),
 .reset(reset),
 .TimeH(TimeH),
 .TimeL(TimeL),
 .bs0(bs0),
 .bs1(bs1)
 );
 
 endmodule
 