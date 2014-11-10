`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:32:03 11/08/2014 
// Design Name: 
// Module Name:    dual_port_ram 
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
module dual_port_ram
#(
					parameter ADDR_WIDTH = 22, 
								 DATA_WIDTH = 2
    )
	 (
		input wire clk,
		input wire we,
		input wire [ADDR_WIDTH-1:0] addr_a, addr_b,  // addr_a (write) y addr_b (read) son de 12 bits (2^7*2^5) 
		input wire [DATA_WIDTH-1:0] din_a, // din es el dato de entrada de 7 bits, es uno de los 128 caracteres
		output wire [DATA_WIDTH-1:0] dout_a, dout_b // dato de salida 7 bits, uno de los 128 caracteres, a es escritura, y b lectura
   );
	
	   // signal declaration
   reg [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0];
   reg [ADDR_WIDTH-1:0] addr_a_reg, addr_b_reg;
	
	   always @(posedge clk)
   begin
      if (we)  // si operacion es escritura
        ram[addr_a] <= din_a; // el dato de entrada se asigna a la ram en la direccion del dato de escritura
      addr_a_reg <= addr_a;  // se asigna la direcc del dato de escritura al registro de la ram que contiene la direcc de esta
      addr_b_reg <= addr_b;	// se asigna la direcc del dato de lectura al registro de la ram que contiene la direcc de esta
   end
   // two read operations
   assign dout_a = ram[addr_a_reg]; //se asigna al dato de salida de escritura lo que contiene la ram en la direccion del registro correspondiente
   assign dout_b = ram[addr_b_reg];  //se asigna al dato de salida de lectura lo que contiene la ram en la direccion del registro correspondiente


endmodule
