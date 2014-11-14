`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:49:46 11/12/2014 
// Design Name: 
// Module Name:    DecoTemp_Colores 
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
module DecoTemp_Colores(in,out);
	input [3:0]in;
	output reg [7:0]out;
	
	
   always @ ( in)
	        case (in)
			          4'b1010 :out=8'b11100000;//Celeste Oscuro
						 4'b1011 :out=8'b11110011;//Celete claro
						 4'b1100 :out=8'b11110111;//Blanco
						 4'b1101 :out=8'b00101111;//Amarillo
						 4'b1110 :out=8'b01010111;//naraja
						 4'b1111 :out=8'b01010101;//rojo
						 
						 default out=8'b11100000;
				endcase
	

endmodule


