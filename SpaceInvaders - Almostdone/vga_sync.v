module vga_sync
(
    input wire clk,
    output wire hsync, vsync,
    output wire [10:0] x, y
);

    reg  [10:0] cnt_x, cnt_y;
    reg  in_hs, in_vs;
    wire clk_pixel;

    // HS: in pixels
    localparam H_PW   = 10'd96;  // pulse width // retraso horizontal 
    localparam H_BP   = 10'd48;  // back porch  // borde izquierdo 
    localparam H_DISP = 10'd640; // display     // area de display 
    localparam H_FP   = 10'd16;  // front porch // borde derecho
    localparam H_S    = H_PW + H_BP + H_DISP + H_FP; // sync pulse

    // VS: in lines
    localparam V_PW   = 10'd2;  // retraso horizontal 
    localparam V_BP   = 10'd33; // borde inferior 
    localparam V_DISP = 10'd480; // area de display
    localparam V_FP   = 10'd10;  // borde superior
    localparam V_S    = V_PW + V_BP + V_DISP + V_FP;

    clk_pixel clk0(clk, clk_pixel);

    wire cnt_x_maxed = (cnt_x == H_S - 1);  // contador x maximo es cuando el contador x es igual  al pulso de sincronizacion - 1
    wire cnt_y_maxed = (cnt_y == V_S - 1);   // contador y maximo es cuando el contador x es igual  al pulso de sincronizacion - 1

    
	 //inciando ocntadores en cero
	 initial begin
        cnt_x <= 0;
        cnt_y <= 0;
    end
	// En este ciclo se hace el barrido de la pantalla, cuando se llega a tener en x el contador maximo, entonces se asigna cero 
	// al x y se empieza a barrer una nueva fila aumentando en 1 el y, cuando se llega al y maximo se pone el contador y en cero,
	// vilviendo al punto de inicio. Pero mientras se llega al x maximo , este va aumentando en 1
    always @(posedge clk_pixel) begin
        if (cnt_x_maxed) 
		  begin
            cnt_x <= 0;
            cnt_y <= cnt_y + 1'b1;
            if (cnt_y_maxed)
                cnt_y <= 0;
        end
        
		  else
            cnt_x <= cnt_x + 1'b1;
    end

    //   Comprobando si es una señal de sincronizacion
	 
    always @(posedge clk_pixel) begin
        in_hs = (cnt_x < H_PW);     // si cont_x es menor que retraso horizontal es true 
        in_vs = (cnt_y < V_PW);     // si cont_y es menor que retraso vertical es true
    end 

    // vga sync needs a low pulse
    assign hsync = ~in_hs;         
    assign vsync = ~in_vs;

    // output the current pixel
    assign x = cnt_x - (H_PW + H_BP);  // Pixel actual x esta en: el contenido del contador x menor (el retraso horiz y el borde izq)
    assign y = cnt_y - (V_PW + V_BP);  // Pixel actual y esta en: el contenido del contador y menor (el retraso vertic y el borde infer)

endmodule
