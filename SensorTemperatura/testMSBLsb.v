`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:52:49 11/06/2014
// Design Name:   TopClock
// Module Name:   C:/Users/Johan/Documents/TEC/Taller/I2cVhdlSabado/testMSBLsb.v
// Project Name:  I2cVhdlSabado
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TopClock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testMSBLsb;

	// Inputs
	reg clk;
	reg reset_n;
	reg ena;
	reg ena2;
	reg [6:0] addr;
	reg rw;

	// Outputs
	wire [7:0] data_rd;
	wire [7:0] seg;
	wire [3:0] an;

	// Bidirs
	wire sda;
	wire scl;

	// Instantiate the Unit Under Test (UUT)
	TopClock uut (
		.clk(clk), 
		.reset_n(reset_n), 
		.ena(ena), 
		.ena2(ena2), 
		.addr(addr), 
		.rw(rw), 
		.data_rd(data_rd), 
		.seg(seg), 
		.an(an), 
		.sda(sda), 
		.scl(scl)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset_n = 0;
		ena = 0;
		ena2 = 0;
		addr = 0;
		rw = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

