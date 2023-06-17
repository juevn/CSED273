/* CSED273 lab4 experiment 2 */
/* lab4_2.v */

/* Implement 5-Bit Ripple Adder
 * You must use fullAdder module in lab4_1.v
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling*/
module lab4_2(
    input [4:0] in_a,
    input [4:0] in_b,
    input in_c,
    output [4:0] out_s,
    output out_c
    );

    ////////////////////////
    wire c0, c1, c2, c3;
    
    fullAdder f0(in_a[0],in_b[0],in_c, out_s[0],c0); 
    fullAdder f1(in_a[1],in_b[1],c0, out_s[1],c1); 
    fullAdder f2(in_a[2],in_b[2],c1, out_s[2],c2); 
    fullAdder f3(in_a[3],in_b[3],c2, out_s[3],c3); 
    fullAdder f4(in_a[4],in_b[4],c3, out_s[4],out_c); 
    
    ////////////////////////

endmodule