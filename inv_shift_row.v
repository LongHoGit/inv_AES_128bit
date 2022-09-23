`timescale 1ns / 1ps

module inv_shift_row(clk,s_state,shifted_state);
//right shifting
input			clk;
input [0:127] s_state;
output reg [0:127] shifted_state;

always @(posedge clk)
 begin
shifted_state[0:7] = s_state[0:7];//0 
shifted_state[8:15] = s_state[104:111];//1
shifted_state[16:23] = s_state[80:87];//2
shifted_state[24:31] = s_state[56:63];//3

shifted_state[32:39] = s_state[32:39];//4
shifted_state[40:47] = s_state[8:15];//5
shifted_state[48:55] = s_state[112:119];//6
shifted_state[56:63] = s_state[88:95];//7

shifted_state[64:71] = s_state[64:71];//8
shifted_state[72:79] = s_state[40:47];//9
shifted_state[80:87] = s_state[16:23];//10
shifted_state[88:95] = s_state[120:127];//11

shifted_state[96:103] = s_state[96:103];//12
shifted_state[104:111] = s_state[72:79];//13
shifted_state[112:119] = s_state[48:55];//14
shifted_state[120:127] = s_state[24:31];//15
 end
endmodule
