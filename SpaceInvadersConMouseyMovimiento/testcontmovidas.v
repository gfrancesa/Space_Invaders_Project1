`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:37:43 11/04/2014
// Design Name:   ContMovidas
// Module Name:   C:/Users/Johan/Documents/TEC/Taller/SpaceInvaders/testcontmovidas.v
// Project Name:  pong
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ContMovidas
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testcontmovidas;

	// Inputs
	reg CLK;
	reg Rst;
	reg EN;

	// Outputs
	wire M1;

	// Instantiate the Unit Under Test (UUT)
	ContMovidas uut (
		.CLK(CLK), 
		.Rst(Rst), 
		.EN(EN), 
		.M1(M1)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		Rst = 0;
		EN = 0;

		// Wait 100 ns for global reset to finish
		#100;
      #20 Rst=1;
		#20 Rst=0;
		
		// Add stimulus here

	end
      initial  
		forever 
			#10 CLK=~CLK; 
endmodule

