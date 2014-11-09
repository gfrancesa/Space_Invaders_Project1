`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:13:55 11/04/2014 
// Design Name: 
// Module Name:    Cvelocidadcambio 
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
module Cvelocidadcambio(CLK,Rst,Smv,M);//10111110101111000010000000
	 	input CLK,Rst,Smv;
		output wire M;
		//wire unseg;
//Cont1seg clocks(CLK,Rst,unseg);

Ccuantsegn segundos(CLK,Rst,Smv,M);


endmodule
