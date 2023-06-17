/* CSED273 lab2 experiment 1 */
/* lab2_1.v */

/* Unsimplifed equation
 * You are allowed to use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
module lab2_1(
    output wire outGT, outEQ, outLT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    CAL_GT cal_gt(outGT, inA, inB);
    CAL_EQ cal_eq(outEQ, inA, inB);
    CAL_LT cal_lt(outLT, inA, inB);
    
endmodule

/* Implement output about "A>B" */
module CAL_GT(
    output wire outGT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );
    wire g1,g2,g3,g4,g5,g6;
    
    and(g1, ~inA[1], inA[0], ~inB[1], ~inB[0]);
    and(g2, inA[1], inA[0], ~inB[1], ~inB[0]);
    and(g3, inA[1], inA[0], ~inB[1], inB[0]);
    and(g4, inA[1], inA[0], inB[1], ~inB[0]);
    and(g5, inA[1], ~inA[0], ~inB[1], ~inB[0]);
    and(g6, inA[1], ~inA[0], ~inB[1], inB[0]);
    
    or(outGT, g1, g2, g3, g4, g5, g6);


endmodule

/* Implement output about "A=B" */
module CAL_EQ(
    output wire outEQ,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );
    wire e1,e2,e3,e4;
    
    and(e1, ~inA[1], ~inA[0], ~inB[1], ~inB[0]);
    and(e2, ~inA[1], inA[0], ~inB[1], inB[0]);
    and(e3, inA[1], inA[0], inB[1], inB[0]);
    and(e4, inA[1], ~inA[0], inB[1], ~inB[0]);
    
    or(outEQ, e1, e2, e3, e4);
    
endmodule

/* Implement output about "A<B" */
module CAL_LT(
    output wire outLT,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );
    wire L1,L2,L3,L4,L5,L6;
    
    and(L1, ~inA[1], ~inA[0], ~inB[1], inB[0]);
    and(L2, ~inA[1], ~inA[0], inB[1], inB[0]);
    and(L3, ~inA[1], ~inA[0], inB[1], ~inB[0]);
    and(L4, ~inA[1], inA[0], inB[1], inB[0]);
    and(L5, ~inA[1], inA[0], inB[1], ~inB[0]);
    and(L6, inA[1], ~inA[0], inB[1], inB[0]);
    
    or(outLT, L1, L2, L3, L4, L5, L6);

endmodule