`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:55 10/07/2014 
// Design Name: 
// Module Name:    Cuenta 
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
module Cuenta(CLK,RST,En,count1,count2,count3,count4
    );
	 
	 input CLK,RST,En;
	 output wire [3:0] count1,count2,count3,count4;
	 wire Z1,Z2,Z3,Z4;
Contador10 conta1(CLK,(RST|Z4),En,Z1, count1);

Contador10 conta2(CLK,RST,Z1,Z2, count2);

Contador10 conta3(CLK,RST,Z2,Z3, count3);

Contador10 conta4(CLK,RST,Z3,Z4, count4);

endmodule
