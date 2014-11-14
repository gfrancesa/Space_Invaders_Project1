`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:00:55 10/05/2014 
// Design Name: 
// Module Name:    Gen_Posic_Random 
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
module Gen_Posic_Random
   		   #(		parameter SEMILLA = 3,
								 MULTIPLICADOR = 4,
								 CONSTANTE_ADITIVA = 3,
								 DIVISOR = 9,
								 BITS_RESULTADO = 11
			  )(
					input wire clk,
					output wire [BITS_RESULTADO-1:0] resultado
			
				);
				//$monitor("%b",xn1);
				reg [BITS_RESULTADO-1:0] xn1=SEMILLA;
				
				always @(posedge clk)
				begin
					xn1 = ((MULTIPLICADOR * xn1)+CONSTANTE_ADITIVA)%DIVISOR;
					
				end
				assign resultado = xn1;
				
			
endmodule
