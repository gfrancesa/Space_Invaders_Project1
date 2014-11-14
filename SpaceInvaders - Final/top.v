`timescale 1ns / 1ps

 module top(
    input wire clk, reset,
    input wire [1:0] btn1,
    input wire [1:0] btn2,
	 inout wire ps2d, ps2c,
    output wire[7:0] led,
	 output [3:0] JA,
	 output wire [7:0] seg,
	 output wire [3:0]an,
    inout wire  sda,scl,
	 //output wire [1:0] soundOut,
    output wire hsync, vsync,
    output wire [7:0] rgb
);
    wire [10:0] x, y;
	 wire [1:0] soundOut;
	 wire [2:0]btnm;
	 wire undisparo,unomuerto;
    vga_sync vga0(.clk(clk),
        .hsync(hsync), .vsync(vsync),
        .x(x), .y(y));

    wire reset_out,Senal_sing,syn_CLK;
    wire [1:0] btn1_out, btn2_out;
	 wire [7:0]TemperaturaMSB,ColoresTemperatura;
    debounce b0(clk, btn1[0], btn1_out[0]);
    debounce b1(clk, btn1[1], btn1_out[1]);
    debounce b2(clk, btn2[0], btn2_out[0]);
    debounce b3(clk, btn2[1], btn2_out[1]);
    debounce b4(clk, reset, reset_out);

//-------------Logica del juego VGA---------------------------------------------------------------------------------
    graphic g0(.clk(clk), .reset(reset_out|syn_CLK), .COLOR_TEMPERATURE(ColoresTemperatura),
        .x(x), .y(y), .rgb(rgb),
        .btn1(btnm[1:0]| btn1_out), .btn2(btnm[2:1] | btn2_out),  .soundOut(soundOut));
		  
//--------------------------Modulo de control utilizando el mouse--------------------------------------------
	 mouse_led mouse(.clk(clk), .reset(reset),.ps2d(ps2d), .ps2c(ps2c),.led(led),.btnm(btnm));
	 
	 
//--------------Logico de generacion de Sonidos y Comunicacion I2S-------------------------------------------------------
	 i2s_tst_top sonido(clk, {reset_out,unomuerto,btnm[2],btnm[0]|btnm[1]},  JA);
	 
//------------------Logica del Sensor de Temperatura------------------------------------------------------------------------- 
	 TopClock sensorTemperatura(
    .clk(clk),.reset_n(~reset_out),.rw(1'b1),
	 .MSB(TemperaturaMSB),
    .sda(sda),.scl(scl)
    );

//-----------------Decodificacion de los datos de la temperatura---------------------------------------------------------
	 DecoTemp_Colores(TemperaturaMSB[3:0],ColoresTemperatura);
	 //btn[0]-->disparo btn[1]-->movio btn[2]--->destruyo
	 
//-------------------Puntajes------------------------------------------------------------------------------------------
	Display(clk,reset_out,unomuerto | undisparo,seg,an);
	FSM_Puntos resiviodisparo(clk,reset_out,soundOut[1],undisparo);
	FSM_Puntos murioenemigo(clk,reset_out,soundOut[0],unomuerto);
	
	
	
	Inicio_FSM Inicio(reset_out,btn1_out[1]|btnm[1]|btnm[0],1'b0,Senal_sing);
	 
	MUX_CLK paraInicio(1'b0,1'b1,Senal_sing,syn_CLK); 
endmodule
