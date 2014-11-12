		`timescale 1ns / 1ps

		// show pixel(x, y) on the screen
		
		module graphic(
			 input wire  clk, reset,
			 input wire [7:0]COLOR_TEMPERATURE,
			 input wire  [10:0] x, y,
			 input wire  [1:0]  btn1, btn2,
			 output wire [7:0]  rgb,
			 output wire [1:0] soundOut
		);

			 // ---------------------------------------------DEFINICION COLORES----------------------------------------------
			 localparam COLOR_BACK_GROUND = 8'b01001000;  
			 //localparam COLOR_TEMPERATURE = 8'b11100000;			 
			 localparam COLOR_WOUNDED = 8'b00111100;			 		 		 
			 localparam COLOR_NULL = 8'b00000000;
			 //amarillo 00101111
			 //Rojo 10010111  b01001000
			 // verde herido b00111100;
			 //morada azul  b11000011
			 //rojo 01010101
			 //naranja b01010111
			 
			 //
			
			reg [10:0] rom_addr;    // Permite identificar cual fila en la ROM
			wire [31:0] font_word;  // Contenido de la fila en el ROM
			
			
			// ------------------------------- DEFINICIONES ENEMIGOS -------------------------------------------------
			// existiran 3 filas de 11 invasores cada una (cada bit en la cadena representa 1 invasor),
			//1 significa que esta vivo, 0 significa que el enemigo ha sido destruido. si el bit del enemigo esta en 1,
			//quiere decir que esta vivo y puede que ya haya recibido un disparo 
			
			reg [10:0] ENEMIGOS_FILA_1 = 11'b11111111111;
			reg [10:0] ENEMIGOS_FILA_2 = 11'b11111111111;
			reg [10:0] ENEMIGOS_FILA_3 = 11'b11111111111;
			
			// cada enemigo soportara 2 disparos, si el bit de un enemigo esta en 1, significa que este no ha recibido ningun 
			// disparo, si esta en cero ya recibio un disparo
			
			reg [10:0] ENEMIGOS_FILA_1_DISPAROS = 11'b11111111111;
			reg [10:0] ENEMIGOS_FILA_2_DISPAROS = 11'b11111111111;
			reg [10:0] ENEMIGOS_FILA_3_DISPAROS = 11'b11111111111;
			
			// ----------------------------------POSICION DE LAS FILAS DE INVASORES--------------------------------------------
			reg [10:0] ENEMIGOS_FILA_1_X   = 11'd128;
			reg [10:0] ENEMIGOS_FILA_1_Y   = 11'd64;
			reg [10:0] ENEMIGOS_FILA_2_X   = 11'd128;
			reg [10:0] ENEMIGOS_FILA_2_Y   = 11'd96;
			reg [10:0] ENEMIGOS_FILA_3_X   = 11'd128;
			reg [10:0] ENEMIGOS_FILA_3_Y   = 11'd128;
			reg [10:0] LARGO_FILA   = 11'd350;// 11 bichos por fila, cada uno de 32 pixeles = 352
			reg [10:0] DIVISOR_FILAS   = 11'd30;
			
			
			
			// --------------------------------------- DEFINICION DE POSICIONES DE BARRERAS -----------------------------------
			
			reg [10:0] BARRERA_1_X   = 11'd64;
			reg [10:0] BARRERA_1_Y   = 11'd320;
			reg [10:0] BARRERA_2_X   = 11'd256;
			reg [10:0] BARRERA_2_Y   = 11'd320;
			reg [10:0] BARRERA_3_X   = 11'd448;
			reg [10:0] BARRERA_3_Y   = 11'd320;
			
			// ---------------------------------------DEFINICION DE ESTADO DE LA BARRERA------------------------------------
			// Si el bit esta en 1, significa que la barrera no ha sido alcanzada por una bala (Destruida) 
			//Si el bit esta en 0, es porque una bala la ha destruido ya
			
			reg [5:0] BARRERA_FILA_1 = 6'b111111;
			reg [5:0] BARRERA_FILA_2 = 6'b111111;
			reg [5:0] BARRERA_FILA_3 = 6'b111111;
			
			// --------------------------------------------- DEFINICIONES POSICION DE JUGADOR -----------------------------------
			
			reg [10:0] JUGADOR_X   = 11'd320;
			reg [10:0] JUGADOR_Y   = 11'd416;
			
			// --------------------------------- DEFINICIONES VELOCIDAD MOVIMIENTO NAVE DEL JUGADOR ---------------------------
			localparam JUGADOR_V = 11'd1;
			
						
			// --------------------------------- ANCHO Y LARGO MINIMO DE TODO ELEMENTO DEL GUI ---------------------------

			localparam ANCHO_ELEMENTOS_UI = 11'd32;
			
			// ----------------------------------------------- LARGO DE LAS BARRERAS ------------------------------------------
			localparam JUGADOR_LARGO  = 11'd96;

			
		

			 // -----------------------------------------------INICIALIZACION DE VALORES-----------------------------------------
			 
			 reg [10:0] 						
							previous_y,
							movimiento_x,// cuantos pixeles se mueve el enemigo en X en la animacion
							movimiento_y,// cuantos pixeles se mueve el enemigo en en Y en la animacion
							izquierda_derecha, // 0 es izquierda, 1 es derecha
							cambio_velocidad,					
							loose_flag;
				
				reg [10:0] bala1_x=11'd200;
				reg [10:0] bala1_y=11'd200;
				reg  bala1=1'd0;

			
			reg [7:0] rgb_now;
			reg [1:0] sound_now;
			
			 
			 // Estas son las naves de invasores, del jugador, barreras... elementos GUI que estan el el ROM
			
			Figures_ROM font_unit
			(.clk(clk), .addr(rom_addr), .data(font_word));
			 
			 initial begin
				 
				  loose_flag = 11'd0;
				  previous_y = 11'd0;
				  izquierda_derecha = 11'd0;
				  movimiento_x = 11'd1;
				  movimiento_y = 11'd1;			  
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
							end 
						

						end
				  end
					
	// ---------------------------------------------DETECCION DE COLISION -----------------------------------------
						
	// ---------------------------------------Choque con Tercera Fila de invasores-------------------------------------------
						
						// En este if se entra cuando la bala ha tocado algun elemento de la fila 3 de invasores
						// se hacen todas las comparaciones de coordenadas necesarias para averiguarlo
						if (((bala1_x >= ENEMIGOS_FILA_3_X && bala1_x <= ENEMIGOS_FILA_3_X + LARGO_FILA) || 
								(bala1_x + 11'd4 >= ENEMIGOS_FILA_3_X && bala1_x + 11'd4 <= ENEMIGOS_FILA_3_X + LARGO_FILA))&&
							 (bala1_y >= ENEMIGOS_FILA_3_Y && bala1_y <= ENEMIGOS_FILA_3_Y + DIVISOR_FILAS) &&
							 bala1_x==x && bala1_y==y && bala1 == 1'd1)
							 begin	
									
									//IF PUNTO CENTRAL EN LA FILA: 
									//En este if se entra cuando el bit del enemigo X de la tercera fila que se ha alcanzado con 
									//la bala esta vivo. Para determinar cual es el enemigo en la fila se divide esta entre 32. 
									// Este resultado se le  resta a la posicion que tiene la bala en x en ese momento. Esto da el 
									//bit del enemigo que corresponde al alcanzado por el disparo
									
									if(ENEMIGOS_FILA_3[(bala1_x-ENEMIGOS_FILA_3_X)/11'd32])
									begin
										// En este if se entra cuando al invasor alcanzado por el dispara aun NO se le ha disparado 
										//con anterioridad
										
										if(ENEMIGOS_FILA_3_DISPAROS[(bala1_x-ENEMIGOS_FILA_3_X)/11'd32])
											begin
												ENEMIGOS_FILA_3_DISPAROS[(bala1_x-ENEMIGOS_FILA_3_X)/11'd32] <= 0;
												// AQUI SUMAR PUNTO POR DISPARO
											end
										// En este else se entra cuando al invasor YA se se le habia disparado con anterioridad.
										//Por lo que este muere, entonces se pone su bit correspondiente en 0.
										else
											begin
												ENEMIGOS_FILA_3[(bala1_x-ENEMIGOS_FILA_3_X)/11'd32] <= 0;
												// SUMAR PUNTO POR MUERTE
												sound_now <= 2'd1;
											end
										bala1 <= 1'd0;
										sound_now <= 2'd0;
									end 
									
									//Este If funciona igual al anterior, pero es CUANDO LA BALA TOCA LOS  EXTREMOS DE LA FILA
									//Por lo que es necesario sumar el tamaño que tiene la bala
									if(ENEMIGOS_FILA_3[((bala1_x+11'd4)-ENEMIGOS_FILA_3_X)/11'd32])
									begin
										if(ENEMIGOS_FILA_3_DISPAROS[((bala1_x+11'd4)-ENEMIGOS_FILA_3_X)/11'd32])
											begin
												ENEMIGOS_FILA_3_DISPAROS[((bala1_x+11'd4)-ENEMIGOS_FILA_3_X)/11'd32] <= 0;
											end
										else
											begin
												ENEMIGOS_FILA_3[((bala1_x+11'd4)-ENEMIGOS_FILA_3_X)/11'd32] <= 0;
												sound_now <= 2'd1;
											end
										bala1 <= 1'd0;
										sound_now <= 2'd0;
									end 
									
							 end
// -----------------------------------------Choque con SEGUNDA Fila de invasores-------------------------------------------
							// En este if se entra cuando la bala ha tocado algun elemento de la fila 2 de invasores
						if (((bala1_x >= ENEMIGOS_FILA_2_X && bala1_x <= ENEMIGOS_FILA_2_X + LARGO_FILA) || 
								(bala1_x + 11'd4 >= ENEMIGOS_FILA_2_X && bala1_x + 11'd4 <= ENEMIGOS_FILA_2_X + LARGO_FILA))&&
							 (bala1_y >= ENEMIGOS_FILA_2_Y && bala1_y <= ENEMIGOS_FILA_2_Y + DIVISOR_FILAS)  &&
							 bala1_x==x && bala1_y==y && bala1 == 1'd1)
							 begin	
									
						// IF CHOQUE CON PUNTOS CENTRALES DENTRO DE FILA 2 DE INVASORES: funciona exactamente igual al de la fila 3
									if(ENEMIGOS_FILA_2[(bala1_x-ENEMIGOS_FILA_2_X)/11'd32])
									begin
										if(ENEMIGOS_FILA_2_DISPAROS[(bala1_x-ENEMIGOS_FILA_2_X)/11'd32])
											begin
												ENEMIGOS_FILA_2_DISPAROS[(bala1_x-ENEMIGOS_FILA_2_X)/11'd32] <= 0;
											end
										else
											begin
												ENEMIGOS_FILA_2[(bala1_x-ENEMIGOS_FILA_2_X)/11'd32] <= 0;
												sound_now <= 2'd1;
											end
										bala1 <= 1'd0;
										sound_now <= 2'd0;
									end 
					// IF CHOQUE CON PUNTOS EXTREMOs DENTRO DE FILA 2 DE INVASORES: funciona exactamente igual al de la fila 3
	
									if(ENEMIGOS_FILA_2[((bala1_x+11'd4)-ENEMIGOS_FILA_2_X)/11'd32])
									begin
										if(ENEMIGOS_FILA_2_DISPAROS[((bala1_x+11'd4)-ENEMIGOS_FILA_2_X)/11'd32])
											begin
												ENEMIGOS_FILA_2_DISPAROS[((bala1_x+11'd4)-ENEMIGOS_FILA_2_X)/11'd32] <= 0;
											end
										else
											begin
												ENEMIGOS_FILA_2[((bala1_x+11'd4)-ENEMIGOS_FILA_2_X)/11'd32] <= 0;
												sound_now <= 2'd1;
											end
										bala1 <= 1'd0;
										sound_now <= 2'd0;
									end 								
							 end
	// ----------------------------------------Choque con PRIMERA Fila de invasores-------------------------------------------
							// En este if se entra cuando la bala ha tocado algun elemento de la fila 1 de invasores
						if (((bala1_x >= ENEMIGOS_FILA_1_X && bala1_x <= ENEMIGOS_FILA_1_X + LARGO_FILA) || 
								(bala1_x + 11'd4 >= ENEMIGOS_FILA_1_X && bala1_x + 11'd4 <= ENEMIGOS_FILA_1_X + LARGO_FILA))&&
							 (bala1_y >= ENEMIGOS_FILA_1_Y && bala1_y <= ENEMIGOS_FILA_1_Y + DIVISOR_FILAS)  &&
							 bala1_x==x && bala1_y==y && bala1 == 1'd1)
							
							begin	
						// IF CHOQUE CON PUNTOS CENTRALES DENTRO DE FILA 1 DE INVASORES: funciona exactamente igual al de la fila 3 y 2

									if(ENEMIGOS_FILA_1[(bala1_x-ENEMIGOS_FILA_1_X)/11'd32])
									begin
										if(ENEMIGOS_FILA_1_DISPAROS[(bala1_x-ENEMIGOS_FILA_1_X)/11'd32])
											begin
												ENEMIGOS_FILA_1_DISPAROS[(bala1_x-ENEMIGOS_FILA_1_X)/11'd32] <= 0;
											end
										else
											begin
												ENEMIGOS_FILA_1[(bala1_x-ENEMIGOS_FILA_1_X)/11'd32] <= 0;
												sound_now <= 2'd1;
											end
										bala1 <= 1'd0;
										sound_now <= 2'd0;
									end 
						// IF CHOQUE CON PUNTOS EXTREMOs DENTRO DE FILA 1 DE INVASORES: funciona exactamente igual al de la fila 3 y 2

									if(ENEMIGOS_FILA_1[((bala1_x+11'd4)-ENEMIGOS_FILA_1_X)/11'd32])
									begin
										if(ENEMIGOS_FILA_1_DISPAROS[((bala1_x+11'd4)-ENEMIGOS_FILA_1_X)/11'd32])
											begin
												ENEMIGOS_FILA_1_DISPAROS[((bala1_x+11'd4)-ENEMIGOS_FILA_1_X)/11'd32] <= 0;
											end
										else
											begin
												ENEMIGOS_FILA_1[((bala1_x+11'd4)-ENEMIGOS_FILA_1_X)/11'd32] <= 0;
												sound_now <= 2'd1;
											end
										bala1 <= 1'd0;
										sound_now <= 2'd0;
									end 																		
							 end

	// ------------------------------------------------Choque con TERCERA BARRERA-------------------------------------------
						// En este if se entra si una bala ha colisionado con la tercera barrera
							 if (((bala1_x >= BARRERA_3_X && bala1_x <= BARRERA_3_X + JUGADOR_LARGO -11'd4) || 
									(bala1_x + 11'd4 >= BARRERA_3_X && bala1_x + 11'd4 <= BARRERA_3_X + JUGADOR_LARGO-11'd4))&&
									(bala1_y >= BARRERA_3_Y && bala1_y <= BARRERA_3_Y + (ANCHO_ELEMENTOS_UI * 2)-11'd4)  &&
									bala1_x==x && bala1_y==y && bala1 == 1'd1)
							 begin	
										if(BARRERA_FILA_3[(((bala1_y-BARRERA_3_Y)/11'd32)*3)+((bala1_x-BARRERA_3_X)/11'd32)])
												begin
													BARRERA_FILA_3[(((bala1_y-BARRERA_3_Y)/11'd32)*3)+((bala1_x-BARRERA_3_X)/11'd32)] <= 0;
													bala1 <= 1'd0;
												end
							 end
// ------------------------------------------------------Choque con SEGUNDA BARRERA-------------------------------------------
						// En este if se entra si una bala ha colisionado con la segunda barrera
							 if (((bala1_x >= BARRERA_2_X && bala1_x <= BARRERA_2_X + JUGADOR_LARGO-11'd4) || 
									(bala1_x + 11'd4 >= BARRERA_2_X && bala1_x + 11'd4 <= BARRERA_2_X + JUGADOR_LARGO-11'd4))&&
									(bala1_y >= BARRERA_2_Y && bala1_y <= BARRERA_2_Y + (ANCHO_ELEMENTOS_UI * 2)-11'd4)  &&
									bala1_x==x && bala1_y==y && bala1 == 1'd1)
							 begin	
										if(BARRERA_FILA_2[(((bala1_y-BARRERA_2_Y)/11'd32)*3)+((bala1_x-BARRERA_2_X)/11'd32)])
												begin
													BARRERA_FILA_2[(((bala1_y-BARRERA_2_Y)/11'd32)*3)+((bala1_x-BARRERA_2_X)/11'd32)] <= 0;
													bala1 <= 1'd0;
												end
							 end
							 
	// ---------------------------------------------Choque con PRIMERA BARRERA-------------------------------------------
						// En este if se entra si una bala ha colisionado con la primera barrera
							 if (((bala1_x >= BARRERA_1_X && bala1_x <= BARRERA_1_X + JUGADOR_LARGO-11'd4) || 
									(bala1_x + 11'd4 >= BARRERA_1_X && bala1_x + 11'd4 <= BARRERA_1_X + JUGADOR_LARGO-11'd4))&&
									(bala1_y >= BARRERA_1_Y && bala1_y <= BARRERA_1_Y + (ANCHO_ELEMENTOS_UI * 2)-11'd4)  &&
									bala1_x==x && bala1_y==y && bala1 == 1'd1)
							 begin	
										if(BARRERA_FILA_1[(((bala1_y-BARRERA_1_Y)/11'd32)*3)+((bala1_x-BARRERA_1_X)/11'd32)])
												begin
													BARRERA_FILA_1[(((bala1_y-BARRERA_1_Y)/11'd32)*3)+((bala1_x-BARRERA_1_X)/11'd32)] <= 0;
													bala1 <= 1'd0;
												end
							 end
			
			
//----------------------------------------------NUEVO REFRESCAMIENTO DE LA PANTALLA---------------------------------
			 
					// En este if se entra cada vez que el modulo de sincronozacion se va a refrescar, es por esto que aqui es 
					// cuando se aprovecha para "animar el movimiento de la aplicacion, pintando los elementos en distintas posiciones"
				  
		  if (x >= 0 && y >= 0 && x < 640 && y < 480) begin
						if(previous_y > y)
						begin
							 
								// Si la bala esta activa 
								if(bala1 == 1'd1)
								begin
									// y su posicion en el eje y es menor que 4 (lo que la bala mide)
									if(bala1_y < 11'd4)
									begin
										// Se asigna su coordenada en y = 0 para que no haya desborde
										bala1_y <= 0;
									end
									// Si su posicion no es menor a 4 en el eje y, se va restando 4 para que se vaya moviendo hacia arriba
									else
									begin
										bala1_y <= bala1_y - 11'd4; // cuando hay mas de 4 pixeles
									end
								end
								// Si la posicion de la bala esta en 0 en el eje y (ya llego arriba) y ademas sigue activa,
								// La ponemos en 0 para que se desactive y que se permita realizar un nuevo disparo.
								if(bala1_y == 0 && bala1 == 1'd1)
									bala1 <= 1'd0;
									
																							
	//--------------------------------------------------ANIMACION DEL MOVIMIENTO DE LOS INVASORES------------------------------
								
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

						rgb_now <= COLOR_BACK_GROUND;
						
						
	//---------------------------------------------- PINTANDO LAS BARRERAS ---------------------------------------------------					


						// BARRERA 1
						//Si la coordenada x y y de sincronozacion estan procesandose donde se pinta la barrera 1
						if ((x >= BARRERA_1_X && x <= BARRERA_1_X + JUGADOR_LARGO-11'd4) &&
							 (y >= BARRERA_1_Y && y <= BARRERA_1_Y + (ANCHO_ELEMENTOS_UI * 2) -11'd4))
							 begin
									//Si los bits de la barrera 1 aun estan en 1 es porque no han recibido disparos y deben pintarse;
									if(BARRERA_FILA_1[(((y-BARRERA_1_Y)/11'd32)*3)+((x-BARRERA_1_X)/11'd32)])
										rgb_now <= COLOR_TEMPERATURE;
							 end

						// BARRERA 2
						//Si la coordenada x y y de sincronozacion estan procesandose donde se pinta la barrera 2
						
						if ((x >= BARRERA_2_X && x <= BARRERA_2_X + JUGADOR_LARGO-11'd4) &&
							 (y >= BARRERA_2_Y && y <= BARRERA_2_Y + (ANCHO_ELEMENTOS_UI * 2) -11'd4))
							 begin
									//Si los bits de la barrera 2 aun estan en 1 es porque no han recibido disparos y deben pintarse;
									if(BARRERA_FILA_2[(((y-BARRERA_2_Y)/11'd32)*3)+((x-BARRERA_2_X)/11'd32)])
										rgb_now <= COLOR_TEMPERATURE;
							 end
							 
							 
						// BARRERA 3
						//Si la coordenada x y y de sincronozacion estan procesandose donde se pinta la barrera 3

						if ((x >= BARRERA_3_X && x <= BARRERA_3_X + JUGADOR_LARGO-11'd4) &&
							 (y >= BARRERA_3_Y && y <= BARRERA_3_Y + (ANCHO_ELEMENTOS_UI * 2)-11'd4))
							 begin
									//Si los bits de la barrera 3 aun estan en 1 es porque no han recibido disparos y deben pintarse;
									if(BARRERA_FILA_3[(((y-BARRERA_3_Y)/11'd32)*3)+((x-BARRERA_3_X)/11'd32)])
										rgb_now <= COLOR_TEMPERATURE;
							 end

			
			
// ----------------------------------------PINTANDO INVASORES DE FILA 1---------------------------------------------------------
						
						//Si la coordenada x y y de sincronozacion estan procesandose donde se pinta la fila 1 de enemigos

						if ((x >= ENEMIGOS_FILA_1_X && x <= ENEMIGOS_FILA_1_X + LARGO_FILA) &&
							 (y >= ENEMIGOS_FILA_1_Y && y <= ENEMIGOS_FILA_1_Y + DIVISOR_FILAS))
							 begin
									rgb_now <= COLOR_TEMPERATURE;
									// En este if se entra  cuando a un invasor ya se le ha disparado con anterioridad, 
									// entonces cambia de color para mostrar que esta herido
									if(ENEMIGOS_FILA_1_DISPAROS[(x-ENEMIGOS_FILA_3_X)/11'd32] == 0)
									begin
										rgb_now <= COLOR_WOUNDED;
									end 	
									rom_addr <= (y-ENEMIGOS_FILA_1_Y)%ANCHO_ELEMENTOS_UI;
									// En este if se entra para pintar bits en 0 en la ROM, (ojos, espacios blanco, curvas, etc)
									if (font_word[((x-ENEMIGOS_FILA_1_X)%ANCHO_ELEMENTOS_UI)] == 0)
											begin
												rgb_now <= COLOR_BACK_GROUND;
											end
								// En este if se entra  cuando un invasor a muerto, entonces NO se pinta

									if(ENEMIGOS_FILA_1[(x-ENEMIGOS_FILA_1_X)/11'd32] == 0)
									begin
										rgb_now <= COLOR_BACK_GROUND;
									end 
									
									
							 end
// ------------------------------------PINTANDO INVASORES DE FILA 2---------------------------------------------------------
						if ((x >= ENEMIGOS_FILA_2_X && x <= ENEMIGOS_FILA_2_X + LARGO_FILA) &&
							 (y >= ENEMIGOS_FILA_2_Y && y <= ENEMIGOS_FILA_2_Y + DIVISOR_FILAS))
							 begin
									rgb_now <= COLOR_TEMPERATURE;
									// En este if se entra  cuando a un invasor ya se le ha disparado con anterioridad, 
									// entonces cambia de color para mostrar que esta herido
									if(ENEMIGOS_FILA_2_DISPAROS[(x-ENEMIGOS_FILA_3_X)/11'd32] == 0)
									begin
										rgb_now <= COLOR_WOUNDED;
									end 

									rom_addr <= ((y-ENEMIGOS_FILA_2_Y)%ANCHO_ELEMENTOS_UI)+ANCHO_ELEMENTOS_UI;
									// En este if se entra para pintar bits en 0 en la ROM, (ojos, espacios blanco, curvas, etc)
									if (font_word[((x-ENEMIGOS_FILA_2_X)%ANCHO_ELEMENTOS_UI)] == 0)
											begin
												rgb_now <= COLOR_BACK_GROUND;
											end
								
									// En este if se entra  cuando un invasor a muerto, entonces NO se pinta
									if(ENEMIGOS_FILA_2[(x-ENEMIGOS_FILA_2_X)/11'd32] == 0)
									begin
										rgb_now <= COLOR_BACK_GROUND;
									end 
							 end
							 
// ------------------------------------PINTANDO INVASORES DE FILA 3---------------------------------------------------------
						if ((x >= ENEMIGOS_FILA_3_X && x <= ENEMIGOS_FILA_3_X + LARGO_FILA) &&
							 (y >= ENEMIGOS_FILA_3_Y && y <= ENEMIGOS_FILA_3_Y + DIVISOR_FILAS))
							 begin
									rgb_now <= COLOR_TEMPERATURE;
									// En este if se entra  cuando a un invasor ya se le ha disparado con anterioridad, 
									// entonces cambia de color para mostrar que esta herido
									if(ENEMIGOS_FILA_3_DISPAROS[(x-ENEMIGOS_FILA_3_X)/11'd32] == 0)
									begin
										rgb_now <= COLOR_WOUNDED;
									end 
										
									rom_addr <= ((y-ENEMIGOS_FILA_2_Y)%ANCHO_ELEMENTOS_UI)+(ANCHO_ELEMENTOS_UI*2);
									// En este if se entra para pintar bits en 0 en la ROM, (ojos, espacios blanco, curvas, etc)
									if (font_word[((x-ENEMIGOS_FILA_2_X)%ANCHO_ELEMENTOS_UI)]  == 0)
											begin
												rgb_now <= COLOR_BACK_GROUND; 
											end
									
																	
  									// En este if se entra  cuando un invasor a muerto, entonces NO se pinta

									if(ENEMIGOS_FILA_3[(x-ENEMIGOS_FILA_3_X)/11'd32] == 0)
									begin
										rgb_now <= COLOR_BACK_GROUND;
									end 
									
							 end


	// -----------------------------------------------PINTANDO NAVE DEL JUGADOR---------------------------------------------------
						
						if ((x >= JUGADOR_X && x <= JUGADOR_X + ANCHO_ELEMENTOS_UI) &&
							 (y >= JUGADOR_Y && y <= JUGADOR_Y + ANCHO_ELEMENTOS_UI))
							 begin
									rgb_now <= COLOR_TEMPERATURE;
									rom_addr <= (y-JUGADOR_Y)+(ANCHO_ELEMENTOS_UI*3);
								// En este if se entra para pintar bits en 0 en la ROM, (ojos, espacios blanco, curvas, etc)
									if (font_word[(x-JUGADOR_X)]  == 0)
											begin
												rgb_now <= COLOR_BACK_GROUND;
											end
							 end
						
	//------------------------------------------PINTANDO LA BALA----------------------------------------------------					
						if((bala1==1)&& (bala1_x<=x && x <= bala1_x+11'd4) && (bala1_y<=y && y <= bala1_y+11'd4))
						begin
							rgb_now <= COLOR_TEMPERATURE;
						end
						
				  end else begin
// ----------------------------------FUERA DEL AREA DEL DISPLAY, SE PINTA NULO --------------------------------------------------------
						rgb_now <= COLOR_NULL;
				  end			  
			 end
			 
			 assign rgb = rgb_now;
			 assign soundOut = sound_now;
		endmodule
