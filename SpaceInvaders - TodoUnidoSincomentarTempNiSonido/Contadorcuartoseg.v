`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:51:26 11/10/2014 
// Design Name: 
// Module Name:    Contadorcuartoseg 
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
module Contadorcuartoseg(CLK,Rst,EN,Z);
	input CLK,Rst,EN;
	reg [23:0]count;
	output wire Z;
	
	
	always @ (posedge CLK)
			if (Rst|Z)
				count=24'd0;
				
			else if(EN)
				count=count+1'b1;
			else 
				count=count;
			
			assign Z=(count==24'd10500000);//(count==10'b1111111111);//



endmodule
