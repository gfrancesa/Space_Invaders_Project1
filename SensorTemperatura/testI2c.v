`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:03:27 11/01/2014
// Design Name:   i2c_master
// Module Name:   C:/Users/Johan/Documents/TEC/Taller/I2cVhdlSabado/testI2c.v
// Project Name:  I2cVhdlSabado
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: i2c_master
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testI2c;

	// Inputs
	reg clk;
	reg reset_n;
	reg ena;
	reg [6:0] addr;
	reg rw;
	reg [7:0] data_wr;

	// Outputs
	wire busy;
	wire [7:0] data_rd;
	wire ack_error;

	// Bidirs
	wire sda;
	wire scl;

	// Instantiate the Unit Under Test (UUT)
	i2c_master uut (
		.clk(clk), 
		.reset_n(reset_n), 
		.ena(ena), 
		.addr(addr), 
		.rw(rw), 
		.data_wr(data_wr), 
		.busy(busy), 
		.data_rd(data_rd), 
		.ack_error(ack_error), 
		.sda(sda), 
		.scl(scl)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset_n = 0;
		ena = 0;
		addr = 0;
		rw = 0;
		data_wr = 0;

		// Wait 100 ns for global reset to finish
		#100;
      #20 reset_n = 0;
		#20 reset_n = 1; 
		#20 ena = 1; data_wr= 7'b11100101;
		#20 rw = 0;  addr=7'b1001011;
		// Add stimulus here

	end
	initial  
		forever 
			#10 clk=~clk; 
      
endmodule

