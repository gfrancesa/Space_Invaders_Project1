`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:32:23 08/25/2014 
// Design Name: 
// Module Name:    Deco 
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
module Deco(in,out);
	input [3:0]in;
	output reg [7:0]out;
	
	
   always @ ( in)
	        case (in)
			          4'b0000 :out=8'b10001000;
						 4'b0001 :out=8'b10111011;
						 4'b0010 :out=8'b11000010;
						 4'b0011 :out=8'b10010010;
						 4'b0100 :out=8'b10110001;
						 4'b0101 :out=8'b10010100;
						 4'b0110 :out=8'b10000100;
						 4'b0111 :out=8'b10111000;
						 4'b1000 :out=8'b10000000;
						 4'b1001 :out=8'b10010000;
						 4'b1010 :out=8'b10100000;
						 4'b1011 :out=8'b10000101;
						 4'b1100 :out=8'b11001100;
						 4'b1101 :out=8'b10000011;
						 4'b1110 :out=8'b11000100;
						 4'b1111 :out=8'b11100100;
						 
						 default out=8'd0;
				endcase
	

	/*

4'b0000 :out=8'b00010001; #10001000
						 4'b0001 :out=8'b11011101; ##10111011
						 4'b0010 :out=8'b01000011;#11000010
						 4'b0011 :out=8'b01001001;#10010010
						 4'b0100 :out=8'b10001101;#10110001
						 4'b0101 :out=8'b00101001;#10010100
						 4'b0110 :out=8'b00100001;#10000100
						 4'b0111 :out=8'b01011111;#11111010
						 4'b1000 :out=8'b00000001;#10000000
						 4'b1001 :out=8'b00001001;#10010000
						 4'b1010 :out=8'b00000101;#10100000
						 4'b1011 :out=8'b10100001;#10000101
						 4'b1100 :out=8'b00110011;#11001100
						 4'b1101 :out=8'b11000001;#10000011
						 4'b1110 :out=8'b00100011;#11000100
						 4'b1111 :out=8'b00100111;#11100100
						 	NET "OUT[0]" LOC = "L18"; A
NET "OUT[1]" LOC = "J17"; F
NET "OUT[2]" LOC = "F18"; B
NET "OUT[3]" LOC = "H14"; G
NET "OUT[4]" LOC = "G14"; E
NET "OUT[5]" LOC = "D16"; D
NET "OUT[6]" LOC = "D17"; C
	*/
endmodule