`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:33:04 08/25/2014 
// Design Name: 
// Module Name:    Mux4x1 
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
`timescale 1ns / 1ps

module MUX4x1(IN1,IN2,IN3,IN4,SEL,OUT, an); 
	input [3:0] IN1,IN2,IN3,IN4; 
	input [1:0]SEL; 
	output reg [3:0]OUT; 
	output reg [3:0]an;
	
	always @ (IN1 or IN2 or IN3 or IN4 or SEL) 
		case (SEL)
			 2'b00: begin 
			 OUT=IN1; an=4'b0111;
			 end
			 
			 2'b01: begin
			 OUT=IN2; an=4'b1011;
			 end
			  
			 2'b10: begin
			 OUT=IN3; an=4'b1101;
			 end
			 2'b11: begin
			 OUT=IN4; an=4'b1110;
			 end
			 
		endcase 
 endmodule
