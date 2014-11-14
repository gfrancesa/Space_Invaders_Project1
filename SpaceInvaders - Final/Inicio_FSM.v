`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:11:39 10/08/2014 
// Design Name: 
// Module Name:    Inicio_FSM 
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
module Inicio_FSM(
					CLK,RST,Start,
					Perdio,Senal_sing);
		input CLK,RST,Start,Perdio;
		output reg Senal_sing;
	
	//Registros de estado
	reg [1 :0] PRE,FUT;
	parameter T0=3'b00,T1=3'b01,T2=3'b10,T3=3'b011;
	
	//Registro de transicion de estado
	always @(negedge CLK or posedge RST)
		if (RST)
			PRE<=T0;
		else
			PRE<=FUT;
			
	//Red de estado futuro
	always @ (PRE or Start or Perdio)
		case (PRE)//En cada caso se evaluan las condiciones para hacer un salto a otro estado.
			T0: if (Start)
					FUT=T1;
				else 
					FUT=T0;
					
			T1: if (Perdio)
					FUT=T2;
				else 
					FUT=T1;
					
			T2: if (Perdio)
					FUT=T2;
				else 
					FUT=T3;
					
			T3: FUT=T0;
					
			
			endcase
			
	//Asignación de salidas
	
	always @ (PRE)//Al momento de estar en un estado, se ponen ciertas salidas en "1" y las demas en "0".
		case (PRE)//H,Led,RestCont, Cero, SContAL, SContTime, EndCTime,Result, OneSeg, Nine
			T0:   Senal_sing=1'b0;
			T1:
						Senal_sing=1'b1;
			T2: 
					   Senal_sing=1'b1;
			    
			T3: 
						Senal_sing=1'b0;
			    
			
		endcase




endmodule
