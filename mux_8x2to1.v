`timescale 1ns / 1ps
module mux_8x2to1(	d0,d1, 
					sel, out);

input [7:0] d0,d1;
input sel;

output reg [7:0] out;

always @(d0,d1,sel) 
 begin
	case(sel)
		0:	out = d0;
		1:	out = d1;
	endcase
 end

endmodule

