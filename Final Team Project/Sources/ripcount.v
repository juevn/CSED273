`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/15 17:10:23
// Design Name: 
// Module Name: ripcount
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

module t_ff(
output reg q,
input clk,
input rst,
input t
);

always @(negedge clk) begin
    if(!rst)
        q <= 0;
    else
        if(t)
            q <= ~q;
        else
            q <= q;
end
endmodule

module four_ripcount(
input clk,
input reset,
output [3:0] counter_out
);

t_ff f0(counter_out[0], clk, reset, 1);
t_ff f1(counter_out[1], counter_out[0], reset, 1);
t_ff f2(counter_out[2], counter_out[1], reset, 1);
t_ff f3(counter_out[3], counter_out[2], reset, 1);
endmodule

module ripcount(
input clk,
input reset,
output [23:0] count_out
);

four_ripcount fr1(clk, reset, {count_out[3], count_out[2], count_out[1], count_out[0]});
four_ripcount fr2(clk, reset, {count_out[7], count_out[6], count_out[5], count_out[4]});
four_ripcount fr3(clk, reset, {count_out[11], count_out[10], count_out[9], count_out[8]});
four_ripcount fr4(clk, reset, {count_out[15], count_out[14], count_out[13], count_out[12]});
four_ripcount fr5(clk, reset, {count_out[19], count_out[18], count_out[17], count_out[16]});
four_ripcount fr6(clk, reset, {count_out[23], count_out[22], count_out[21], count_out[20]});

endmodule
