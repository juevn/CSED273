`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/13 19:01:26
// Design Name: 
// Module Name: led_mux
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

module ledctrl (
       // input led_clk,
       input [1:0] led_out,//selection input of mux
       output [2:0] led //mux output
       );
      
       
       assign led[2] = ~led_out[1]&led_out[0]; 
       assign led[1] = led_out[1]^led_out[0];
       assign led[0] = ~led_out[1]&led_out[0]; 
       

endmodule