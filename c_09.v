`timescale 1ns / 1ps
module c_09(clk,value_i,value_o);

input			clk;
input	[0:127] value_i;
output	[0:127] value_o;

/////////////////////////////
xtime_09 xtime_09_u0(clk,value_i[0:7],value_o[0:7]);
xtime_09 xtime_09_u1(clk,value_i[8:15],value_o[8:15]);
xtime_09 xtime_09_u2(clk,value_i[16:23],value_o[16:23]);
xtime_09 xtime_09_u3(clk,value_i[24:31],value_o[24:31]);

xtime_09 xtime_09_u4(clk,value_i[32:39],value_o[32:39]);
xtime_09 xtime_09_u5(clk,value_i[40:47],value_o[40:47]);
xtime_09 xtime_09_u6(clk,value_i[48:55],value_o[48:55]);
xtime_09 xtime_09_u7(clk,value_i[56:63],value_o[56:63]);

xtime_09 xtime_09_u8(clk,value_i[64:71],value_o[64:71]);
xtime_09 xtime_09_u9(clk,value_i[72:79],value_o[72:79]);
xtime_09 xtime_09_u10(clk,value_i[80:87],value_o[80:87]);
xtime_09 xtime_09_u11(clk,value_i[88:95],value_o[88:95]);

xtime_09 xtime_09_u12(clk,value_i[96:103],value_o[96:103]);
xtime_09 xtime_09_u13(clk,value_i[104:111],value_o[104:111]);
xtime_09 xtime_09_u14(clk,value_i[112:119],value_o[112:119]);
xtime_09 xtime_09_u15(clk,value_i[120:127],value_o[120:127]);
/////////////////////////////

endmodule
