`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:30:59 11/04/2014 
// Design Name: 
// Module Name:    Cvez 
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
module Cvez(CLK,Rst,Sm,Rs,count);//10111110101111000010000000
	 	input CLK,Rst,Sm,Rs;
	output reg [1:0]count;
	//output wire M;
	
	
	always @ (posedge CLK)
			if (Rst) 
				count=2'd128;
			else if (Rs)
				count=count-1'b1;
			else if (Sm)
				count=count+1'b1;
		   else 
				count=count;
				


endmodule
