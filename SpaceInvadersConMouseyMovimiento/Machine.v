`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:24:58 08/25/2014 
// Design Name: 
// Module Name:    Machine 
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
module Machine(
					CLK,RST,mueva,M1,M2,M3,Sm,Rs,RstMov);
		input CLK,RST;
		input mueva,M1,M2,M3;
		output reg Sm,Rs,RstMov;
		//reg [8:0] movidas;
		reg [1:0]vez;
		//reg movidas300,movidas250
	//movidas=9'd0;
			//vez=2'b00;
	//Registros de estado
	initial 
				begin
					//movidas=9'd0;
					vez=2'd0;
					PRE=3'b000;
				end
	
	reg [2 :0] PRE,FUT;
	parameter T0=3'b000,T1=3'b001,T2=3'b010,T3=3'b011,T4=3'b100,T5=3'b101, T6=3'b110,T7=3'b111;
	
	//Registro de transicion de estado
	always @(negedge CLK or posedge RST)
		if (RST)
			PRE=T0;
			
		else
			PRE=FUT;
			
	//Red de estado futuro
	always @ (PRE or mueva)
		case (PRE)//En cada caso se evaluan las condiciones para hacer un salto a otro estado.
			T0: if (mueva  && vez == 2'b00)//and movidas=9'd250
					FUT=T1;
				else if (mueva  && vez == 2'b01)
					FUT=T4;
				else if (mueva  && vez == 2'b10)
					FUT=T3;	
				else if (  vez == 2'b11)
					FUT=T6;
				else 
					FUT=T0;
					
			T1: if (M1)
					FUT=T5;
				else 
					FUT=0;
					
			T4: if (M2)
					FUT=T5;
				else 
					FUT=T0;
					
			T3: if (M3)
					FUT=T5;
				else 
					FUT=T0;
			
			T5: FUT=T0;
					
			T6: FUT=T0;
			
			T2: FUT=T0;
			
			T7: FUT=T0;
					
			endcase
			
	//Asignación de salidas
	
	always @ (PRE)//Al momento de estar en un estado, se ponen ciertas salidas en "1" y las demas en "0".
		case (PRE)//H,Led,RestCont, Cero, SContAL, SContTime, EndCTime,Result, OneSeg, Nine
			T0: begin 
					//movidas = movidas;
					vez = vez;
					Sm=0;
					Rs=0;
					RstMov=0;
				end
			T1: begin 
					//movidas = movidas + 1'b1;
					vez = vez;
					Sm=0;
					Rs=1;
					RstMov=0;
					//posx = posx - 1'b1;
					//izquierda
				end
			T2: begin //H,Led,RestCont, Cero, SContAL, SContTime, EndCTime,Result, OneSeg, Nine
					//movidas = movidas ;
					vez =  2'b01;
					Sm=0;
					Rs=0;
					RstMov=1;
					//posx = posx ;
				end
			T3: begin  //H,Led,RestCont, Cero, SContAL, SContTime, EndCTime,Result, OneSeg, Nine
					//movidas = movidas + 1'b1;
					vez = vez;
					Sm=0;
					Rs=1;
					RstMov=0;
					//posx = posx - 1'b1;
					//izquierda
				end
			T4: begin  //H,Led,RestCont, Cero, SContAL, SContTime, EndCTime,Result, OneSeg, Nine
					//movidas = movidas + 1'b1;
					vez = vez;
					Sm=1;
					Rs=0;
					RstMov=0;
					//posx = posx + 1'b1;
					//derecha
				end
			T5: begin  //H,Led,RestCont, Cero, SContAL, SContTime, EndCTime,Result, OneSeg, Nine
					//movidas = 9'd0;
					vez = vez + 1'b1;
					Sm=0;
					Rs=0;
					RstMov=1;
					//posx = posx;
					//izquierda
				end
			T6: begin  //H,Led,RestCont, Cero, SContAL, SContTime, EndCTime,Result, OneSeg, Nine
					//movidas = movidas ;
					vez =  2'b01;
					Sm=0;
					Rs=0;
					RstMov=1;
					//posx = posx;
					//derecha
				end
         T7: begin 
					//movidas = movidas ;
					vez =   2'b01;
					Sm=0;
					Rs=0;
					RstMov=1;
					//posx = posx;
					//derecha
				end				
				
		endcase


endmodule
