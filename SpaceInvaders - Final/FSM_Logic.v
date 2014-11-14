`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:22:00 11/09/2014 
// Design Name: 
// Module Name:    FSM_Logic 
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
module FSM_Logic(
					CLK,RST,data_rd,Z,busy,
					P,MSB,LSB);
		input wire CLK,RST,Z,busy;
		input wire [7:0]data_rd;
		output reg P;
	   output reg [7:0]MSB,LSB;
	//Registros de estado
	reg [3 :0] PRE,FUT;
	parameter T0=4'b0000,T1=4'b0001,T2=4'b0010,T3=4'b0011,T4=4'b0100,T5=4'b0101,T6=4'b0110,T7=4'b0111,
				 T8=4'b1000,T9=4'b1001,T10=4'b1010,T11=4'b1011,T12=4'b1100,T13=4'b1101,T14=4'b1110,T15=4'b1111;
	
	//Registro de transicion de estado
	always @(negedge CLK or posedge RST)
		if (RST)
			PRE=T0;
		else
			PRE=FUT;
			
	//Red de estado futuro
	always @ (PRE or Z or busy)
		case (PRE)//En cada caso se evaluan las condiciones para hacer un salto a otro estado.
			T0: if (Z)//La bandera Z indica que se debe hacer una lectura
					FUT=T1;
				 else 
					FUT=T0;
					
			T1: if (busy)//Se espera hasta que el modulo de comuniacion este ocupado
					FUT=T2;
				else  
					FUT=T1;
					
			T2: if (~busy)//Cuando deja de estar ocupado paso a recuperar los datos MSB
					FUT=T3;
				 else 
					FUT=T2;	
			T3: if (busy)//tomo MSB y espero a que vuelva a estar ocupado el I"C
					FUT=T4;
				else 
					FUT=T3;
			T4: FUT=T5;//Dejo el enable activado unos clock's mas.
			T5: FUT=T6;
			T6: FUT=T7;
			T7: FUT=T11;
			T8: if (busy)//Se quita el enable y espero a que deje de estar ocupado para recuperar datos LSB
					FUT=T8;
				else 
					FUT=T9;
			T9: FUT=T0;//Recupero datos LSB y paso a estar en modo de espera.
			T10: FUT=T0;
			T11: FUT=T12;
			T12: FUT=T13;
			T13: FUT=T8;
			T14: FUT=T0;
			T15: FUT=T0;
					
			
			endcase
			
	//Asignación de salidas
	
	always @ (PRE)//Al momento de estar en un estado, se ponen ciertas salidas en "1" y las demas en "0".
		case (PRE)
			T0: begin//En espera.
					P=1'b0;
					MSB=MSB;
					LSB=LSB;
				 end
			T1: begin
					P=1'b1;
					MSB=MSB;
					LSB=LSB;
				 end
			T2: begin
					P=1'b1;
					MSB=MSB;
					LSB=LSB;
				 end
			T3: begin
					P=1'b1;
					MSB=data_rd;
					LSB=LSB;
				 end
			//Se toman los MSB --------------
			
			T4: begin
					P=1'b1;
					MSB=MSB;
					LSB=LSB;
				 end
			T5: begin
					P=1'b1;
					MSB=MSB;
					LSB=LSB;
				 end
			T6: begin
					P=1'b1;
					MSB=MSB;
					LSB=LSB;
				 end
			T7: begin
					P=1'b1;
					MSB=MSB;
					LSB=LSB;
				 end
			T8: begin
					P=1'b0;
					MSB=MSB;
					LSB=LSB;
				 end
			T9: begin
					P=1'b0;
					MSB=MSB;
					LSB=data_rd;
				 end
				 //se toman LSB
			T10: begin
					P=1'b0;
					MSB=MSB;
					LSB=LSB;
				 end
			T11: begin
					P=1'b0;
					MSB=MSB;
					LSB=LSB;
				 end
			T12: begin
					P=1'b0;
					MSB=MSB;
					LSB=LSB;
				 end
			T13: begin
					P=1'b0;
					MSB=MSB;
					LSB=LSB;
				 end
			T14: begin
					P=1'b0;
					MSB=MSB;
					LSB=LSB;
				 end
			T15: begin
					P=1'b0;
					MSB=MSB;
					LSB=LSB;
				 end
			
		endcase


endmodule


