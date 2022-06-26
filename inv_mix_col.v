`timescale 1ns / 1ps


//Matrix for Inverse mixcoloumn:

//0e 0b 0d 09

//09 0e 0b 0d

//0d 09 0e 0b

//0b 0d 09 0e

////////////////////////////////

module inv_mix_col(i_shift,i_mix);


input [0:127] i_shift;//S(row,col)
output [0:127] i_mix;//S'(row,col)

//Column0
assign i_mix[0:7] = xtime_x0e(i_shift[0:7])^xtime_x0b(i_shift[8:15])^xtime_x0d(i_shift[16:23])^xtime_x09(i_shift[24:31]);//S'(0,0)
assign i_mix[8:15] = xtime_x09(i_shift[0:7])^xtime_x0e(i_shift[8:15])^xtime_x0b(i_shift[16:23])^xtime_x0d(i_shift[24:31]);//S'(1,0)
assign i_mix[16:23] = xtime_x0d(i_shift[0:7])^xtime_x09(i_shift[8:15])^xtime_x0e(i_shift[16:23])^xtime_x0b(i_shift[24:31]);//S'(2,0)
assign i_mix[24:31] = xtime_x0b(i_shift[0:7])^xtime_x0d(i_shift[8:15])^xtime_x09(i_shift[16:23])^xtime_x0e(i_shift[24:31]);//S'(3,0)
//Column1
assign i_mix[32:39] = xtime_x0e(i_shift[32:39])^xtime_x0b(i_shift[40:47])^xtime_x0d(i_shift[48:55])^xtime_x09(i_shift[56:63]);//
assign i_mix[40:47] = xtime_x09(i_shift[32:39])^xtime_x0e(i_shift[40:47])^xtime_x0b(i_shift[48:55])^xtime_x0d(i_shift[56:63]);//
assign i_mix[48:55] = xtime_x0d(i_shift[32:39])^xtime_x09(i_shift[40:47])^xtime_x0e(i_shift[48:55])^xtime_x0b(i_shift[56:63]);//
assign i_mix[56:63] = xtime_x0b(i_shift[32:39])^xtime_x0d(i_shift[40:47])^xtime_x09(i_shift[48:55])^xtime_x0e(i_shift[56:63]);//
//Column2
assign i_mix[64:71] = xtime_x0e(i_shift[64:71])^xtime_x0b(i_shift[72:79])^xtime_x0d(i_shift[80:87])^xtime_x09(i_shift[88:95]);//
assign i_mix[72:79] = xtime_x09(i_shift[64:71])^xtime_x0e(i_shift[72:79])^xtime_x0b(i_shift[80:87])^xtime_x0d(i_shift[88:95]);//
assign i_mix[80:87] = xtime_x0d(i_shift[64:71])^xtime_x09(i_shift[72:79])^xtime_x0e(i_shift[80:87])^xtime_x0b(i_shift[88:95]);//
assign i_mix[88:95] = xtime_x0b(i_shift[64:71])^xtime_x0d(i_shift[72:79])^xtime_x09(i_shift[80:87])^xtime_x0e(i_shift[88:95]);//
//Column3
assign i_mix[96:103] = xtime_x0e(i_shift[96:103])^xtime_x0b(i_shift[104:111])^xtime_x0d(i_shift[112:119])^xtime_x09(i_shift[120:127]);//
assign i_mix[104:111] = xtime_x09(i_shift[96:103])^xtime_x0e(i_shift[104:111])^xtime_x0b(i_shift[112:119])^xtime_x0d(i_shift[120:127]);//
assign i_mix[112:119] = xtime_x0d(i_shift[96:103])^xtime_x09(i_shift[104:111])^xtime_x0e(i_shift[112:119])^xtime_x0b(i_shift[120:127]);//
assign i_mix[120:127] = xtime_x0b(i_shift[96:103])^xtime_x0d(i_shift[104:111])^xtime_x09(i_shift[112:119])^xtime_x0e(i_shift[120:127]);//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function [0:7] xtime;//Bit string is 1-bit-left-shift and xor with itself
	input [0:7] i;
	begin
		if(i[0] == 0)
			xtime = {i[1:7],1'b0};
		else
			xtime = {i[1:7],1'b0}^8'h1b;
	end
endfunction



function [0:7] xtime_x09;//Calculate value x 8'h09

	input [0:7] temp;
	reg [0:7] temp_02,temp_04,temp_08;

	begin

		temp_02=xtime(temp);

		temp_04=xtime(temp_02);

		temp_08=xtime(temp_04);

		xtime_x09=temp_08^temp;

	end

endfunction



function [0:7] xtime_x0b;//Calculate value x 8'h0b

	input [0:7] temp;
	reg [0:7] temp_02,temp_05,temp_0a;

	begin

		temp_02=xtime(temp);

		temp_05=xtime(temp_02)^temp;

		temp_0a=xtime(temp_05);

		xtime_x0b=xtime(temp_0a)^temp;

	end

endfunction



function [0:7] xtime_x0d;//Calculate value x 8'h0d

	input [0:7] temp;
	reg [0:7] temp_03,temp_06;

	begin

		temp_03=xtime(temp)^temp;;

		temp_06=xtime(temp_03);

		xtime_x0d=xtime(temp_06)^temp;

	end

endfunction



function [0:7] xtime_x0e;//Calculate value x 8'h0e

	input [0:7] temp;
	reg [0:7] temp_03,temp_07;

	begin

		temp_03=xtime(temp)^temp;;

		temp_07=xtime(temp_03)^temp;

		xtime_x0e=xtime(temp_07);

	end

endfunction


endmodule
