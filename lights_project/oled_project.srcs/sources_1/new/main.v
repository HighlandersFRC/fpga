`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2013 06:51:42 PM
// Design Name: 
// Module Name: main
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


module main (

    // Clk Input
    input clk_in,

    // Data Pins
    output reset,
    output sclk, // Half the speed of data_clk, a 20,000th the speed of clk
    output sdata,
    output scmd,

    // Power Pins
    output vbat,
    output vdd,
    
    // LED String Data Pins
    output status_led,
    output light_clk,
    output light_data
    );
    
    // GPIO OUT MAP
    // 0 - VDD
    // 1 - VBAT
    // 2 - RESET
    // 3 - SCLK
    // 4 - SDATA
    // 5 - SCMD
    
    wire [31 : 0] gpio;
    zynq_1_wrapper cpu(.gpio(gpio));
    
    assign vdd = gpio[0];
    assign vbat = gpio[1];
    assign reset = gpio[2];
    assign sclk = gpio[3];
    assign sdata = gpio[4];
    assign scmd = gpio[5];
    assign status_led = gpio[6];
    assign light_clk = gpio[7];
    assign light_data = gpio[8];
    
    wire clk;
    IBUFG clk_buf(.I(clk_in), .O(clk)); // Clock Buffer Conversion
    
endmodule
