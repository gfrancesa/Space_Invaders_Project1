// i2s_tst.v - Test I2S interface
// E. Brombaugh 08-26-2008

module i2s_tst(clk, reset, btn, led, mclk, sclk, lrck, sdout);
	input clk;			// 16MHz system clock
	input reset;		// POR
	input [2:0] btn;	// User capsense buttons
	output [3:0] led;	// User LEDs
	output mclk;		// Master clock
	output sclk;		// Serial clock
	output lrck;		// Left/Right word clock
	output sdout;		// Audio data
	
	// Sample rate
	wire ena;
	
	// Audio Data Source
	wire signed [23:0] l_data, r_data;
	audiogen
		uag(.clk(clk), .reset(reset), .ena(ena),
			.f_up(btn[0]), .f_dn(btn[1]), .gate(btn[2]),
			.l_data(l_data), .r_data(r_data));
	
	// I2S serializer
	i2s_out
		ui2s(.clk(clk), .reset(reset),
			.l_data(l_data), .r_data(r_data),
			.sdout(sdout), .sclk(sclk), .lrclk(lrck),
			.load(ena));
	
	// Master I2S clock is just system clock
	assign mclk = clk;
	
	// Pass-thru buttons to LEDs
	assign led = {reset,btn};
endmodule
