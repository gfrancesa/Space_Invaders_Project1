`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:28 11/09/2014 
// Design Name: 
// Module Name:    ContaActualiza 
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
module ContaActualiza(CLK,Rst,Z);
	input CLK,Rst;
	reg [23:0]count;
	output wire Z;
	
	
	always @ (posedge CLK)
			if (Rst|Z)
				count=24'd0;
			else 
				count=count+1'b1;
			assign Z=(count==24'd12500000);//(count==10'b1111111111);//



endmodule
