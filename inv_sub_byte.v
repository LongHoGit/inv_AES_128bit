`timescale 1ns / 1ps

module inv_sub_byte(clk,in_key,out_key);

input clk;
input [0:127] in_key;
output reg [0:127] out_key;
//////////////////////////////////
wire [0:127] wire_out_key;
//////////////////////////////////
inv_sbox i_sb0(in_key[0:3],in_key[4:7],wire_out_key[0:7]);
inv_sbox i_sb1(in_key[8:11],in_key[12:15],wire_out_key[8:15]);
inv_sbox i_sb2(in_key[16:19],in_key[20:23],wire_out_key[16:23]);
inv_sbox i_sb3(in_key[24:27],in_key[28:31],wire_out_key[24:31]);

inv_sbox i_sb4(in_key[32:35],in_key[36:39],wire_out_key[32:39]);
inv_sbox i_sb5(in_key[40:43],in_key[44:47],wire_out_key[40:47]);
inv_sbox i_sb6(in_key[48:51],in_key[52:55],wire_out_key[48:55]);
inv_sbox i_sb7(in_key[56:59],in_key[60:63],wire_out_key[56:63]);

inv_sbox i_sb8(in_key[64:67],in_key[68:71],wire_out_key[64:71]);
inv_sbox i_sb9(in_key[72:75],in_key[76:79],wire_out_key[72:79]);
inv_sbox i_sb10(in_key[80:83],in_key[84:87],wire_out_key[80:87]);
inv_sbox i_sb11(in_key[88:91],in_key[92:95],wire_out_key[88:95]);

inv_sbox i_sb12(in_key[96:99],in_key[100:103],wire_out_key[96:103]);
inv_sbox i_sb13(in_key[104:107],in_key[108:111],wire_out_key[104:111]);
inv_sbox i_sb14(in_key[112:115],in_key[116:119],wire_out_key[112:119]);
inv_sbox i_sb15(in_key[120:123],in_key[124:127],wire_out_key[120:127]);
//////////////////////////////////
always @(posedge clk)
 begin
 	out_key = wire_out_key;
 end
endmodule
