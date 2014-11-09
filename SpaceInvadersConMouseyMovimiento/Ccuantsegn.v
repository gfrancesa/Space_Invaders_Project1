`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:12:40 11/04/2014 
// Design Name: 
// Module Name:    Ccuantsegn 
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
module Ccuantsegn(CLK,Rst,Sm,M);//10111110101111000010000000
	 	input CLK,Rst,Sm;
	reg [2:0]count;
	output wire M;
	
	
	always @ (posedge CLK)
			if (Rst|M) 
				count=3'd0;
			else if (Sm)
				count=count+1'b1;
		   else 
				count=count;
				
		assign M=(count==3'b001);//29'd105000000


endmodule

