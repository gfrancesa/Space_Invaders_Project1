`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:52:08 11/10/2014 
// Design Name: 
// Module Name:    ContTimesound 
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
module ContTimesound(CLK,Rst,EN,Z);
	input CLK,Rst,EN;
	reg [2:0]count;
	output wire Z;
	
	
	always @ (posedge CLK)
			if (Rst|Z)
				count=3'd0;
			else if (EN)
				count=count+1'b1;
			else
				count=count;
			assign Z=(count==3'd1);//(count==10'b1111111111);//


endmodule
