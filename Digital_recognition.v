`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/02 18:12:50
// Design Name: 
// Module Name: Digital_recognition
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Digital_recognition(
input tft_vclk,
input tft_vs,
input tst_n,
input th_flag,
input [11:0] hcount,
input [11:0] vcount,
input [11:0] hcount_l,
input [11:0] vcount_r,
input [11:0] hcount_r,
input [11:0] vcount_l,
input th_flag_rise,
input th_flag_fall,
input tft_vs_rise,
input tft_vs_fall,
input [2:0] frame_cnt,
output reg x1_l,
output reg x1_r,
output reg x2_l,
output reg x2_r,
output reg [3:0] y,
output reg [3:0] x1, 
output reg [3:0] x2
always @ (posedge tft_vclk or negedge rst_n)begin
if(!rst_n)begin
h_2<=12'd0;
v_5<=12'd0;
v_3<=12'd0;
h_2_r<=18'd0;
v_5_r<=23'd0;
v_3_r<=23'd0;
hcount_l_r<=18'b0;
hcount_r_r<=18'b0;
vcount_l_r<=18'b0;
vcount_r_r<=18'b0;
end
else if(frame_cnt==3'd3)begin
if(tft_vs_rise)begin
hcount_l_r<={hcount_l,6'b0};
hcount_r_r<={hcount_r,6'b0};
hcount_l_r<={vcount_l,6'b0};
hcount_r_r<={vcount_r,6'b0};
end
if(tft_vs_rise_r0)begin
h_2_r<=(hcount_r_r+hcount_l_r)>>1;
v_5_r<=vcount_r_r*p_2_5+vcount_1_r*p_3_5;
end
end
    );
endmodule
