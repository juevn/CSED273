/* CSED273 lab5 experiment 1 */
/* lab5_1.v */

`timescale 1ps / 1fs

/* Implement adder 
 * You must not use Verilog arithmetic operators */
module adder(
    input [3:0] x,
    input [3:0] y,
    input c_in,             // Carry in
    output [3:0] out,
    output c_out            // Carry out
); 

    ////////////////////////
    wire c1, c2, c3;
    xor(out[0],x[0],y[0],c_in);
    or(c1,x[0]&y[0],y[0]&c_in,x[0]&c_in);

    xor(out[1],x[1],y[1],c1);
    or(c2,x[1]&y[1],y[1]&c1,x[1]&c1);
    
    xor(out[2],x[2],y[2],c2);
    or(c3,x[2]&y[2],y[2]&c2,x[2]&c2);
    
    xor(out[3],x[3],y[3],c3);
    or(c_out,x[3]&y[3],y[3]&c3,x[3]&c3);
    ////////////////////////

endmodule

/* Implement arithmeticUnit with adder module
 * You must use one adder module.
 * You must not use Verilog arithmetic operators */
module arithmeticUnit(
    input [3:0] x,
    input [3:0] y,
    input [2:0] select,
    output [3:0] out,
    output c_out            // Carry out
);

    ////////////////////////
    wire [3:0] a;
    or(a[3], select[2]&~y[3], select[1]&y[3]);
    or(a[2], select[2]&~y[2], select[1]&y[2]);
    or(a[1], select[2]&~y[1], select[1]&y[1]);
    or(a[0], select[2]&~y[0], select[1]&y[0]);
    
    adder a1(x,a,select[0],out,c_out);
    ////////////////////////

endmodule

/* Implement 4:1 mux */
module mux4to1(
    input [3:0] in,
    input [1:0] select,
    output out
);

    ////////////////////////
    wire [3:0] a;
    and(a[0],in[0], ~select[1]&~select[0]); 
    and(a[1],in[1], ~select[1]&select[0]); 
    and(a[2],in[2], select[1]&~select[0]); 
    and(a[3],in[3], select[1]&select[0]); 
    or(out, a[0], a[1], a[2], a[3]);
    ////////////////////////

endmodule

/* Implement logicUnit with mux4to1 */
module logicUnit(
    input [3:0] x,
    input [3:0] y,
    input [1:0] select,
    output [3:0] out
);

    ////////////////////////
    mux4to1 m1({~x[0],x[0]^y[0],x[0]|y[0],x[0]&y[0]},select,out[0]);
    mux4to1 m2({~x[1],x[1]^y[1],x[1]|y[1],x[1]&y[1]},select,out[1]);
    mux4to1 m3({~x[2],x[2]^y[2],x[2]|y[2],x[2]&y[2]},select,out[2]);
    mux4to1 m4({~x[3],x[3]^y[3],x[3]|y[3],x[3]&y[3]},select,out[3]);
    ////////////////////////

endmodule

/* Implement 2:1 mux */
module mux2to1(
    input [1:0] in,
    input  select,
    output out
);

    ////////////////////////
    or(out, in[1]&select, in[0]&~select);
    ////////////////////////

endmodule

/* Implement ALU with mux2to1 */
module lab5_1(
    input [3:0] x,
    input [3:0] y,
    input [3:0] select,
    output [3:0] out,
    output c_out            // Carry out
);

    ////////////////////////
    wire [3:0] out1;
    wire [3:0] out2;
    
    arithmeticUnit a1(x,y,{select[2], select[1], select[0]}, out1, c_out);
    logicUnit a2(x,y,{select[1], select[0]}, out2);
    
    mux2to1 m1({out2[3], out1[3]}, select[3], out[3]);
    mux2to1 m2({out2[2], out1[2]}, select[3], out[2]);
    mux2to1 m3({out2[1], out1[1]}, select[3], out[1]);
    mux2to1 m4({out2[0], out1[0]}, select[3], out[0]);
   
    ////////////////////////

endmodule
