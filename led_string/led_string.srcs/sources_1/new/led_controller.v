`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2014 05:03:42 PM
// Design Name: 
// Module Name: led_controller
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

// LED Controller Memory Specification
// 0x0        Primary Master Control Register
//    Bit 0: Signals to begin sending the data
// 0x1        Primary Slave Response Register
//    Bit 0: Signals data sending has finished
// 0x10 - 13B LED Data Location

module led_controller(
    input clk,
    input [7 : 0] mem_dout,
    output reg [10 : 0] mem_addr = 0,
    output reg [7 : 0] mem_din = 0,
    output reg mem_write = 0, 
    output led_clk,
    output led_data,
    output data_sending_test
    );
    
    assign data_sending_test = data_sending; 
    
    reg data_sending = 0;
    reg data_stage = 0;
    reg spi_sending = 0;
    reg [15 : 0] data_progress = 0;
    
    reg [7 : 0] spi_data = 8'h0;
    reg write_enable = 0;
    wire write_done;
    
    spi spi_controller(
                .clk(clk), 
                .data_in(spi_data),
                .spi_out(led_data),
                .spi_clk(led_clk),
                .write_enable(write_enable),
                .write_done(write_done)
                );
    
    always @ (posedge clk) begin
        if (!data_sending) begin
            if (mem_addr != 0) mem_addr = 0;
            else if (mem_dout[0] == 1) begin
                data_sending = 1;
                data_stage = 0;
                data_progress = 0;
            end
        end
        if (data_progress >= 9'h12C) begin
            if (data_stage == 0) begin
                mem_addr = 9'h1;
                mem_write = 1;
                mem_din = 8'h1;
                data_stage = 1;
            end else if (data_stage == 1) begin
                mem_write = 0;
                data_stage = 0;
                data_sending = 0;    
            end
        end
        if (data_sending && !spi_sending) begin
            if (data_stage == 0) begin
                mem_addr = 9'h10 + data_progress;
                // ...
                data_stage = 1;
            end else if (data_stage == 1) begin
                data_progress = data_progress + 1;
                spi_sending = 1;
                write_enable = 1;
                spi_data = mem_dout[7 : 0];
                // ...
                data_stage = 0;    
            end
        end
        if (data_sending && spi_sending) begin
            
            if (write_done) begin
                spi_sending = 0;
                write_enable = 0;
            end
        end
    end
    
endmodule
