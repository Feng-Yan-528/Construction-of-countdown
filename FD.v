/*
 * Countdown
 * ---------------------
 * For: University of Leeds
 * Date: 6th May 2021
 *
 * Description
 * ------------
 * Integrate the frequency division module to make the code clearer.
 */

module FD(
clock,
reset,
clock_F,
clock_5,
clock_10
);

input clock;
input reset;
output  clock_F;
output  clock_5;
output  clock_10;


wire c;
wire o;

assign clock_5=c;
assign clock_10=o;

F_5 fd(
.clock(clock),
.reset(reset),
.clock_5(c)
);

F_10 f10(
.clock(c),
.reset(reset),
.clock_10(o)
);

F_1 f1(
.clock(o),
.reset(reset),
.clock_f(clock_F)
);

endmodule
