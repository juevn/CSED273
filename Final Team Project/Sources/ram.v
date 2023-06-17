`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/12 21:22:05
// Design Name: 
// Module Name: ram
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

//d_latch
module d_latch(
input data, en,
output q, q_
);

wire r, s;
nand na0(s, data, en);
nand na1(r, s, en);
nand na2(q, q_, s);
nand na3(q_, q, r);

endmodule  

//ram_cell module
module ram_cell(
input data, //입력 받은 데이터     
input cs,
input wr, //wr:1(write), wr:0(read)
output out
);

wire q, q_;
d_latch d1(data, cs&wr, q, q_);

assign out = cs ? q : 1'bz;
endmodule

//RAM module
module ram(
input wr,
input [1:0] addr,
input [3:0] in_data,
output [3:0] out_data
);

wire [0:3]ad_line;

and(ad_line[0], ~addr[0], ~addr[1]);
and(ad_line[1],  ~addr[0], addr[1]);
and(ad_line[2], addr[0],  ~addr[1]);
and(ad_line[3],  addr[0],  addr[1]);

ram_cell r0_3(in_data[3], ad_line[0], wr, out_data[3]);
ram_cell r0_2(in_data[2], ad_line[0], wr, out_data[2]);
ram_cell r0_1(in_data[1], ad_line[0], wr, out_data[1]);
ram_cell r0_0(in_data[0], ad_line[0], wr, out_data[0]);

ram_cell r1_3(in_data[3], ad_line[1], wr, out_data[3]);
ram_cell r1_2(in_data[2], ad_line[1], wr, out_data[2]);
ram_cell r1_1(in_data[1], ad_line[1], wr, out_data[1]);
ram_cell r1_0(in_data[0], ad_line[1], wr, out_data[0]);

ram_cell r2_3(in_data[3], ad_line[2], wr, out_data[3]);
ram_cell r2_2(in_data[2], ad_line[2], wr, out_data[2]);
ram_cell r2_1(in_data[1], ad_line[2], wr, out_data[1]);
ram_cell r2_0(in_data[0], ad_line[2], wr, out_data[0]);

ram_cell r3_3(in_data[3], ad_line[3], wr, out_data[3]);
ram_cell r3_2(in_data[2], ad_line[3], wr, out_data[2]);
ram_cell r3_1(in_data[1], ad_line[3], wr, out_data[1]);
ram_cell r3_0(in_data[0], ad_line[3], wr, out_data[0]);

endmodule
