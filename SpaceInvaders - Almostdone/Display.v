`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:31:52 08/25/2014 
// Design Name: 
// Module Name:    Display 
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
module Display(CLK,RST,P,out2,an);
	input CLK,RST,P;
	output wire [7:0]out2;
	output wire [3:0]an;
	 
	wire [1:0]SEL;
	wire [3:0]OUT;
	wire Z;
	
   wire [3:0] count1,count2,count3,count4;
Cuenta puntos(CLK,RST,P,count1,count2,count3,count4);


MUX4x1 mux(count4,count3,count2,count1,SEL,OUT, an); 

Deco deco_b(OUT, out2);

Contador conta(CLK,Z,RST,SEL);
Conta2 conta2(CLK,RST,Z);


endmodule