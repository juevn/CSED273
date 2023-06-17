`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/15 04:48:35
// Design Name: 
// Module Name: input_gen
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


module input_gen(
input [4:0] st,
input [3:0]number,
output [1:0] in
    );
    wire [1:0]adrs;
    wire [3:0]out_data;
    wire gt,eq,lt;
    wire wr;
    wire [1:0]comp_out; // mux에 넣을 input1
    wire [1:0]key_out; // mux에 넣을 input2
    
    assign adrs[0] = (~st[4] & ~st[3] & st[2] & ~st[0]) 
    | (~st[4] & st[3] & ~st[2] & st[1] & st[0]) 
    | (~st[4] & st[3] & st[2] & ~st[1] & st[0]) 
    | (st[4] & ~st[3] & ~st[2] & st[1] & st[0]) 
    | (~st[3] & st[2] & ~st[1] & ~st[0]);
    
    assign adrs[1] = (~st[4] & ~st[3] & st[1] & ~st[0]) 
    | (~st[4] & st[3] & ~st[1] & st[0]) 
    | (~st[3] & ~st[2] & st[1] & ~st[0]) 
    | (st[4] & ~st[3] & st[2] & ~st[1] & ~st[0]);
    
    assign wr = (st[4] & ~st[3] & ~st[2] & st[0]) 
    | (st[4] & ~st[3] & ~st[2] & st[1]) 
    | (st[4] & ~st[3] & st[2] & ~st[1] & ~st[0]);
    
    //write or read
    ram r1(wr, adrs, number, out_data);
    
    //comparing
    comp_4bit comp(number, out_data, gt,eq,lt);
    
    //assign
    assign comp_out[1] = 0;
    assign comp_out[0] = ~eq;
    
    ////* and # input process
    assign key_out[1] = number[3]&number[1];
    assign key_out[0] = number[0];
    
    ////mux operation
    mux m1(comp_out,key_out,number[3]&number[1],in);

       
endmodule
