`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:51:41 11/04/2014 
// Design Name: 
// Module Name:    MovenLogic 
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
module MovenLogic(clk,reset,mueva,posxE1
    );
	 input wire clk,reset,mueva;
	 output wire [10:0] posxE1;
	 wire M1,M2,M3,Sm,Rs,Moverclock,RstMov;
	 wire contay;
	 wire [10:0] Cmovidas;

 


   Cmilis posx1(clk,reset,Sm,Rs,posxE1);
	
	FSM_Puntos llegay(clk,reset,mueva,contay);
	
	Cvelocidadcambio velocidadmover1(clk,reset,contay,Moverclock);//mueva
	
	Machine mueve(clk,reset,Moverclock,M1,M2,M3,Sm,Rs,RstMov);
	
	
	CuentaMovi movidas(clk,  reset|RstMov ,Sm|Rs, Cmovidas);
	//movidas(clk,  reset|RstMov ,Sm|Rs, Cmovidas);
	
	assign M1 = (posxE1<11'd20);
	assign M2 = (posxE1>11'd400);
	assign M3 = (posxE1<11'd20);
	
endmodule
