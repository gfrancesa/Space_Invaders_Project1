`timescale 1ns / 1ps

 module top(
    input wire clk, reset,
    input wire [1:0] btn1,
    input wire [1:0] btn2,
	 inout wire ps2d, ps2c,
	 
    output wire[7:0] led,
    output wire hsync, vsync, M,
    output wire [7:0] rgb
);

    wire [10:0] x, y;
    vga_sync vga0(.clk(clk),
        .hsync(hsync), .vsync(vsync),
        .x(x), .y(y));

    wire reset_out;
    wire [1:0] btn1_out, btn2_out;
	 wire EN;
	 //wire M;
	 //wire mueva,Sm,Rs,M1,M2,Moverclock;
	 wire [2:0]btnm;
	wire [10:0]	posxE1;
	//wire [1:0] botones1;
	//wire [1:0] botones2;
    debounce b0(clk, btn1[0], btn1_out[0]);
    debounce b1(clk, btn1[1], btn1_out[1]); 
    debounce b2(clk, btn2[0], btn2_out[0]);
    debounce b3(clk, btn2[1], btn2_out[1]);
    debounce b4(clk, reset, reset_out);
	//assign botones1 = {btn1_out[0]|btnm[0], btn1_out[1]}; 
	//assign botones2 = {btn2_out[0]|btnm[1], btn2_out[1]}; 
    graphic g0(.clk(clk), .reset(reset_out),
        .x(x), .y(y), .ENEMIGOS_FILA_1_X(posxE1), .rgb(rgb),
        .btn1(btnm[1:0]| btn1_out), .btn2(btnm[2:1] | btn2_out));
		  //sirve btnm[1:0]), .btn2(btnm[2:1]));
		  //{ btn1_out[0]|btnm[0], btn1_out[1]}), .btn2({ btn2_out[0]|btnm[1], btn2_out[1]}));
		  //10'd128
		  
	 
	//Cmilis rapides(clk,reset_out,EN,M);
	//FSM_Puntos puntos(clk,reset,Moverclock,mueva);  //(clk,reset,btn1_out[1],mueva);
	
//	Cmilis posx1(clk,reset,Sm,Rs,posxE1);
//	
//	
//	
//	Cvelocidadcambio velocidadmover1(clk,reset,EN,Moverclock);
//	
//	Machine mueve(clk,reset_out,Moverclock,M1,M2,Sm,Rs);
//	
//	ContMovidas(clk,  reset ,Sm|Rs, M1,M2);
//	

MovenLogic movimiento(clk,reset,EN,posxE1);
	
	mouse_led mouse(.clk(clk), .reset(reset_out),.ps2d(ps2d), .ps2c(ps2c),.led(led),.btnm(btnm));
	
assign EN =(y==11'd400);
endmodule
