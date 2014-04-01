`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2014 02:48:12 PM
// Design Name: 
// Module Name: spi_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module spi_sim();

    reg clk = 0;
    
    always begin // Always begins executing at time 0 and NEVER stops
        clk = 0; // Set clk to 0
        #10; // Wait for 1 time unit
        clk = 1; // Set clk to 1
        #10; // Wait 1 time unit
    end
    
    wire spi_out;
    wire spi_clk;
    wire write_done;
    reg enable = 1;
    
    spi spi_impl(.clk(clk), .data_in(8'b01010100), .write_enable(enable), .spi_out(spi_out), .spi_clk(spi_clk), .write_done(write_done));
    always @ (posedge clk) begin
        //if (write_done) enable = 0;
    end
endmodule
