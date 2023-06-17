/* CSED273 lab4 experiment 4 */
/* lab4_4.v */

/* Implement 5x3 Binary Mutliplier
 * You must use lab4_2 module in lab4_2.v
 * You cannot use fullAdder or halfAdder module directly
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling*/
module lab4_4(
    input [4:0]in_a,
    input [2:0]in_b,
    output [7:0]out_m
    );

    ////////////////////////
    wire [4:0] mul1;
    wire [4:0] mul2;
    wire [4:0] mul3;
    
    and(mul1[4],in_a[4],in_b[0]);
    and(mul1[3],in_a[3],in_b[0]);
    and(mul1[2],in_a[2],in_b[0]);
    and(mul1[1],in_a[1],in_b[0]);
    and(mul1[0],in_a[0],in_b[0]);
    
    and(mul2[4],in_a[4],in_b[1]);
    and(mul2[3],in_a[3],in_b[1]);
    and(mul2[2],in_a[2],in_b[1]);
    and(mul2[1],in_a[1],in_b[1]);
    and(mul2[0],in_a[0],in_b[1]);
    
    and(mul3[4],in_a[4],in_b[2]);
    and(mul3[3],in_a[3],in_b[2]);
    and(mul3[2],in_a[2],in_b[2]);
    and(mul3[1],in_a[1],in_b[2]);
    and(mul3[0],in_a[0],in_b[2]);
    
    wire [4:0] ad1;
    wire [3:0] carry;
    wire outcar;
    
    lab4_2 a1({0,mul1[4],mul1[3],mul1[2],mul1[1]}, mul2, 0, ad1, outcar);
    lab4_2 a2({outcar,ad1[4],ad1[3],ad1[2],ad1[1]}, mul3, 0, {out_m[6],out_m[5],out_m[4], out_m[3], out_m[2]}, out_m[7]);
   
    assign out_m[0] = mul1[0];
    assign out_m[1] = ad1[0];
    ////////////////////////
    
endmodule