/* CSED273 lab6 experiment 2 */
/* lab6_2.v */

`timescale 1ps / 1fs

/* Implement 2-decade BCD counter (0-99)
 * You must use decade BCD counter of lab6_1.v */
module decade_counter_2digits(input reset_n, input clk, output [7:0] count);

    ////////////////////////
    decade_counter d1(reset_n, clk, {count[3],count[2],count[1],count[0]});
    decade_counter d2(reset_n, count[3]&count[0], {count[7],count[6],count[5],count[4]});
    ////////////////////////
	
endmodule
