// audiogen.v - stereo audio data generator for I2S testing
// E. Brombaugh - 08-26-2008

module audiogen(clk, reset, ena, f_up, f_dn, gate, l_data, r_data);
	input clk;								// system clock
	input reset;							// POR
	input ena;								// Sample rate enable
	input f_up, f_dn;						// freq_ctl
	input gate;								// amp_ctl
	output signed [23:0] l_data, r_data;	// stereo audio data output
	
	parameter FREQ = 103079215;			// for 1kHz @ 41.7kHz
	
	// Freq reg
	reg [31:0] freq;
	always @(posedge clk)
		if(reset)
			freq <= FREQ;
		else if(ena)
		begin
			if(f_up)
				freq <= freq+(FREQ>>16);
			else if(f_dn)
				freq <= freq-(FREQ>>16);
		end
			
	// NCO
	reg [31:0] phase;
	always @(posedge clk)
		if(reset)
			phase <= 32'd0;
		else if(ena)
			phase <= phase + freq;
	
	// Sinewave lookup
	wire signed [13:0] sin;
	sine
		usine(.clk(clk), .phs(phase[31:20]), .sin(sin));
	
	// Outputs
	reg signed [23:0] l_data, r_data;
	always @(posedge clk)
		if(ena)
		begin
			l_data <= {24{gate}} & phase[31:8];	// ascending ramp
			r_data <= {24{gate}} & {sin,10'd0};	// sinewave
		end
endmodule
