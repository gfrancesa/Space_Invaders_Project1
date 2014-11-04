`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:50:21 08/26/2014 
// Design Name: 
// Module Name:    Cmilis 
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
module Cmilis(CLK,Rst,EN,M);//10111110101111000010000000
	 	input CLK,Rst,EN;
	reg [26:0]count;
	output wire M;
	
	
	always @ (posedge CLK)
			if (Rst|M)
				count=26'd0;
			else if (EN)
				count=count+1'b1;
		   else 
				count=count;
				
		assign M=(count==26'd16);
								// 1011111010111100001000000


endmodule
