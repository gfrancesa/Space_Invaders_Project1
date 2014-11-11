`timescale 1ns / 1ps

module Contador(CLK,EN,Rst,Out);
	input CLK,EN,Rst;
	output reg [1:0]Out;
	
	always @ (posedge CLK)
			if (Rst)
				Out=4'd0;
			else if(EN) 
				Out=Out+1'b1;
			else
			   Out=Out;


endmodule
