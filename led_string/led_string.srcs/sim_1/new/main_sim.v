`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2013 07:10:19 PM
// Design Name: 
// Module Name: main_sim
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


module main_sim();

    reg clk = 0;
    
    always begin // Always begins executing at time 0 and NEVER stops
        clk = 0; // Set clk to 0
        #10; // Wait for 1 time unit
        clk = 1; // Set clk to 1
        #10; // Wait 1 time unit
    end

    wire clk_recv;
    wire data;
    wire cmd;
    wire reset;

    main tb(.clk_in(clk), .sclk(clk_recv), .sdata(data), .scmd(cmd), .reset(reset));
    
    reg [7 : 0] data_recv = 0;
    reg [2 : 0] data_cnt = 7;
    always @ (posedge clk_recv) begin
        data_recv[data_cnt] = data;
        data_cnt = data_cnt - 1;
    end
    
endmodule
