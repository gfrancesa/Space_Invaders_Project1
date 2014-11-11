`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:55:23 11/01/2014 
// Design Name: 
// Module Name:    TopClock 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TopClock(
    input wire clk,reset_n,
    input wire rw,
    output wire [7:0] seg,
	 output wire [3:0]an,
    inout wire  sda,scl
    );
	 wire enaI2c,unena;
	 wire busy;
	 wire [7:0] MSB,LSB;
	 wire [7:0]data_rd;
	 
	 reg clk2;
	always @(posedge clk)

		clk2 <= ~clk2;
		
FSM_Logic inteligencia(clk2,~reset_n,data_rd,unena,busy,enaI2c,MSB,LSB);

ContaActualiza(clk2,~reset_n,unena);

//FSM_Puntos unavez(clk2,~reset_n,ena2,unena);
//SM_Puntos(        CLK,RST,data_rd,Z,     busy,P,   MSB,LSB);
i2c_master master(
    .clk(clk2),
    .reset_n(reset_n),
    .ena(enaI2c),
    .addr(7'b1001011),
    .rw(rw),
    .data_wr(),
    .busy(busy) , 
    .data_rd(data_rd) ,
    .ack_error(),
    .sda(sda) ,
    .scl(scl) );
	 
Display(clk2,~reset_n,seg,an,MSB[7:4], MSB[3:0], LSB[7:4], LSB[3:0]);
//data_rd[7:4], data_rd[3:0], data_rd[7:4], data_rd[3:0]);

endmodule
