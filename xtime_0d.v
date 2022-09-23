`timescale 1ns / 1ps
module xtime_0d(clk,value_i, value_o);//13

input 			  clk;
input		[0:7] value_i;
output reg	[0:7] value_o;

///////////////////
wire [0:7] temp_02,temp_03,temp_06,temp_0c;
///////////////////

///////////////////
xtime_02 xtime_02_u0(clk,value_i, temp_02);
assign temp_03 = temp_02^value_i;
xtime_02 xtime_02_u1(clk,temp_03, temp_06);
xtime_02 xtime_02_u2(clk,temp_06, temp_0c);
///////////////////
always @(posedge clk)
 begin
  value_o = temp_0c^value_i;
 end

endmodule