`timescale 1ns / 1ps
module add_round_key(clk,state,round_key,ad_key);

input		  clk;
input [0:127] state;
input [0:127] round_key;

output reg [0:127] ad_key;

always @(posedge clk)
 begin
 	ad_key = round_key ^ state;
 end

endmodule