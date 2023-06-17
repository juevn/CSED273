/* CSED273 lab6 experiment 1 */
/* lab6_1.v */

`timescale 1ps / 1fs

/* Implement synchronous BCD decade counter (0-9)
 * You must use JK flip-flop of lab6_ff.v */
module decade_counter(input reset_n, input clk, output [3:0] count);

    ////////////////////////
    wire j_a, j_b, j_c, j_d;
    wire k_a, k_b, k_c, k_d;
    wire [3:0] rev;
    
    and(j_a,count[2],count[1],count[0]);
    assign k_a=count[0];
    and(j_b,count[1],count[0]);
    and(k_b,count[1],count[0]);
    and(j_c,rev[3],count[0]);
    assign k_c=count[0];
    assign j_d=1;
    assign k_d=1;
    
    edge_trigger_JKFF a(reset_n, j_a, k_a, clk, count[3], rev[3]);
    edge_trigger_JKFF b(reset_n, j_b, k_b, clk, count[2], rev[2]);
    edge_trigger_JKFF c(reset_n, j_c, k_c, clk, count[1], rev[1]);
    edge_trigger_JKFF d(reset_n, j_d, k_d, clk, count[0], rev[0]);
    
    ////////////////////////
	
endmodule