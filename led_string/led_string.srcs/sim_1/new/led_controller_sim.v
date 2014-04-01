`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2014 07:10:33 PM
// Design Name: 
// Module Name: led_controller_sim
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


module led_controller_sim();

    integer i;
    reg clk = 0;
    
    always begin // Always begins executing at time 0 and NEVER stops
        clk = 0; // Set clk to 0
        #1; // Wait for 1 time unit
        clk = 1; // Set clk to 1
        #1; // Wait 1 time unit
    end
    
    reg [7 : 0] data [511 : 0];
    reg [7 : 0] data_out = 0;
    wire [10 : 0] data_addr;
    wire data_write;
    wire [7 : 0] data_in;
    
    wire led_clk;
    wire led_data;
    
    wire data_sending_test;
    
    initial begin
        for (i = 32'h0; i < 32'h10; i = i + 1) begin
            data[i] = 8'hff;
        end
        data[1] = 8'b0;
        for (i = 32'h10; i < 32'h200; i = i + 1) begin
            data[i] = 8'b11100111;
        end
    end
    
    always @ (posedge clk) begin
        data_out = data[data_addr];
        if (data_write) data[data_addr] = data_in;
        if (data[1] == 1) data[0] = 0;    
    end
    
    led_controller controller(
                .clk(clk),
                .mem_dout(data_out),
                .mem_addr(data_addr),
                .mem_din(data_in),
                .mem_write(data_write), 
                .led_clk(led_clk),
                .led_data(led_data),
                .data_sending_test(data_sending_test)
    );

endmodule
