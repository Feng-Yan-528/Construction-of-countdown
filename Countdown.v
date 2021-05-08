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
//seg,
bs0,
bs1
);

 input clock;
 input reset;
 //output [1:0] seg;
 output [6:0] bs0;
 output [6:0] bs1;
 output beep;
 
 wire c;
 wire [3:0] TimeL;
 wire [3:0] TimeH;

 F_d f_d(
 .clock(clock),
 .reset(reset),
 .clock_1(c)
 );
 
 Counter counter(
 .clock_1(c),
 .reset(reset),
 .TimeH(TimeH),
 .TimeL(TimeL),
 .beep(beep)
 );
 
 Seg_display seg_display(
 .clock(c),
 .reset(reset),
 .TimeH(TimeH),
 .TimeL(TimeL),
 //.seg(seg),
 .bs0(bs0),
 .bs1(bs1)
 );
 
 endmodule
 