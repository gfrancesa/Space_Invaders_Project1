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
module Display(CLK,RST,out2,an,In1, In2, In3, In4);
	input CLK,RST;
	input [3:0]In1, In2, In3, In4;
	output wire [7:0]out2;
	output wire [3:0]an;
	 
	wire [1:0]SEL;
	wire [3:0]OUT;
	wire Z;
	
/*
	assign an[0]=1'b0;
	assign an[1]=1'b0;
	assign an[2]=1'b0;
	assign an[3]=1'b0;
	*/
	
	 
MUX4x1 mux(In1, In2, In3, In4,SEL,OUT, an); 
Deco deco_b(OUT, out2);

Contador conta(CLK,Z,RST,SEL);
Conta2 conta2(CLK,RST,Z); 


endmodule