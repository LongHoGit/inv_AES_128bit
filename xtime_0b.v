`timescale 1ns / 1ps
module xtime_0b(clk,value_i, value_o);//11

input 			  clk;
input		[0:7] value_i;
output reg  [0:7] value_o;

///////////////////
wire [0:7] temp_02,temp_04,temp_05,temp_0a;
///////////////////

///////////////////
xtime_02 xtime_02_u0(clk,value_i, temp_02);
xtime_02 xtime_02_u1(clk,temp_02, temp_04);
assign temp_05 = temp_04^value_i;
xtime_02 xtime_02_u2(clk,temp_05, temp_0a);
///////////////////
always @(posedge clk)
 begin
  value_o = temp_0a^value_i;
 end

endmodule