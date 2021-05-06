/*
 * Top
 * ---------------------
 * For: University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * Connect each module
 */
 
module Top(
clock,
reset,
beep,
seg,
bs
);

 input clock;
 input reset;
 output [1:0] seg;
 output [7:0] bs;
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
 .seg(seg),
 .bs(bs)
 );
 
 endmodule
 