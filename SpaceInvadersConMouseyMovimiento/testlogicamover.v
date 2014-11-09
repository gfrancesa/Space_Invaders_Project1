`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:35:54 11/04/2014
// Design Name:   MovenLogic
// Module Name:   C:/Users/Johan/Documents/TEC/Taller/SpaceInvaders/testlogicamover.v
// Project Name:  pong
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MovenLogic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testlogicamover;

	// Inputs
	reg clk;
	reg reset;
	reg mueva;

	// Outputs
	wire [10:0] posxE1;

	// Instantiate the Unit Under Test (UUT)
	MovenLogic uut (
		.clk(clk), 
		.reset(reset), 
		.mueva(mueva), 
		.posxE1(posxE1)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		mueva = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#20 reset=1;
		#20 reset=0;
		
		// Add stimulus here

	end
      initial  
		forever 
			#10 clk=~clk; 
      
endmodule

