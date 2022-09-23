`timescale 1ns / 1ps

`define rcon1 32'h01000000
`define rcon2 32'h02000000
`define rcon3 32'h04000000
`define rcon4 32'h08000000
`define rcon5 32'h10000000
`define rcon6 32'h20000000
`define rcon7 32'h40000000
`define rcon8 32'h80000000
`define rcon9 32'h1b000000
`define rcon10 32'h36000000
`define rcon10 32'h36000000
`define zero 128'h0

//main module for encrypting
module inv_cipher(	clk,reset_n,
							ciphertext,key,
							reg_plaintext);

// Clock and reset.
input clk;
input reset_n;

// Data
input [0:127] ciphertext;
input [0:127] key;

output reg [0:127] reg_plaintext;

wire [0:127] sh_key1,sh_key2,sh_key3,sh_key4,sh_key5,sh_key6,sh_key7,sh_key8,sh_key9,sh_key10;
wire [0:127] s_key1,s_key2,s_key3,s_key4,s_key5,s_key6,s_key7,s_key8,s_key9,s_key10;
wire [0:127] out_key1,out_key2,out_key3,out_key4,out_key5,out_key6,out_key7,out_key8,out_key9,out_key10;
wire [0:127] ad_key0,ad_key1,ad_key2,ad_key3,ad_key4,ad_key5,ad_key6,ad_key7,ad_key8,ad_key9;
wire [0:127] m_key1,m_key2,m_key3,m_key4,m_key5,m_key6,m_key7,m_key8,m_key9;
wire [0:127] plaintext;

///////////////////////////////////////////////////////////////////////////////////////////////////////////
key_expand i_k1(clk,key,`zero,`rcon1,out_key1);
key_expand i_k2(clk,out_key1,`zero,`rcon2,out_key2);
key_expand i_k3(clk,out_key2,`zero,`rcon3,out_key3);
key_expand i_k4(clk,out_key3,`zero,`rcon4,out_key4);
key_expand i_k5(clk,out_key4,`zero,`rcon5,out_key5);
key_expand i_k6(clk,out_key5,`zero,`rcon6,out_key6);
key_expand i_k7(clk,out_key6,`zero,`rcon7,out_key7);
key_expand i_k8(clk,out_key7,`zero,`rcon8,out_key8);
key_expand i_k9(clk,out_key8,`zero,`rcon9,out_key9);
key_expand i_k10(clk,out_key9,`zero,`rcon10,out_key10);

//*****************************ROUND0*****************************************

//add round key
add_round_key a0(clk,ciphertext,out_key10,ad_key0);
//assign ad_key0 = ciphertext ^ out_key10;

//*****************************ROUND1*****************************************

//shift rows
inv_shift_row i_sh1(clk,ad_key0,sh_key1);

//sub bytes
inv_sub_byte i_s1(clk,sh_key1,s_key1);

//add round key
add_round_key a1(clk,s_key1,out_key9,ad_key1);
//assign ad_key1 = s_key1^out_key9;

//mix coulmn
inv_mix_col i_m1(clk,ad_key1,m_key1);

//*****************************ROUND2*****************************************

//shift rows
inv_shift_row i_sh2(clk,m_key1,sh_key2);

//sub bytes
inv_sub_byte i_s2(clk,sh_key2,s_key2);

//add round key
add_round_key a2(clk,s_key2,out_key8,ad_key2);
//assign ad_key2 = s_key2^out_key8;

//mix coulmn
inv_mix_col i_m2(clk,ad_key2,m_key2);

//*****************************ROUND3*****************************************

//shift rows
inv_shift_row i_sh3(clk,m_key2,sh_key3);

//sub bytes
inv_sub_byte i_s3(clk,sh_key3,s_key3);

//add round key
add_round_key a3(clk,s_key3,out_key7,ad_key3);
//assign ad_key3 = s_key3^out_key7;

//mix coulmn
inv_mix_col i_m3(clk,ad_key3,m_key3);

//*****************************ROUND4*****************************************

//shift rows
inv_shift_row i_sh4(clk,m_key3,sh_key4);

//sub bytes
inv_sub_byte i_s4(clk,sh_key4,s_key4);

//add round key
add_round_key a4(clk,s_key4,out_key6,ad_key4);
//assign ad_key4 = s_key4^out_key6;

//mix coulmn
inv_mix_col i_m4(clk,ad_key4,m_key4);

//*****************************ROUND5*****************************************

//shift rows
inv_shift_row i_sh5(clk,m_key4,sh_key5);

//sub bytes
inv_sub_byte i_s5(clk,sh_key5,s_key5);

//add round key
add_round_key a5(clk,s_key5,out_key5,ad_key5);
//assign ad_key5 = s_key5^out_key5;

//mix coulmn
inv_mix_col i_m5(clk,ad_key5,m_key5);

//*****************************ROUND6*****************************************

//shift rows
inv_shift_row i_sh6(clk,m_key5,sh_key6);

//sub bytes
inv_sub_byte i_s6(clk,sh_key6,s_key6);

//add round key
add_round_key a6(clk,s_key6,out_key4,ad_key6);
//assign ad_key6 = s_key6^out_key4;

//mix coulmn
inv_mix_col i_m6(clk,ad_key6,m_key6);

//*****************************ROUND7*****************************************

//shift rows
inv_shift_row i_sh7(clk,m_key6,sh_key7);

//sub bytes
inv_sub_byte i_s7(clk,sh_key7,s_key7);

//add round key
add_round_key a7(clk,s_key7,out_key3,ad_key7);
//assign ad_key7 = s_key7^out_key3;

//mix coulmn
inv_mix_col i_m7(clk,ad_key7,m_key7);

//*****************************ROUND8*****************************************

//shift rows
inv_shift_row i_sh8(clk,m_key7,sh_key8);

//sub bytes
inv_sub_byte i_s8(clk,sh_key8,s_key8);

//add round key
add_round_key a8(clk,s_key8,out_key2,ad_key8);
//assign ad_key8 = s_key8^out_key2;

//mix coulmn
inv_mix_col i_m8(clk,ad_key8,m_key8);

//*****************************ROUND9*****************************************

//shift rows
inv_shift_row i_sh9(clk,m_key8,sh_key9);

//sub bytes
inv_sub_byte i_s9(clk,sh_key9,s_key9);

//add round key
add_round_key a9(clk,s_key9,out_key1,ad_key9);
//assign ad_key9 = s_key9^out_key1;

//mix coulmn
inv_mix_col i_m9(clk,ad_key9,m_key9);

//*****************************ROUND10*****************************************

//shift rows
inv_shift_row i_sh10(clk,m_key9,sh_key10);

//sub bytes
inv_sub_byte i_s10(clk,sh_key10,s_key10);

//add round key
add_round_key a10(clk,s_key10,key,plaintext);
//assign plaintext = s_key10^key;

//================SYNCHRONOUS=======================================================
 always @(posedge clk or negedge reset_n) begin
	if(!reset_n)
	 begin
		reg_plaintext = 0;
	 end
	 
	else
	 begin
		reg_plaintext = plaintext;
	 end
 end
endmodule
