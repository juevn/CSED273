`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/11 19:36:05
// Design Name: 
// Module Name: comp
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

//1 bit comparator
module comp_1(
    input a,
    input b,
    output eq,
    output lt,
    output gt
);

wire c1;
nand(c1,a,b);
and(gt,a,c1);
and(lt,c1,b);
nor(eq,gt,lt);

endmodule

//4 bit comparator
module comp_4bit(
    input [3:0] a,
    input [3:0] b,
    output gt,
    output eq,
    output lt
); 

wire [3:0] gt1;
wire [3:0] eq1;
wire [3:0] lt1;
wire c0,c1,c2,c3,c4,c5;

comp_1 cp01(a[0],b[0],eq1[0],lt1[0],gt1[0]);
comp_1 cp02(a[1],b[1],eq1[1],lt1[1],gt1[1]);
comp_1 cp03(a[2],b[2],eq1[2],lt1[2],gt1[2]);
comp_1 cp04(a[3],b[3],eq1[3],lt1[3],gt1[3]);     

and(c0,gt1[2],eq1[3]);
and(c1,lt1[2],eq1[3]);
and(c2,gt1[1],eq1[2],eq1[3]);
and(c3,lt1[1],eq1[2],eq1[3]);
and(c4,gt1[0],eq1[1],eq1[2],eq1[3]);
and(c5,lt1[0],eq1[1],eq1[2],eq1[3]);

and(eq,eq1[0],eq1[1],eq1[2],eq1[3]);
or(gt,gt1[3],c0,c2,c4);
or(lt,lt1[3],c1,c3,c5);
    ////////////////////////

endmodule


