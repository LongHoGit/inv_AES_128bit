`timescale 1ns / 1ps
module xtime_09(clk,value_i, value_o);

input 			  clk;
input		[0:7] value_i;
output reg	[0:7] value_o;

///////////////////
wire [0:7] temp_02,temp_04,temp_08;
///////////////////

///////////////////
xtime_02 xtime_02_u0(clk,value_i,temp_02);
xtime_02 xtime_02_u1(clk,temp_02,temp_04);
xtime_02 xtime_02_u2(clk,temp_04,temp_08);
///////////////////
always @(posedge clk)
 begin
  value_o = temp_08^value_i;
 end
endmodule