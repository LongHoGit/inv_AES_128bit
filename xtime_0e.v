`timescale 1ns / 1ps
module xtime_0e(clk,value_i, value_o);//14

input 			  clk;
input		[0:7] value_i;
output reg	[0:7] value_o;

///////////////////
wire [0:7] temp_0e;
///////////////////
xtime_0d xtime_0d_u0(clk,value_i, temp_0e);
///////////////////
always @(posedge clk)
 begin
  value_o = temp_0e^value_i;
 end

endmodule