`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:32 10/07/2014 
// Design Name: 
// Module Name:    Contador10 
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
module Contador10(CLK,Rst,En,Z, count);
	input CLK,Rst,En;
	output reg [3:0]count;
	output wire Z;
	
	
	always @ (posedge CLK)
			if (Rst | Z)
				count=4'd0;
			else if(En) 
				count=count+1'b1;
			else
			   count=count;
	assign Z=(count==4'b1010);


endmodule
