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
	 output wire [7:0] MSB,
    inout wire  sda,scl
    );
	 wire enaI2c,unena;
	 wire busy;
	 wire [7:0] LSB;
	 wire [7:0]data_rd;
	 
	 reg clk2;
	always @(posedge clk)

		clk2 <= ~clk2;

	 //Particion del clock en 50000hertz
//----------FSM_Logic controla en modulo que establece comunicacion con el sensor de temperatura----------
FSM_Logic inteligencia(clk2,~reset_n,data_rd,unena,busy,enaI2c,MSB,LSB);
//----------Se actualiza el dato leido desde el sensor casa Cuarto de Segundo ----------------------------
ContaActualiza periododelectura(clk2,~reset_n,unena);
//--------------Capa de comuniacion con el sensor mediante I2C--------------------------------------------
//rw--> 1 para leer.
//address 7'b1001011 segun lo espesificado por el fabricante del sensor
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

endmodule
