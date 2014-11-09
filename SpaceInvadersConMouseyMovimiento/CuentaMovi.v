`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:58:42 11/04/2014 
// Design Name: 
// Module Name:    CuentaMovi 
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
module CuentaMovi(CLK,Rst,EN,count);//10111110101111000010000000
	 	input CLK,Rst,EN;
	 output reg [10:0]count;
	//output wire M1,M2,M3;
	
	initial count=11'd0;
	
	always @ (posedge CLK)
			if (Rst) 
				count=11'd0;
			else if (EN)
				count=count+1'b1;
		   else 
				count=count;
//	assign M1 = (count==11'd80);
//	assign M2 = (count==11'd80);
//	assign M3 = (count==11'd80);


endmodule
