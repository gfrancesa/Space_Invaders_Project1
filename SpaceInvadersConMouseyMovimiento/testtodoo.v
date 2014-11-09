`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:15:34 11/05/2014
// Design Name:   top
// Module Name:   C:/Users/Johan/Documents/TEC/Taller/SpaceInvaders/testtodoo.v
// Project Name:  pong
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testtodoo;

	// Inputs
	reg clk;
	reg reset;
	reg [1:0] btn1;
	reg [1:0] btn2;

	// Outputs
	wire [7:0] led;
	wire hsync;
	wire vsync;
	wire M;
	wire [7:0] rgb;

	// Bidirs
	wire ps2d;
	wire ps2c;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.reset(reset), 
		.btn1(btn1), 
		.btn2(btn2), 
		.ps2d(ps2d), 
		.ps2c(ps2c), 
		.led(led), 
		.hsync(hsync), 
		.vsync(vsync), 
		.M(M), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		btn1 = 0;
		btn2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
      #40 reset=1;
		#40 reset=0;
		// Add stimulus here

	end
      initial  
		forever 
			#10 clk=~clk; 
      
endmodule

