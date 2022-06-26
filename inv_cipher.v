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
`define zero 32'h00000000

//main module for encrypting
module inv_cipher(ciphertext,key,
sh_key1,sh_key2,sh_key3,sh_key4,sh_key5,sh_key6,sh_key7,sh_key8,sh_key9,sh_key10,
s_key1,s_key2,s_key3,s_key4,s_key5,s_key6,s_key7,s_key8,s_key9,s_key10,
out_key1,out_key2,out_key3,out_key4,out_key5,out_key6,out_key7,out_key8,out_key9,out_key10,
ad_key0,ad_key1,ad_key2,ad_key3,ad_key4,ad_key5,ad_key6,ad_key7,ad_key8,ad_key9,
m_key1,m_key2,m_key3,m_key4,m_key5,m_key6,m_key7,m_key8,m_key9,
plaintext);

input [0:127] ciphertext;
input [0:127] key;

output [0:127] sh_key1,sh_key2,sh_key3,sh_key4,sh_key5,sh_key6,sh_key7,sh_key8,sh_key9,sh_key10;
output [0:127] s_key1,s_key2,s_key3,s_key4,s_key5,s_key6,s_key7,s_key8,s_key9,s_key10;
output [0:127] out_key1,out_key2,out_key3,out_key4,out_key5,out_key6,out_key7,out_key8,out_key9,out_key10;
output [0:127] ad_key0,ad_key1,ad_key2,ad_key3,ad_key4,ad_key5,ad_key6,ad_key7,ad_key8,ad_key9;
output [0:127] m_key1,m_key2,m_key3,m_key4,m_key5,m_key6,m_key7,m_key8,m_key9;
output [0:127] plaintext;

wire [0:127] sh_key1,sh_key2,sh_key3,sh_key4,sh_key5,sh_key6,sh_key7,sh_key8,sh_key9,sh_key10;
wire [0:127] s_key1,s_key2,s_key3,s_key4,s_key5,s_key6,s_key7,s_key8,s_key9,s_key10;
wire [0:127] out_key1,out_key2,out_key3,out_key4,out_key5,out_key6,out_key7,out_key8,out_key9,out_key10;
wire [0:127] ad_key0,ad_key1,ad_key2,ad_key3,ad_key4,ad_key5,ad_key6,ad_key7,ad_key8,ad_key9;
wire [0:127] m_key1,m_key2,m_key3,m_key4,m_key5,m_key6,m_key7,m_key8,m_key9;
wire [0:127] none1,none2,none3,none4,none5,none6,none7,none8,none9,none10;

///////////////////////////////////////////////////////////////////////////////////////////////////////////
key_expand i_k1(key,`zero,`rcon1,out_key1,none1);
key_expand i_k2(out_key1,`zero,`rcon2,out_key2,none);
key_expand i_k3(out_key2,`zero,`rcon3,out_key3,none3);
key_expand i_k4(out_key3,`zero,`rcon4,out_key4,none4);
key_expand i_k5(out_key4,`zero,`rcon5,out_key5,none5);
key_expand i_k6(out_key5,`zero,`rcon6,out_key6,none6);
key_expand i_k7(out_key6,`zero,`rcon7,out_key7,none7);
key_expand i_k8(out_key7,`zero,`rcon8,out_key8,none8);
key_expand i_k9(out_key8,`zero,`rcon9,out_key9,none9);
key_expand i_k10(out_key9,`zero,`rcon10,out_key10,none10);

//*****************************ROUND0*****************************************

//add round key
assign ad_key0 = ciphertext^out_key10;

//*****************************ROUND1*****************************************

//shift rows
inv_shift_row i_sh1(ad_key0,sh_key1);

//sub bytes
inv_sub_byte i_s1(sh_key1,s_key1);

//add round key
assign ad_key1 = s_key1^out_key9;

//mix coulmn
inv_mix_col(ad_key1,m_key1);

//*****************************ROUND2*****************************************

//shift rows
inv_shift_row i_sh2(m_key1,sh_key2);

//sub bytes
inv_sub_byte i_s2(sh_key2,s_key2);

//add round key
assign ad_key2 = s_key2^out_key8;

//mix coulmn
inv_mix_col(ad_key2,m_key2);

//*****************************ROUND3*****************************************

//shift rows
inv_shift_row i_sh3(m_key2,sh_key3);

//sub bytes
inv_sub_byte i_s3(sh_key3,s_key3);

//add round key
assign ad_key3 = s_key3^out_key7;

//mix coulmn
inv_mix_col(ad_key3,m_key3);

//*****************************ROUND4*****************************************

//shift rows
inv_shift_row i_sh4(m_key3,sh_key4);

//sub bytes
inv_sub_byte i_s4(sh_key4,s_key4);

//add round key
assign ad_key4 = s_key4^out_key6;

//mix coulmn
inv_mix_col(ad_key4,m_key4);

//*****************************ROUND5*****************************************

//shift rows
inv_shift_row i_sh5(m_key4,sh_key5);

//sub bytes
inv_sub_byte i_s5(sh_key5,s_key5);

//add round key
assign ad_key5 = s_key5^out_key5;

//mix coulmn
inv_mix_col(ad_key5,m_key5);

//*****************************ROUND6*****************************************

//shift rows
inv_shift_row i_sh6(m_key5,sh_key6);

//sub bytes
inv_sub_byte i_s6(sh_key6,s_key6);

//add round key
assign ad_key6 = s_key6^out_key4;

//mix coulmn
inv_mix_col(ad_key6,m_key6);

//*****************************ROUND7*****************************************

//shift rows
inv_shift_row i_sh7(m_key6,sh_key7);

//sub bytes
inv_sub_byte i_s7(sh_key7,s_key7);

//add round key
assign ad_key7 = s_key7^out_key3;

//mix coulmn
inv_mix_col(ad_key7,m_key7);

//*****************************ROUND8*****************************************

//shift rows
inv_shift_row i_sh8(m_key7,sh_key8);

//sub bytes
inv_sub_byte i_s8(sh_key8,s_key8);

//add round key
assign ad_key8 = s_key8^out_key2;

//mix coulmn
inv_mix_col(ad_key8,m_key8);

//*****************************ROUND9*****************************************

//shift rows
inv_shift_row i_sh9(m_key8,sh_key9);

//sub bytes
inv_sub_byte i_s9(sh_key9,s_key9);

//add round key
assign ad_key9 = s_key9^out_key1;

//mix coulmn
inv_mix_col(ad_key9,m_key9);

//*****************************ROUND10*****************************************

//shift rows
inv_shift_row i_sh10(m_key9,sh_key10);

//sub bytes
inv_sub_byte i_s10(sh_key10,s_key10);

//add round key
assign plaintext = s_key10^key;


endmodule
