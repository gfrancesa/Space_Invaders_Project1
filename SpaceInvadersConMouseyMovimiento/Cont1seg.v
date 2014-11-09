`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:08:37 11/04/2014 
// Design Name: 
// Module Name:    Cont1seg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Cont1seg(CLK,Rst,M);//10111110101111000010000000
	 	input CLK,Rst;
	reg [28:0]count;
	output wire M;
	
	
	always @ (posedge CLK)
			if (Rst) 
				count=29'd0;
		   else 
				count=count+1'b1;
				
		assign M=(count==29'd1000);//M=(count==29'd100000000);


endmodule
