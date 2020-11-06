`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:14:21 11/06/2020 
// Design Name: 
// Module Name:    uart 
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
module uart(
    input [8:0] txd_data,
    input txd_start,
    input clk,
    output reg txd,
    output reg busy
    );
	 
reg start;
reg [2:0] counter;

always @(posedge clk) begin
	busy <= 0;

	if(txd_start == 1) begin
		start <= 1;
		counter <= 0;
	end
	
	if(start == 1 && counter < 8) begin
		txd <= txd_data[counter];
		counter <= counter +1;
		busy <= 1;
	end
	
	
	if(counter == 7 ) start <= 0;
	
end

endmodule
