`timescale 1ns / 1ps
module xtime_02(clk,value_i,value_o);

input			clk;
input		[0:7] value_i;
output reg  [0:7] value_o;

wire [0:7] d0,d1;
wire [0:7] wire_value_o;
//////////////////////
assign d0 = {value_i[1:7],1'b0};
assign d1 = {value_i[1:7],1'b0}^8'h1b;
mux_8x2to1 mux_u0(d0,d1,value_i[0],wire_value_o);
//////////////////////

always @(posedge clk)
 begin
 	/*
	if(value_i[0] == 0)
		value_o = {value_i[1:7],1'b0};
	else
		value_o = {value_i[1:7],1'b0}^8'h1b;
	*/
	value_o = wire_value_o;
 end
 
endmodule