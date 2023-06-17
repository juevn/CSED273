/* CSED273 lab5 experiment 2 */
/* lab5_2.v */

`timescale 1ns / 1ps

/* Implement srLatch */
module srLatch(
    input s, r,
    output q, q_
    );

    ////////////////////////
    nor(q, r, q_);
    nor(q_, s, q);
    ////////////////////////

endmodule

/* Implement master-slave JK flip-flop with srLatch module */
module lab5_2(
    input reset_n, j, k, clk,
    output q, q_
    );

    ////////////////////////
    wire r1, s1, r2, s2, r3, s3, p, p_;
    
    and(r1, q, k, clk);
    and(s1, q_, j, clk);
    
    or(r2, ~reset_n, r1);
    and(s2, reset_n, s1);
    
    srLatch master(s2, r2, p, p_);
    
    and(r3, p_, ~clk);
    and(s3, p, ~clk);
    
    srLatch slave(s3, r3, q, q_);
    
    ////////////////////////
    
endmodule