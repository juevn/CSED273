/* CSED273 lab1 experiment 2_iv */
/* lab1_2_iv.v */


module lab1_2_iv(outAND, outOR, outNOT, inA, inB);
    output wire outAND, outOR, outNOT;
    input wire inA, inB;

    AND(outAND, inA, inB);
    OR(outOR, inA, inB);
    NOT(outNOT, inA);

endmodule


/* Implement AND, OR, and NOT modules with {NOR}
 * You are only allowed to wire modules below
 * i.e.) No and, or, not, etc. Only nor, AND, OR, NOT are available*/
module AND(outAND, inA, inB);
    output wire outAND;
    input wire inA, inB; 

    ////////////////////////
    wire a,b;
    NOT(a,inA);
    NOT(b,inB);
    nor(outAND,a,b);
    ////////////////////////

endmodule

module OR(outOR, inA, inB); 
    output wire outOR;
    input wire inA, inB;

    ////////////////////////
    wire a;
    nor(a,inA,inB);
    NOT(outOR,a);
    ////////////////////////

endmodule

module NOT(outNOT, inA);
    output wire outNOT;
    input wire inA; 

    ////////////////////////
    nor(outNOT,inA,inA);
    ////////////////////////

endmodule