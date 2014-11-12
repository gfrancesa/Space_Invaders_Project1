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
					CLK,RST,disparo,destruyo,movio,conto,
					reset_sonido,fre_up,fre_down,cuente,suene);
		input CLK,RST;
		input disparo,destruyo,movio,conto;
		output reg reset_sonido,fre_up,fre_down,cuente,suene;
	
	//Registros de estado
	reg [2 :0] PRE,FUT;
	parameter T0=3'b000,T1=3'b001,T2=3'b010,T3=3'b011,T4=3'b100,T5=3'b101, T6=3'b110,T7=3'b111;
	
	//Registro de transicion de estado
	always @(negedge CLK or posedge RST)
		if (RST)
			PRE=T0;
		else
			PRE=FUT;
			
	//Red de estado futuro
	always @ (PRE or disparo or destruyo or movio or conto)
		case (PRE)//En cada caso se evaluan las condiciones para hacer un salto a otro estado.
			T0: if (disparo)//Se espera a que se de algun evento
					FUT=T1;
				 else if (destruyo) 
				   FUT=T4;
				 else if (movio) 
				   FUT=T3;
				 else 
					FUT=T0;
					
			T1:  FUT=T2;
					
			T2: 
					FUT=T7;
					
			T3: 
					if (conto)//Se espera a que pase el tiempo que tiene que sonar.
					FUT=T0;
				 else 
					FUT=T3;
					
			T4:  
					if (conto)//Se espera a que pase el tiempo que prepara el sonido de destruyo
					FUT=T5;
				 else 
					FUT=T4;
			
			T5:  
					if (conto)//Se espera a que pase el tiempo que prepara el sonido de destruyo
					FUT=T6;
				 else 
					FUT=T5;
					
			T6: if (conto)//Se espera a que pase el tiempo que tiene que sonar
					FUT=T7;
				 else 
					FUT=T6;
			
			T7: if (conto)//Se espera a que pase el tiempo que tiene que sonar
					FUT=T0;
				 else 
					FUT=T7;
					
			endcase
			
	//Asignación de salidas
	
	always @ (PRE)//Al momento de estar en un estado, se ponen ciertas salidas en "1" y las demas en "0".
		case (PRE)
			T0: begin 
					reset_sonido=1;//Espera los eventos, mantiene todo en reset.
					fre_up=0;
					fre_down=0;
					cuente=0;
					suene=0;
					
				end
			T1: begin 
					reset_sonido=0;
					fre_up=1;
					fre_down=0;
					cuente=0;
					suene=0;
					
				end
			T2: begin 
					reset_sonido=0;
					fre_up=1;
					fre_down=0;
					cuente=0;
					suene=0;
				end
			T3: begin  
					reset_sonido=0;
					fre_up=0;
					fre_down=1;
					cuente=1;
					suene=1;
				end
			T4: begin  
					reset_sonido=0;
					fre_up=0;
					fre_down=1;
					cuente=1;
					suene=0;
				end
			T5: begin  
					reset_sonido=0;
					fre_up=0;
					fre_down=1;
					cuente=1;
					suene=0;
				end
			T6: begin  
					reset_sonido=0;
					fre_up=0;
					fre_down=1;
					cuente=1;
					suene=0;
				end
         T7: begin 
					reset_sonido=0;
					fre_up=1;
					fre_down=0;
					cuente=1;
					suene=1;
				end				
				
		endcase


endmodule
