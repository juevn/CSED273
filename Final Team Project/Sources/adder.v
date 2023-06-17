`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/15 16:17:26
// Design Name: 
// Module Name: adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module halfAdder(
    input in_a,
    input in_b,
    output out_s,
    output out_c
    );

    xor(out_s, in_a, in_b);
    and(out_c, in_a, in_b);

endmodule

module fullAdder(
    input in_a,
    input in_b,
    input in_c,
    output out_s,
    output out_c
    );

    wire a, b, c;
    halfAdder h1(in_a,in_b, a, b);
    halfAdder h2(a, in_c, out_s, c);
    or(out_c, b, c);

endmodule

module fourbit_adder(
    input [3:0] in_a,
    input [3:0] in_b,
    input in_c,
    output [3:0] out_s,
    output out_c
    );

    wire c0, c1, c2;
    
    fullAdder f0(in_a[0],in_b[0],in_c, out_s[0],c0); 
    fullAdder f1(in_a[1],in_b[1],c0, out_s[1],c1); 
    fullAdder f2(in_a[2],in_b[2],c1, out_s[2],c2); 
    fullAdder f3(in_a[3],in_b[3],c2, out_s[3],out_c); 
    
endmodule

module adder(
    input [23:0] in_a,
    input [23:0] in_b,
    input in_c,
    output [23:0] out_s,
    output out_c,
    output blinking
    );

    wire c0, c1, c2, c3, c4, c5;
    assign blinking = ~blinking & out_s[23];
    assign out_s = ~out_c & out_s;
    fourbit_adder f0({in_a[3],in_a[2],in_a[1],in_a[0]},{in_b[3],in_b[2],in_b[1],in_b[0]},in_c, {out_s[3],out_s[2],out_s[1],out_s[0]},c0); 
    fourbit_adder f1({in_a[7],in_a[6],in_a[5],in_a[4]},{in_b[7],in_b[6],in_b[5],in_b[4]},c0, {out_s[7],out_s[6],out_s[5],out_s[4]},c1); 
    fourbit_adder f2({in_a[11],in_a[10],in_a[9],in_a[8]},{in_b[11],in_b[10],in_b[9],in_b[8]},c1, {out_s[11],out_s[10],out_s[9],out_s[8]},c2); 
    fourbit_adder f3({in_a[15],in_a[14],in_a[13],in_a[12]},{in_b[15],in_b[14],in_b[13],in_b[12]},c3, {out_s[15],out_s[14],out_s[13],out_s[12]},c4); 
    fourbit_adder f4({in_a[19],in_a[18],in_a[17],in_a[16]},{in_b[19],in_b[18],in_b[17],in_b[16]},c4, {out_s[19],out_s[18],out_s[17],out_s[16]},c5); 
    fourbit_adder f5({in_a[23],in_a[22],in_a[21],in_a[20]},{in_b[23],in_b[22],in_b[21],in_b[20]},c5, {out_s[23],out_s[22],out_s[21],out_s[20]},out_c); 

endmodule