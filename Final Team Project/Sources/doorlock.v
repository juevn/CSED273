`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/14 21:18:55
// Design Name: 
// Module Name: doorlock
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

module doorlock(
input [3:0]sw, //switch 
//input reset, //reset
input btnCenter, //btnCenter
input [3:0] key_row, //keypad_row
output [2:0] key_col, //keypad_col
output [2:0]led, //led
output [0:3]led_in, //led about input
output [0:4]led_st // led about state
);

wire [1:0] led_out;
wire [4:0] state;

// reset button using keypad
assign key_col = 3'b100;

//fsm process
(* DONT_TOUCH = "yes" *)fsm f1(sw,~btnCenter, ~key_row[0], led_out, state);

//lightnening
//ledctrl mod (led_clk, led_out, led);
ledctrl mod (led_out, led);

assign led_in = sw;
assign led_st = state;
endmodule
