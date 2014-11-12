`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:29:54 08/25/2008 
// Design Name: 
// Module Name:    i2s_tst 
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
module i2s_tst_top(clk, btn,  JA);
	input clk;				// 50MHz oscillator
	input	[3:0] btn;		// Capsense pads
	//output [3:0] Led; 	// LEDs
	output [3:0] JA;		// Digilent socket JA - I2S DAC

   wire [3:0] Led;
	wire reset_sonido,fre_up,fre_down,cuente,suene;
	wire conto,disparo,movio,destruyo;
	// Clock divider
	reg clk2;
	always @(posedge clk)
		clk2 <= ~clk2;
	
	// Instance of I2S test module
	i2s_tst
		ui2stst(.clk(clk2), .reset( btn[3] | reset_sonido),
			.btn({suene,fre_down,fre_up}),
			.led(Led),
			.mclk(JA[0]),
			.sclk(JA[2]),
			.lrck(JA[1]),
			.sdout(JA[3])
		);
	//Se resiven las señales de que hubo movimiento y disparo
	//Solo se toma en cuenta 1 ciclo aunque dure mas tiempo activa
	// asi para cada señal
	FSM_Puntos solounavesDisp(clk2,btn[3],btn[0],disparo);	
	FSM_Puntos solounavesMov(clk2,btn[3],btn[1],movio);
   FSM_Puntos solounavesDest(clk2,btn[3],btn[2],destruyo);	
	
	//Cada sonido dura segun lo establese el modulo tiemposonidos
	TiempoSonando tiemposonidos(clk2, btn[3]|reset_sonido, cuente ,conto);
	
	//La logica de sonidos espera cada evento y genera un sonido para cada uno de ellos
	Machine logicaSonidos(clk2,btn[3],disparo,destruyo,movio,conto,
					reset_sonido,fre_up,fre_down,cuente,suene);
endmodule
