`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:28:36 08/26/2014 
// Design Name: 
// Module Name:    Conta2 
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
module Conta2(CLK,Rst,Z);
	input CLK,Rst;
	reg [15:0]count;
	output wire Z;
	
	
	always @ (posedge CLK)
			if (Rst)
				count=16'd0;
			else 
				count=count+1'b1;
					assign Z=(count==16'b1100001101010000);//(count==10'b1111111111);//



endmodule
