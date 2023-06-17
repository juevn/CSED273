/* CSED273 lab6 experiment 3 */
/* lab6_3.v */

`timescale 1ps / 1fs

/* Implement 369 game counter (0, 3, 6, 9, 13, 6, 9, 13, 6 ...)
 * You must first implement D flip-flop in lab6_ff.v
 * then you use D flip-flop of lab6_ff.v */
module counter_369(input reset_n, input clk, output [3:0] count);

    ////////////////////////
    wire d_a,d_b,d_c,d_d;
    wire [3:0] rev;
    
    or(d_a, count[1]&~count[0],count[3]&~count[2]);
    assign d_b=count[0];
    or(d_c, count[2]&count[0], ~count[3]&~count[2]);
    or(d_d, ~count[0], count[3]&~count[2]);
    
    edge_trigger_D_FF da(reset_n, d_a, clk, count[3], rev[3]);
    edge_trigger_D_FF db(reset_n, d_b, clk, count[2], rev[2]);
    edge_trigger_D_FF dc(reset_n, d_c, clk, count[1], rev[1]);
    edge_trigger_D_FF dd(reset_n, d_d, clk, count[0], rev[0]);
    ////////////////////////
	
endmodule
