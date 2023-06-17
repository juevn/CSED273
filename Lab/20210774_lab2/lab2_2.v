/* CSED273 lab2 experiment 2 */
/* lab2_2.v */

/* Simplifed equation by K-Map method
 * You are allowed to use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
module lab2_2(
    output wire outGT, outEQ, outLT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    CAL_GT_2 cal_gt2(outGT, inA, inB);
    CAL_EQ_2 cal_eq2(outEQ, inA, inB);
    CAL_LT_2 cal_lt2(outLT, inA, inB);

endmodule

/* Implement output about "A>B" */
module CAL_GT_2(
    output wire outGT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );
    wire g1,g2,g3;
    
    and(g1, inA[1], ~inB[1]);
    and(g2, inA[1], inA[0], ~inB[0]);
    and(g3, inA[0], ~inB[1], ~inB[0]);
    
    or(outGT, g1, g2, g3); 

endmodule

/* Implement output about "A=B" */
module CAL_EQ_2(
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
module CAL_LT_2(
    output wire outLT,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );
    wire L1,L2,L3;
    
    and(L1,~inA[1], inB[1]);
    and(L2, ~inA[1], ~inA[0], inB[0]);
    and(L3, ~inA[0], inB[1], inB[0]);
    
    or(outLT, L1, L2, L3);

endmodule