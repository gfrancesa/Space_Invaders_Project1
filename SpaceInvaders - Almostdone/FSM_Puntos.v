`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:33 10/07/2014 
// Design Name: 
// Module Name:    FSM_Puntos 
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
module FSM_Puntos(
					CLK,RST,Z,
					P);
		input CLK,RST,Z;
		output reg P;
	
	//Registros de estado
	reg [1 :0] PRE,FUT;
	parameter T0=3'b00,T1=3'b01,T2=3'b10,T3=3'b011;
	
	//Registro de transicion de estado
	always @(negedge CLK or posedge RST)
		if (RST)
			PRE=T0;
		else
			PRE=FUT;
			
	//Red de estado futuro
	always @ (PRE or Z)
		case (PRE)//En cada caso se evaluan las condiciones para hacer un salto a otro estado.
			T0: if (Z)
					FUT=T1;
				else 
					FUT=T0;
					
			T1: FUT=T2;
					
			T2: if (Z)
					FUT=T2;
				else 
					FUT=T0;
					
			T3: FUT=T0;
					
			
			endcase
			
	//Asignación de salidas
	
	always @ (PRE)//Al momento de estar en un estado, se ponen ciertas salidas en "1" y las demas en "0".
		case (PRE)//H,Led,RestCont, Cero, SContAL, SContTime, EndCTime,Result, OneSeg, Nine
			T0: P=1'b0;
			T1: P=1'b1;
			T2: P=1'b0;
			T3: P=1'b0;
			
		endcase


endmodule


