`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:57:10 11/10/2014 
// Design Name: 
// Module Name:    TiempoSonando 
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
module TiempoSonando(CLK,Rst,EN,Conto
    );
	 input CLK,Rst,EN;
	 output Conto;
	 
	 wire uncuartoSeg;

Contadorcuartoseg uncuarto(CLK,Rst, EN,uncuartoSeg);

ContTimesound veces(CLK,Rst,uncuartoSeg,Conto);

endmodule
