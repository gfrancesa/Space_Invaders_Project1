	`timescale 1ns / 1ps

	// show pixel(x, y) on the screen
	module graphic(
		 input wire  clk, reset,
		 input wire  [10:0] x, y,
		 input wire  [1:0]  btn1, btn2,
		 output wire [7:0]  rgb
	);

		 // ---------------------------------------------DEFINICION COLORES
		 localparam COLOR_BG   = 8'b01001000;  
		 localparam COLOR_BALL = 8'b11011101;
		 localparam COLOR_LINE = 8'b11100001;
		 localparam COLOR_LBAR = 8'b10010111;
		 localparam COLOR_RBAR = 8'b00101011;
		 
		 localparam COLOR_LBAR2 = 8'b11010111;
		 localparam COLOR_RBAR2 = 8'b01101011;
		 
		 localparam COLOR_LBAR3 = 8'b10011111;
		 localparam COLOR_RBAR3 = 8'b00101111;
		 
		 localparam COLOR_NULL = 8'b00000000;
		reg [10:0] rom_addr;
		wire [31:0] font_word; 
		
		
		// ------------------------------- DEFINICIONES ENEMIGOS -------------------------------------------------
		// existiran 3 filas de 3 enemigos cada una, 1 significa que esta, 0 significa que el enemigo ha sido destruido.
		// si el bit del enemigo esta en 1, quiere decir que esta vivo y puede haber recibido un disparo 
		reg [10:0] ENEMIGOS_FILA_1 = 11'b11111111111;
		reg [10:0] ENEMIGOS_FILA_2 = 11'b11111111111;
		reg [10:0] ENEMIGOS_FILA_3 = 11'b11111111111;
		// cada enemigo soportara 2 disparos, si el bit de un enemigo esta en 1, significa que este no ha recibido ningun 
		// disparo, si esta en cero ya recibio un disparo
		reg [10:0] ENEMIGOS_FILA_1_DISPAROS = 11'b11111111111;
		reg [10:0] ENEMIGOS_FILA_2_DISPAROS = 11'b11111111111;
		reg [10:0] ENEMIGOS_FILA_3_DISPAROS = 11'b11111111111;
		// posicion de las filas de enemigos
		reg [10:0] ENEMIGOS_FILA_1_X   = 11'd128;
		reg [10:0] ENEMIGOS_FILA_1_Y   = 11'd64;
		reg [10:0] ENEMIGOS_FILA_2_X   = 11'd128;
		reg [10:0] ENEMIGOS_FILA_2_Y   = 11'd96;
		reg [10:0] ENEMIGOS_FILA_3_X   = 11'd128;
		reg [10:0] ENEMIGOS_FILA_3_Y   = 11'd128;
		reg [10:0] LARGO_FILA   = 11'd350;// 11 bichos por fila, cada uno de 32 pixeles = 352
		reg [10:0] DIVISOR_FILAS   = 11'd30;
		// ---------------------------------------------------- DEFINICIONES DE BARRERAS -----------------------------------
		
		reg [10:0] BARRERA_1_X   = 11'd64;
		reg [10:0] BARRERA_1_Y   = 11'd320;
		reg [10:0] BARRERA_2_X   = 11'd256;
		reg [10:0] BARRERA_2_Y   = 11'd320;
		reg [10:0] BARRERA_3_X   = 11'd448;
		reg [10:0] BARRERA_3_Y   = 11'd320;
		
		// ---------------------------------------------------- DEFINICIONES DE JUGADOR -----------------------------------
		
		reg [10:0] JUGADOR_X   = 11'd320;
		reg [10:0] JUGADOR_Y   = 11'd416;
		localparam JUGADOR_V = 11'd1;// velocidad de movimiento del jugador
		localparam JUGADOR_LARGO  = 11'd96;
		localparam ANCHO_ELEMENTOS_UI = 11'd32;
		
		// ---------------------------------------------------- DEFINICIONES DE BARRA DIVISORA -----------------------------------
		
		reg [10:0] BARRA_Y   = 11'd448;

		
		
		 // --------------------------------------------------TAMAÑOS--------------------------------------------------------
		
		
		reg [10:0] BAR_H   = 11'd176; 
		
		// -------------------------------------ALTURA PRIMERA BARRA SUPERIOR E INFERIOR------------------------------------
		 reg [10:0] BAR_H_FIRST_UP   = 11'd252; 
		 reg [10:0] BAR_H_FIRST_DOWN   = 11'd100; 
		 
		 // ------------------------------------ALTURA SEGUNDA BARRA SUPERIOR E INFERIOR------------------------------------
		 reg [10:0] BAR_H_SECOND_UP   = 11'd64; 
		 reg [10:0] BAR_H_SECOND_DOWN   = 11'd288; 
		 
		// -------------------------------------ALTURA TERCERA BARRA SUPERIOR E INFERIOR------------------------------------
		 reg [10:0] BAR_H_THIRD_UP   = 11'd176; 
		 reg [10:0] BAR_H_THIRD_DOWN   = 11'd176; 
		 
		 // ---------------------------------------ANCHO DE LAS BARRAS--------------------------------------------------------
		 reg [10:0] BAR_W   = 11'd64; 
		 
		 // ---------------------------------------RADIO DE LA BOLA-----------------------------------------------------------
		 localparam BALL_R  = 11'd16;   
		 
		 // -------------------------------LIMITES IZQUIERDO, DERECHO, SUPERIOR E INFERIOr------------------------------------
		 localparam L_BOUND = 11'd0;
		 localparam R_BOUND = 11'd640;
		 localparam U_BOUND = 11'd0;
		 localparam D_BOUND = 11'd480;

		 // -------------------------------------------VELOCIDADES----------------------------------------------------------
		 localparam BAR_V  = 10'd1; 
		 localparam BALL_V = 20'd1;
		 localparam BALL_V_FALL = 5'd1;

		 // -----------------------------------------------INICIALIZACION DE VALORES-----------------------------------------
		 reg [10:0] ball_x, 
						ball_y, 
						first_bar_x,
						first_bar_up, 
						first_bar_down, 
						second_bar_x,
						second_bar_up,
						second_bar_down,
						third_bar_x,
						third_bar_up,
						third_bar_down,
						lbar_y,
						rbar_y,
						previous_y,
						movimiento_x,// cuantos pixeles se mueve en X
						movimiento_y,// cuantos pixeles se mueve en Y
						izquierda_derecha, // 0 es izquierda, 1 es derecha
						cambio_velocidad,
						tmp,
						loose_rep,
						number_deads,
						loose_flag;
			
			reg [10:0] bala1_x=11'd200;
			reg [10:0] bala1_y=11'd200;
			reg  bala1=1'd0;

			reg [10:0] bala2_x=11'd200;
			reg [10:0] 	bala2_y=11'd200;
			reg  bala2=1'd0;

			reg [10:0] bala3_x=11'd200;
			reg [10:0] 	bala3_y=11'd200;
			reg 	bala3=1'd0;
		 
		 reg [19:0] pixel_printed;
		 reg ball_move_x, ball_move_y;
		 reg [5:0] lscore, rscore;
		 reg [7:0] rgb_now, rgb_dead;
		 Figures_ROM font_unit
      (.clk(clk), .addr(rom_addr), .data(font_word));
		 
		 initial begin
			  //---------------------------------posiciones de la bola--------------------------------------------------------------
			  ball_x = 11'd128;
			  ball_y = 11'd240;
			 
			  lbar_y = 11'd88;
			  rbar_y = 11'd392;
			  loose_rep = 11'd10;
			  number_deads = 11'd0;
			  loose_flag = 11'd0;
			  rgb_dead = 8'b00000000;
			 
			  //---------------------------------posiciones en y barras de arriba----------------------------------------------
			  first_bar_up = 126;
			  second_bar_up = 32;
			  third_bar_up = 88;
		
			  //---------------------------------posiciones en y barras de abajo-----------------------------------------------
			  first_bar_down = 430;
			  second_bar_down = 336; 
			  third_bar_down = 392;
			  
			  tmp = 0;
			  
			  //---------------------------------posiciones en x de las barras-------------------------------------------------
			  first_bar_x = 320;
			  second_bar_x = 640;
			  third_bar_x = 960;
			 
			  previous_y = 11'd0;
			  izquierda_derecha = 11'd0;
			  movimiento_x = 11'd1;
			  movimiento_y = 11'd1;
			  ball_move_x = 1'b1;
			  ball_move_y = 1'b1;
			  cambio_velocidad = 11'b1;
		 end

		 
		
		wire clk_frame = (x == 0 && y == 0);
		
		wire [10:0] random_up_posic;
		wire [10:0] random_down_posic;
		
	
		
		always @(posedge clk) 
		begin
			

			  if (clk_frame && loose_flag == 11'd0) 
			  begin
					// -----------------------------------LIMITAR QUE LA BOLA NO SUBA MAS QUE LA POSICION SUPERIOR 0----------------
					if (btn1[0] && JUGADOR_X > JUGADOR_V) 
								JUGADOR_X <= JUGADOR_X - JUGADOR_V;
								
					if (btn2[0] && JUGADOR_X < 608) // el jugador tiene un tamanio de 96 ... 544 + 96 = 640
							JUGADOR_X <= JUGADOR_X + JUGADOR_V;
					
					if(btn2[1])
					begin
					
						if(bala1==1'd0)
						begin
							bala1_x<=JUGADOR_X+11'd14;
							bala1_y<=JUGADOR_Y-11'd8;
							bala1<=1'd1;
						end else
						begin
						
							if(bala2==1'd0)
							begin
								bala2_x<=JUGADOR_X+11'd14;
								bala2_y<=JUGADOR_Y-11'd8;
								bala2<=1'd1;
							end else
							begin
								if(bala3==1'd0)
								begin
									bala3_x<=JUGADOR_X+11'd14;
									bala3_y<=JUGADOR_Y-11'd8;
									bala3<=1'd1;
								end
							end
						end
					end
			  end
				
			// ---------------------------------------------DETECCION DE COLISION -----------------------------------------
					
					// ------------------------Choque con Primer barra de arriba-------------------------------------------
					if (((bala1_x >= ENEMIGOS_FILA_3_X && bala1_x <= ENEMIGOS_FILA_3_X + LARGO_FILA) || 
							(bala1_x + 11'd4 >= ENEMIGOS_FILA_3_X && bala1_x + 11'd4 <= ENEMIGOS_FILA_3_X + LARGO_FILA))&&
						 (bala1_y >= ENEMIGOS_FILA_3_Y && bala1_y <= ENEMIGOS_FILA_3_Y + DIVISOR_FILAS) &&
						 bala1_x==x && bala1_y==y )
					    begin	
							
								if(ENEMIGOS_FILA_3[(bala1_x-ENEMIGOS_FILA_3_X)/11'd32])
								begin
									ENEMIGOS_FILA_3[(bala1_x-ENEMIGOS_FILA_3_X)/11'd32] <= 0;
									bala1 <= 1'd0;
								end 
								
								if(ENEMIGOS_FILA_3[((bala1_x+11'd4)-ENEMIGOS_FILA_3_X)/11'd32])
								begin
									ENEMIGOS_FILA_3[((bala1_x+11'd4)-ENEMIGOS_FILA_3_X)/11'd32] <= 0;
									bala1 <= 1'd0;
								end 
								
						 end
					if (((bala1_x >= ENEMIGOS_FILA_2_X && bala1_x <= ENEMIGOS_FILA_2_X + LARGO_FILA) || 
							(bala1_x + 11'd4 >= ENEMIGOS_FILA_2_X && bala1_x + 11'd4 <= ENEMIGOS_FILA_2_X + LARGO_FILA))&&
						 (bala1_y >= ENEMIGOS_FILA_2_Y && bala1_y <= ENEMIGOS_FILA_2_Y + DIVISOR_FILAS)  &&
						 bala1_x==x && bala1_y==y)
					    begin	
							
								if(ENEMIGOS_FILA_2[(bala1_x-ENEMIGOS_FILA_2_X)/11'd32])
								begin
									ENEMIGOS_FILA_2[(bala1_x-ENEMIGOS_FILA_2_X)/11'd32] <= 0;
									bala1 <= 1'd0;
								end 
								
								if(ENEMIGOS_FILA_2[((bala1_x+11'd4)-ENEMIGOS_FILA_2_X)/11'd32])
								begin
									ENEMIGOS_FILA_2[((bala1_x+11'd4)-ENEMIGOS_FILA_2_X)/11'd32] <= 0;
									bala1 <= 1'd0;
								end 								
						 end
					if (((bala1_x >= ENEMIGOS_FILA_1_X && bala1_x <= ENEMIGOS_FILA_1_X + LARGO_FILA) || 
							(bala1_x + 11'd4 >= ENEMIGOS_FILA_1_X && bala1_x + 11'd4 <= ENEMIGOS_FILA_1_X + LARGO_FILA))&&
						 (bala1_y >= ENEMIGOS_FILA_1_Y && bala1_y <= ENEMIGOS_FILA_1_Y + DIVISOR_FILAS)  &&
						 bala1_x==x && bala1_y==y)
					    begin	
							
								if(ENEMIGOS_FILA_1[(bala1_x-ENEMIGOS_FILA_1_X)/11'd32])
								begin
									ENEMIGOS_FILA_1[(bala1_x-ENEMIGOS_FILA_1_X)/11'd32] <= 0;
									bala1 <= 1'd0;
								end 
								
								if(ENEMIGOS_FILA_1[((bala1_x+11'd4)-ENEMIGOS_FILA_1_X)/11'd32])
								begin
									ENEMIGOS_FILA_1[((bala1_x+11'd4)-ENEMIGOS_FILA_1_X)/11'd32] <= 0;
									bala1 <= 1'd0;
								end 
								
								
						 end
//					// -------------------------Choque con Primer barra de abajo---------------------------------------------
//					if ((  first_bar_down - BAR_H_FIRST_DOWN/2 <= ball_y + BALL_R  && ball_y + BALL_R <= 480) &&
//						  ((ball_x + BALL_R <= first_bar_x  && first_bar_x - BAR_W <= ball_x + BALL_R) ||
//						  (ball_x - BALL_R <= first_bar_x  && first_bar_x - BAR_W<= ball_x - BALL_R)))
//					    begin
//								if(loose_flag == 11'd0)
//									loose_flag <= 1;
//								
//						 end
//						 
//					// ---------------------------Choque con Segunda barra de arriba------------------------------------------
//					if ((ball_y - BALL_R <=     second_bar_up *2 && 0 <= ball_y - BALL_R) &&
//						  ((ball_x + BALL_R <= second_bar_x  && second_bar_x - BAR_W  <= ball_x + BALL_R) ||
//						  (ball_x - BALL_R <= second_bar_x  && second_bar_x - BAR_W  <= ball_x - BALL_R)))
//					    begin
//							
//								if(loose_flag == 11'd0)
//									loose_flag <= 1;
//						 end
//					// Segunda barra de abajo
//					if ((  second_bar_down - BAR_H_SECOND_DOWN/2 <= ball_y + BALL_R  && ball_y + BALL_R <= 480) &&
//						  ((ball_x + BALL_R <= second_bar_x && second_bar_x  - BAR_W <= ball_x + BALL_R) ||
//						  (ball_x - BALL_R <= second_bar_x  && second_bar_x - BAR_W <= ball_x - BALL_R)))
//					    begin
//								
//								if(loose_flag == 11'd0)
//									loose_flag <= 1;
//						 end
//						 
//					// ------------------------Choque con Tercera barra de arriba----------------------------------------
//					if ((ball_y - BALL_R <=     third_bar_up *2 && 0 <= ball_y - BALL_R) &&
//						  ((ball_x + BALL_R <= third_bar_x && third_bar_x - BAR_W <= ball_x + BALL_R) ||
//						  (ball_x - BALL_R <= third_bar_x  && third_bar_x - BAR_W <= ball_x - BALL_R)))
//					    begin
//								
//								if(loose_flag == 11'd0)
//									loose_flag <= 1;
//						 end
//					//--------------------------Choque con Tercera barra de abajo-------------------------------------
//					if ((  third_bar_down - BAR_H_THIRD_DOWN/2 <= ball_y + BALL_R  && ball_y + BALL_R <= 480) &&
//						  ((ball_x + BALL_R <= third_bar_x && third_bar_x - BAR_W <= ball_x + BALL_R) ||
//						  (ball_x - BALL_R <= third_bar_x&& third_bar_x - BAR_W  <= ball_x - BALL_R)))
//					    begin
//								
//								
//								if(loose_flag == 11'd0)
//									loose_flag <= 1;
//						 end
		
		
		      //------------------------------NUEVO REFRESCAMIENTO DE LA PANTALLA---------------------------------
		 
				// En este if se entra cada vez que el modulo de sincronozacion se va a refrescar, es por esto que aqui es 
				// cuando se aprovecha para "animar el movimiento de las barras, restando 1 a la posicion que tienen en x"
			  
	  if (x >= 0 && y >= 0 && x < 640 && y < 480) begin
					if(previous_y > y)
					begin
						 
						   if(bala1 == 1'd1)
							begin
								if(bala1_y < 11'd4)
								begin
									bala1_y <= 0;
								end else
								begin
									bala1_y <= bala1_y - 11'd4;
								end
							end
							
							if(bala1_y == 0 && bala1 == 1'd1)
								bala1 <= 1'd0;
								
								
							if(bala2 == 1'd1)
							begin
								if(bala2_y < 11'd4)
								begin
									bala2_y <= 0;
								end else
								begin
									bala2_y <= bala2_y - 11'd4;
								end
							end
							
							if(bala2_y == 0 && bala2 == 1'd1)
								bala2 <= 1'd0;
								
								
								
							if(bala3 == 1'd1)
							begin
								if(bala3_y < 11'd4)
								begin
									bala3_y <= 0;
								end else
								begin
									bala3_y <= bala3_y - 11'd4;
								end
							end
							
							if(bala3_y == 0 && bala3 == 1'd1)
								bala3 <= 1'd0;
							
							
					      if(izquierda_derecha == 11'd0)// vamos a la izquierda
							begin
								if(ENEMIGOS_FILA_1_X == 11'd0)
								begin
									izquierda_derecha <= 11'd1;
									cambio_velocidad <= cambio_velocidad + 11'd1;
									if(ENEMIGOS_FILA_3_Y + 11'd32 < 11'd320)
									begin
										ENEMIGOS_FILA_3_Y <= ENEMIGOS_FILA_3_Y + movimiento_y;
										ENEMIGOS_FILA_2_Y <= ENEMIGOS_FILA_2_Y + movimiento_y;
										ENEMIGOS_FILA_1_Y <= ENEMIGOS_FILA_1_Y + movimiento_y;
									end else begin
										if(ENEMIGOS_FILA_3_Y + 11'd32 != 11'd320)
										begin
											ENEMIGOS_FILA_3_Y <= ENEMIGOS_FILA_3_Y + (11'd320 - (ENEMIGOS_FILA_3_Y + 11'd32));
											ENEMIGOS_FILA_2_Y <= ENEMIGOS_FILA_2_Y + (11'd320 - (ENEMIGOS_FILA_3_Y + 11'd32));
											ENEMIGOS_FILA_1_Y <= ENEMIGOS_FILA_1_Y + (11'd320 - (ENEMIGOS_FILA_3_Y + 11'd32));
										end
									end
									if(cambio_velocidad%11'd4 == 0)
									begin
										movimiento_y <= movimiento_y + 11'd1;
										if(movimiento_x != 11'd4)
										begin
											movimiento_x <= movimiento_x + 11'd1;
										end
									end
								end else
								begin
									if(ENEMIGOS_FILA_1_X < movimiento_x)
									begin
										ENEMIGOS_FILA_1_X <= 0;
										ENEMIGOS_FILA_2_X <= 0;
										ENEMIGOS_FILA_3_X <= 0;
									end 
									else
									begin
										ENEMIGOS_FILA_1_X <= ENEMIGOS_FILA_1_X - movimiento_x;
										ENEMIGOS_FILA_2_X <= ENEMIGOS_FILA_2_X - movimiento_x;
										ENEMIGOS_FILA_3_X <= ENEMIGOS_FILA_3_X - movimiento_x;
									end
								end 
							end else // vamos a la derecha
							begin
								if(ENEMIGOS_FILA_1_X+11'd352 == 11'd640)
								begin
									izquierda_derecha <= 11'd0;
									cambio_velocidad <= cambio_velocidad + 11'd1;
									if(ENEMIGOS_FILA_3_Y + 11'd32 < 11'd320)
									begin
										ENEMIGOS_FILA_3_Y <= ENEMIGOS_FILA_3_Y + movimiento_y;
										ENEMIGOS_FILA_2_Y <= ENEMIGOS_FILA_2_Y + movimiento_y;
										ENEMIGOS_FILA_1_Y <= ENEMIGOS_FILA_1_Y + movimiento_y;
									end
									else begin
										if(ENEMIGOS_FILA_3_Y + 11'd32 != 11'd320)
										begin
											ENEMIGOS_FILA_3_Y <= ENEMIGOS_FILA_3_Y + (11'd320 - (ENEMIGOS_FILA_3_Y + 11'd32));
											ENEMIGOS_FILA_2_Y <= ENEMIGOS_FILA_2_Y + (11'd320 - (ENEMIGOS_FILA_3_Y + 11'd32));
											ENEMIGOS_FILA_1_Y <= ENEMIGOS_FILA_1_Y + (11'd320 - (ENEMIGOS_FILA_3_Y + 11'd32));
										end
									end
									if(cambio_velocidad%11'd4 == 0)
									begin
										movimiento_y <= movimiento_y + 11'd1;
										if(movimiento_x != 11'd4)
										begin
											movimiento_x <= movimiento_x + 11'd1;
										end
									end
								end else
								begin
								
								if(11'd640 - (ENEMIGOS_FILA_1_X + 11'd352) < movimiento_x)
									begin
										ENEMIGOS_FILA_1_X <= 11'd640-11'd352;
										ENEMIGOS_FILA_2_X <= 11'd640-11'd352;
										ENEMIGOS_FILA_3_X <= 11'd640-11'd352;
									end 
									else
									begin
										ENEMIGOS_FILA_1_X <= ENEMIGOS_FILA_1_X + movimiento_x;
										ENEMIGOS_FILA_2_X <= ENEMIGOS_FILA_2_X + movimiento_x;
										ENEMIGOS_FILA_3_X <= ENEMIGOS_FILA_3_X + movimiento_x;
									end

								end
							end
							previous_y <= y;
					end 
					else previous_y <= y;	
//					
//					if(loose_flag == 11'd0)
//						rgb_now <= COLOR_BG;
//					else 
//						rgb_now <= rgb_dead;
					rgb_now <= COLOR_BG;
					
//
//					
//					//-------------------------------------- PINTANDO LAS BARRAS ---------------------------------------------------
//					
//					//PRIMERA BARRA ARRIBA
//					if (((x >= first_bar_x - BAR_W && x <= first_bar_x) || (first_bar_x < BAR_W && 0 <= x && x <= first_bar_x)) &&
//						 (y >= first_bar_up - BAR_H_FIRST_UP / 2 && y <= first_bar_up + BAR_H_FIRST_UP / 2))
//						 begin
//							if(loose_flag == 11'd0)
//								rgb_now <= COLOR_LBAR;
//							else 
//								rgb_now <= ~rgb_dead;
//						 end
//						 
//					//PRIMERA BARRA ABAJO
//					if (((x >= first_bar_x - BAR_W  && x <= first_bar_x) || (first_bar_x < BAR_W && 0 <= x && x <= first_bar_x)) &&
//						 (y >= first_bar_down - BAR_H_FIRST_DOWN / 2 && y <= first_bar_down + BAR_H_FIRST_DOWN / 2))
//						 begin
//							if(loose_flag == 11'd0)
//								rgb_now <= COLOR_RBAR;
//							else 
//								rgb_now <= ~rgb_dead;
//						 end
//					//SEGUNDA BARRA ARRIBA
//					if (((x >= second_bar_x - BAR_W && x <= second_bar_x) || (second_bar_x < BAR_W && 0 <= x && x <= second_bar_x)) &&
//						 (y >= second_bar_up - BAR_H_SECOND_UP / 2 && y <= second_bar_up + BAR_H_SECOND_UP / 2))
//						 begin
//							if(loose_flag == 11'd0)
//								rgb_now <= COLOR_LBAR2;
//							else 
//								rgb_now <= ~rgb_dead;
//						 end
//						 
//					// SEGUNDA BARRA ABAJO
//					if (((x >= second_bar_x - BAR_W  && x <= second_bar_x) || (second_bar_x < BAR_W && 0 <= x && x <= second_bar_x)) &&
//						 (y >= second_bar_down - BAR_H_SECOND_DOWN / 2 && y <= second_bar_down + BAR_H_SECOND_DOWN / 2))
//						 begin
//							if(loose_flag == 11'd0)
//								rgb_now <= COLOR_RBAR2;
//							else 
//								rgb_now <= ~rgb_dead;
//						 end
//						 
//						 
//						 
//					//TERCERA BARRA ARRIBA
//					if (((x >= third_bar_x - BAR_W && x <= third_bar_x) || (third_bar_x < BAR_W && 0 <= x && x <= third_bar_x)) &&
//						(y >= third_bar_up - BAR_H_THIRD_UP / 2 && y <= third_bar_up + BAR_H_THIRD_UP / 2))
//						 begin
//							if(loose_flag == 11'd0)
//								rgb_now <= COLOR_LBAR3;
//							else 
//								rgb_now <= ~rgb_dead;
//						 end
//						 
//					//TERCERA BARRA ABAJO
//					if (((x >= third_bar_x - BAR_W  && x <= third_bar_x) || (third_bar_x < BAR_W && 0 <= x && x <= third_bar_x)) &&
//						  (y >= third_bar_down - BAR_H_THIRD_DOWN / 2 && y <= third_bar_down + BAR_H_THIRD_DOWN / 2))
//						 begin
//							if(loose_flag == 11'd0)
//								rgb_now <= COLOR_RBAR3;
//							else 
//								rgb_now <= ~rgb_dead;
//						 end


					// BARRERA 1
					if ((x >= BARRERA_1_X && x <= BARRERA_1_X + JUGADOR_LARGO) &&
						 (y >= BARRERA_1_Y && y <= BARRERA_1_Y + (ANCHO_ELEMENTOS_UI * 2)))
						 begin
								rgb_now <= COLOR_BALL;
								
								if ((x >= BARRERA_1_X+ANCHO_ELEMENTOS_UI && x <= BARRERA_1_X+(ANCHO_ELEMENTOS_UI*2) ) &&
										(y >= BARRERA_1_Y+ANCHO_ELEMENTOS_UI && y <= BARRERA_1_Y + (ANCHO_ELEMENTOS_UI * 2)))
										begin
											rgb_now <= COLOR_BG;
										end
								
						 end

					// BARRERA 2
					if ((x >= BARRERA_2_X && x <= BARRERA_2_X + JUGADOR_LARGO) &&
						 (y >= BARRERA_2_Y && y <= BARRERA_2_Y + (ANCHO_ELEMENTOS_UI * 2)))
						 begin
								rgb_now <= COLOR_BALL;
								
								if ((x >= BARRERA_2_X+ANCHO_ELEMENTOS_UI && x <= BARRERA_2_X+(ANCHO_ELEMENTOS_UI*2) ) &&
										(y >= BARRERA_2_Y+ANCHO_ELEMENTOS_UI && y <= BARRERA_2_Y + (ANCHO_ELEMENTOS_UI * 2)))
										begin
											rgb_now <= COLOR_BG;
										end
								
						 end
						 
						 
					// BARRERA 3
					if ((x >= BARRERA_3_X && x <= BARRERA_3_X + JUGADOR_LARGO) &&
						 (y >= BARRERA_3_Y && y <= BARRERA_3_Y + (ANCHO_ELEMENTOS_UI * 2)))
						 begin
								rgb_now <= COLOR_BALL;
								
								if ((x >= BARRERA_3_X+ANCHO_ELEMENTOS_UI && x <= BARRERA_3_X+(ANCHO_ELEMENTOS_UI*2) ) &&
										(y >= BARRERA_3_Y+ANCHO_ELEMENTOS_UI && y <= BARRERA_3_Y + (ANCHO_ELEMENTOS_UI * 2)))
										begin
											rgb_now <= COLOR_BG;
										end
								
						 end

		//reg [10:0] ENEMIGOS_FILA_1_X   = 11'd128;
		//reg [10:0] ENEMIGOS_FILA_1_Y   = 11'd64;
		//reg [10:0] ENEMIGOS_FILA_2_X   = 11'd128;
		//reg [10:0] ENEMIGOS_FILA_2_Y   = 11'd96;
		//reg [10:0] ENEMIGOS_FILA_3_X   = 11'd128;
		//reg [10:0] ENEMIGOS_FILA_3_Y   = 11'd128;
		//reg [10:0] LARGO_FILA   = 11'd352;// 11 bichos por fila, cada uno de 32 pixeles = 352
		//reg [10:0] DIVISOR_FILAS   = 11'd30;
		
		// Enemigos fila1
					if ((x >= ENEMIGOS_FILA_1_X && x <= ENEMIGOS_FILA_1_X + LARGO_FILA) &&
						 (y >= ENEMIGOS_FILA_1_Y && y <= ENEMIGOS_FILA_1_Y + DIVISOR_FILAS))
						 begin
								rgb_now <= COLOR_BALL;
								
								rom_addr <= (y-ENEMIGOS_FILA_1_Y)%ANCHO_ELEMENTOS_UI;
								if (font_word[((x-ENEMIGOS_FILA_1_X)%ANCHO_ELEMENTOS_UI)] == 0)
										begin
											rgb_now <= COLOR_BG;
										end
							
								
								if(ENEMIGOS_FILA_1[(x-ENEMIGOS_FILA_1_X)/11'd32] == 0)
								begin
									rgb_now <= COLOR_BG;
								end 
								//if (((x-ENEMIGOS_FILA_1_X)%ANCHO_ELEMENTOS_UI)>DIVISOR_FILAS)
								//		begin
								//			rgb_now <= COLOR_BG;
								//		end
								
						 end
		// Enemigos fila2
					if ((x >= ENEMIGOS_FILA_2_X && x <= ENEMIGOS_FILA_2_X + LARGO_FILA) &&
						 (y >= ENEMIGOS_FILA_2_Y && y <= ENEMIGOS_FILA_2_Y + DIVISOR_FILAS))
						 begin
								rgb_now <= COLOR_BALL;
								
								rom_addr <= ((y-ENEMIGOS_FILA_2_Y)%ANCHO_ELEMENTOS_UI)+ANCHO_ELEMENTOS_UI;
								if (font_word[((x-ENEMIGOS_FILA_2_X)%ANCHO_ELEMENTOS_UI)] == 0)
										begin
											rgb_now <= COLOR_BG;
										end
								
//								if (((x-ENEMIGOS_FILA_2_X)%ANCHO_ELEMENTOS_UI)>DIVISOR_FILAS)
//										begin
//											rgb_now <= COLOR_BG;
//										end
								
								if(ENEMIGOS_FILA_2[(x-ENEMIGOS_FILA_2_X)/11'd32] == 0)
								begin
									rgb_now <= COLOR_BG;
								end 
						 end
						 
		// Enemigos fila3
					if ((x >= ENEMIGOS_FILA_3_X && x <= ENEMIGOS_FILA_3_X + LARGO_FILA) &&
						 (y >= ENEMIGOS_FILA_3_Y && y <= ENEMIGOS_FILA_3_Y + DIVISOR_FILAS))
						 begin
								rgb_now <= COLOR_BALL;
								
								rom_addr <= ((y-ENEMIGOS_FILA_2_Y)%ANCHO_ELEMENTOS_UI)+(ANCHO_ELEMENTOS_UI*2);
								if (font_word[((x-ENEMIGOS_FILA_2_X)%ANCHO_ELEMENTOS_UI)]  == 0)
										begin
											rgb_now <= COLOR_BG;
										end
								
//								if (((x-ENEMIGOS_FILA_3_X)%ANCHO_ELEMENTOS_UI)>DIVISOR_FILAS)
//										begin
//											rgb_now <= COLOR_BG;
//										end

								
								if(ENEMIGOS_FILA_3[(x-ENEMIGOS_FILA_3_X)/11'd32] == 0)
								begin
									rgb_now <= COLOR_BG;
								end 
								
						 end


					// JUGADOR
					if ((x >= JUGADOR_X && x <= JUGADOR_X + ANCHO_ELEMENTOS_UI) &&
						 (y >= JUGADOR_Y && y <= JUGADOR_Y + ANCHO_ELEMENTOS_UI))
						 begin
								rgb_now <= COLOR_BALL;
								rom_addr <= (y-JUGADOR_Y)+(ANCHO_ELEMENTOS_UI*3);
								if (font_word[(x-JUGADOR_X)]  == 0)
										begin
											rgb_now <= COLOR_BG;
										end
						 end
					
					if((bala1==1)&& (bala1_x<=x && x <= bala1_x+11'd4) && (bala1_y<=y && y <= bala1_y+11'd4))
					begin
						rgb_now <= COLOR_BALL;
					end

					if((bala2==1)&& (bala2_x<=x && x <= bala2_x+11'd4) && (bala2_y<=y && y <= bala2_y+11'd4))
					begin
						rgb_now <= COLOR_BALL;
					end
					if((bala3==1)&& (bala3_x<=x && x <= bala3_x+11'd4) && (bala3_y<=y && y <= bala3_y+11'd4))
					begin
						rgb_now <= COLOR_BALL;
					end




						 

					// score
	//            if (x >= 6 && x <= 12)
	//                if (y / 6 % 2 == 1 && lscore > y / 6 / 2)
	//                    rgb_now <= COLOR_LBAR;
	//            if (x >= 628 && x <= 634)
	//                if (y / 6 % 2 == 1 && rscore > y / 6 / 2)
	//                    rgb_now <= COLOR_RBAR;
							  


			  end else begin
					// -----------FUERA DEL AREA DEL DISPLAY, SE PINTA NULO --------------------------------------------------------
					rgb_now <= COLOR_NULL;
			  end
			  
			  
		 end
		 
		 assign rgb = rgb_now;

	endmodule
