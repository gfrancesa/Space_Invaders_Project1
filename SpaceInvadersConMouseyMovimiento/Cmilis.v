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
module Cmilis(CLK,Rst,Sm,Rs,count);//10111110101111000010000000
	 	input CLK,Rst,Sm,Rs;
	output reg [10:0]count;
	//output wire M;
	
	
	always @ (posedge CLK)
			if (Rst) 
				count=11'd228;
			else if (Rs)
				count=count-1'b1;
			else if (Sm)
				count=count+1'b1;
		   else 
				count=count;
				
		//assign M=(count==10'd16);
								// 1011111010111100001000000


endmodule
