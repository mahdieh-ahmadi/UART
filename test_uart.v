`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:24:20 11/06/2020
// Design Name:   uart
// Module Name:   E:/university/3991/fpga/homeworks/UART/test_uart.v
// Project Name:  uart
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uart
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_uart;

	// Inputs
	reg [8:0] txd_data;
	reg txd_start;
	reg clk;

	// Outputs
	wire txd;
	wire busy;

	// Instantiate the Unit Under Test (UUT)
	uart uut (
		.txd_data(txd_data), 
		.txd_start(txd_start), 
		.clk(clk), 
		.txd(txd), 
		.busy(busy)
	);

	initial begin
		// Initialize Inputs
		txd_data = 0;
		txd_start = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		txd_data = 8'b0110_0101;
		@(negedge clk) txd_start = 1;
		@(negedge clk) txd_start = 0;
		
        
		  #2200
		  txd_data = 8'b0010_0111;
			@(negedge clk) txd_start = 1;
			@(negedge clk) txd_start = 0;
		  
		// Add stimulus here

	end
      
		always #100 clk = ~clk;
		
endmodule

