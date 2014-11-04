`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:55:53 11/04/2014
// Design Name:   Machine
// Module Name:   C:/Users/Johan/Documents/TEC/Taller/SpaceInvaders/testmaquinamover.v
// Project Name:  pong
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Machine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testmaquinamover;

	// Inputs
	reg CLK;
	reg RST;
	reg mueva;

	// Outputs
	wire [10:0] posx;

	// Instantiate the Unit Under Test (UUT)
	Machine uut (
		.CLK(CLK), 
		.RST(RST), 
		.mueva(mueva), 
		.posx(posx)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 0;
		mueva = 0;

		// Wait 100 ns for global reset to finish
		#100;
		 
		#20 RST=1;
		#20 RST=0;
		
		
		
		// Add stimulus here

	end
	initial forever 
			#80 mueva=~mueva;
		initial  
		forever 
			#10 CLK=~CLK; 
      
endmodule

