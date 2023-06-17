`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/12 22:02:54
// Design Name: 
// Module Name: mux
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

module mux(
input [1:0]a,
input [1:0]b,
input sel,
output [1:0]out
);

wire [1:0]c0;
wire [1:0]c1;

and(c0[0],~sel,a[0]);
and(c0[1],~sel,a[1]);
and(c1[0],sel,b[0]);
and(c1[1],sel,b[1]);

or(out[0],c0[0],c1[0]); 
or(out[1],c0[1],c1[1]); 

endmodule

