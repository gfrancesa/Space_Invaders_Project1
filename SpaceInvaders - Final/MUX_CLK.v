`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:54:39 10/08/2014 
// Design Name: 
// Module Name:    MUX_CLK 
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
module MUX_CLK(IN1,IN2,SEL,OUT); 
	input IN1,IN2;
	input SEL; 
	output reg OUT; 
	
	always @ (IN1 or IN2 or SEL) 
		case (SEL)
			 1'b0: OUT=IN1;
		
			 
			 1'b1: OUT=IN2;
			 
		endcase 

endmodule
