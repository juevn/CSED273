`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/12 17:10:31
// Design Name: 
// Module Name: fsm
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
(* DONT_TOUCH = "yes" *)
module fsm(
input [3:0]number,
input clk,
input reset,
output [1:0] fsm_out,
output [4:0] st
);

// wire [4:0] st; // 5-bit state
wire da,db,dc,dd,de;
wire [1:0]in; //input of fsm

input_gen ingen(st, number, in);

////dff equation
assign da =  (~st[3] & ~st[2] & ~st[1] & ~st[0] & in[1] & in[0]) 
| (~st[4] & st[3] & st[2] & ~st[1] & st[0] & ~in[1] & in[0]) 
| (~st[4] & st[3] & st[2] & st[1] & ~st[0]) | (st[4] & ~st[3] & ~st[2] & st[1]) 
| (st[4] & ~st[3] & ~st[1] & ~in[1]) | (st[4] & ~st[3] & ~st[1] & st[0] & ~in[0]) 
| (st[4] & ~st[3] & ~st[2] & in[0]) | (st[4] & ~st[3] & st[2] & ~st[1] & ~st[0]);

assign db = (~st[4] & ~st[3] & st[2] & st[1] & ~in[1]) 
| (~st[4] & ~st[3] & st[2] & st[1] & st[0]) | (~st[4] & st[3] & ~st[2]) 
| (~st[4] & st[3] & ~st[1] & ~st[0]) | (~st[4] & st[3] & st[0] & ~in[1] & ~in[0]) 
| (~st[4] & st[3] & ~st[1] & in[1]) | (~st[4] & st[2] & st[1] & st[0] & in[0]);

assign dc = (~st[4] & ~st[2] & st[1] & ~in[1]) 
| (~st[3] & ~st[2] & st[1] & st[0]) | (~st[4] & ~st[3] & st[2] & ~st[0] & in[1]) 
| (~st[4] & st[3] & ~st[2] & st[0] & ~in[1] & in[0]) | (~st[4] & st[3] & ~st[2] & st[1] & ~st[0]) 
| (~st[4] & st[2] & ~st[1] & ~st[0]) | (~st[3] & st[2] & ~st[1] & ~st[0]) | (~st[3] & st[2] & ~st[1] & ~in[1]) 
| (~st[3] & st[2] & ~st[1] & ~in[0]) | (~st[4] & st[2] & ~st[1] & in[1]) | (~st[4] & ~st[3] & st[1] & ~st[0] & ~in[1] & ~in[0]) | (~st[4] & st[3] & st[2] & st[0] & ~in[1] & ~in[0]) | (~st[4] & st[3] & st[2] & st[1] & st[0] & in[0]);

assign dd = (~st[4] & ~st[3] & st[2] & ~st[1] & st[0]) | (~st[4] & ~st[3] & st[1] & ~st[0] & in[1]) 
| (~st[4] & st[3] & ~st[1] & ~st[0] & ~in[1] & in[0]) | (~st[4] & ~st[1] & st[0] & ~in[1] & ~in[0]) 
| (~st[4] & st[3] & st[1] & st[0] & in[0]) | (~st[4] & st[3] & ~st[2] & st[1] & st[0] & in[1]) 
| (~st[4] & st[3] & st[2] & ~st[1] & ~st[0]) | (st[4] & ~st[3] & ~st[2] & ~st[1] & st[0]) 
| (st[4] & ~st[3] & ~st[2] & st[1] & ~st[0]) | (~st[4] & ~st[3] & ~st[1] & st[0] & ~in[1]) 
| (~st[4] & ~st[3] & st[2] & ~st[1] & ~in[1]) | (~st[4] & ~st[3] & st[2] & ~st[0] & ~in[1] & ~in[0]) 
| (~st[4] & st[3] & st[2] & st[0] & ~in[1] & ~in[0]);

assign de = (~st[4] & ~st[3] & ~st[2] & ~st[1] & in[1]) 
| (~st[3] & st[2] & ~st[1] & ~in[1] & in[0]) | (~st[4] & ~st[3] & st[2] & st[1] & ~st[0] & ~in[1] & ~in[0]) 
| (~st[4] & st[3] & ~st[2] & ~st[1] & ~in[1] & ~in[0]) | (st[4] & ~st[3] & ~st[2] & st[1] & ~st[0]) 
| (st[4] & ~st[3] & st[2] & ~st[1] & ~st[0]) | (~st[4] & ~st[3] & ~st[2] & st[0] & in[0]) 
| (~st[4] & ~st[3] & ~st[2] & st[1] & ~in[1] & in[0]) | (~st[4] & ~st[3] & ~st[2] & st[1] & st[0])
| (~st[3] & st[2] & ~st[1] & st[0] & ~in[0]) | (~st[4] & ~st[1] & st[0] & in[1]) 
| (~st[4] & st[3] & st[0] & ~in[1] & ~in[0]) | (~st[4] & ~st[2] & st[0] & in[1]) 
| (~st[4] & st[3] & st[2] & st[1] & st[0] & in[0]);

d_ff d_a(clk, reset, da, st[4]);
d_ff d_b(clk, reset, db, st[3]);
d_ff d_c(clk, reset, dc, st[2]);
d_ff d_d(clk, reset, dd, st[1]);
d_ff d_e(clk, reset, de, st[0]);

//// output
assign fsm_out[1] = st[4]&~st[3]&~st[2]&~st[1]&~st[0];
assign fsm_out[0] = ~st[4]&st[3]&st[2]&st[1]&st[0];


endmodule
