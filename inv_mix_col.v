`timescale 1ns / 1ps

//Matrix for Inverse mixcoloumn:

//0e 0b 0d 09

//09 0e 0b 0d

//0d 09 0e 0b

//0b 0d 09 0e

////////////////////////////////

module inv_mix_col(clk,i_shift,i_mix);

input			clk;
input	[0:127] i_shift;//S(row,col)
output reg	[0:127] i_mix;//S'(row,col)

///////////////////////////////////////////////
wire [0:127] wire_09_o, wire_0b_o, wire_0d_o, wire_0e_o;

c_09 c_09_u(clk,i_shift,wire_09_o);
c_0b c_0b_u(clk,i_shift,wire_0b_o);
c_0d c_0d_u(clk,i_shift,wire_0d_o);
c_0e c_0e_u(clk,i_shift,wire_0e_o);
///////////////////////////////////////////////
always @(posedge clk)
 begin
//Column0
i_mix[0:7] = wire_0e_o[0:7]^wire_0b_o[8:15]^wire_0d_o[16:23]^wire_09_o[24:31];//S'(0,0)
i_mix[8:15] = wire_09_o[0:7]^wire_0e_o[8:15]^wire_0b_o[16:23]^wire_0d_o[24:31];//S'(1,0)
i_mix[16:23] = wire_0d_o[0:7]^wire_09_o[8:15]^wire_0e_o[16:23]^wire_0b_o[24:31];//S'(2,0)
i_mix[24:31] = wire_0b_o[0:7]^wire_0d_o[8:15]^wire_09_o[16:23]^wire_0e_o[24:31];//S'(3,0)
//Column1
i_mix[32:39] = wire_0e_o[32:39]^wire_0b_o[40:47]^wire_0d_o[48:55]^wire_09_o[56:63];//
i_mix[40:47] = wire_09_o[32:39]^wire_0e_o[40:47]^wire_0b_o[48:55]^wire_0d_o[56:63];//
i_mix[48:55] = wire_0d_o[32:39]^wire_09_o[40:47]^wire_0e_o[48:55]^wire_0b_o[56:63];//
i_mix[56:63] = wire_0b_o[32:39]^wire_0d_o[40:47]^wire_09_o[48:55]^wire_0e_o[56:63];//
//Column2
i_mix[64:71] = wire_0e_o[64:71]^wire_0b_o[72:79]^wire_0d_o[80:87]^wire_09_o[88:95];//
i_mix[72:79] = wire_09_o[64:71]^wire_0e_o[72:79]^wire_0b_o[80:87]^wire_0d_o[88:95];//
i_mix[80:87] = wire_0d_o[64:71]^wire_09_o[72:79]^wire_0e_o[80:87]^wire_0b_o[88:95];//
i_mix[88:95] = wire_0b_o[64:71]^wire_0d_o[72:79]^wire_09_o[80:87]^wire_0e_o[88:95];//
//Column3
i_mix[96:103] = wire_0e_o[96:103]^wire_0b_o[104:111]^wire_0d_o[112:119]^wire_09_o[120:127];//
i_mix[104:111] = wire_09_o[96:103]^wire_0e_o[104:111]^wire_0b_o[112:119]^wire_0d_o[120:127];//
i_mix[112:119] = wire_0d_o[96:103]^wire_09_o[104:111]^wire_0e_o[112:119]^wire_0b_o[120:127];//
i_mix[120:127] = wire_0b_o[96:103]^wire_0d_o[104:111]^wire_09_o[112:119]^wire_0e_o[120:127];//
///////////////////////////////////////////////
 end
endmodule
