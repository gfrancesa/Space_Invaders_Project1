`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:58:36 11/09/2014
// Design Name:   FSM_Logic
// Module Name:   C:/Users/Johan/Documents/TEC/Taller/I2cVhdlSabado/testLogic.v
// Project Name:  I2cVhdlSabado
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM_Logic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testLogic;

	// Inputs
	reg CLK;
	reg RST;
	reg [7:0] data_rd;
	reg Z;
	reg busy;

	// Outputs
	wire P;
	wire [7:0] MSB;
	wire [7:0] LSB;

	// Instantiate the Unit Under Test (UUT)
	FSM_Logic uut (
		.CLK(CLK), 
		.RST(RST), 
		.data_rd(data_rd), 
		.Z(Z), 
		.busy(busy), 
		.P(P), 
		.MSB(MSB), 
		.LSB(LSB)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 0;
		data_rd = 0;
		Z = 0;
		busy = 0;

		// Wait 100 ns for global reset to finish
		#100;
      #20 RST = 1;
		#20 RST = 0;
		// Add stimulus here

	end
      initial
		forever
		#10 CLK=~CLK;
endmodule

