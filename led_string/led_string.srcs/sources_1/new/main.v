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
    output sclk,
    output sdata,
    output scmd,

    // Power Pins
    output vbat,
    output vdd,
    
    // LED String Data Pins
    output status_led_1,
    output status_led_2,
    output status_led_3,
    output status_led_4,
                
    output reg light_clk,
    output reg light_data
    );
    
    // GPIO OUT MAP
    // 0 - VDD
    // 1 - VBAT
    // 2 - RESET
    // 3 - SCLK
    // 4 - SDATA
    // 5 - SCMD
    
    wire [7 : 0] mem_dout;
    wire [10 : 0] mem_addr;
    wire [7 : 0] mem_din;
    wire mem_write;
    
    wire clk_25;
    wire [31 : 0] gpio;
    wire spi_clk;
    wire spi_out;
    wire led_clk;
    wire led_data;
    
    zynq_1_wrapper cpu(
                .gpio(gpio),
                .fclk_out_25(clk_25), 
                .BRAM_PORTB_addr(mem_addr),
                .BRAM_PORTB_dout(mem_dout),
                .BRAM_PORTB_din(mem_din),
                .BRAM_PORTB_we(mem_write),
                .BRAM_PORTB_clk(clk_25)
                );
    
    led_controller led_cpu(
                .clk(clk_25),
                .mem_addr(mem_addr),
                .mem_dout(mem_dout),
                .mem_din(mem_din),
                .mem_write(mem_write), 
                .led_data(led_data),
                .led_clk(led_clk)         
                ); 
    
    assign vdd = gpio[0]; 
    assign vbat = gpio[1];
    assign reset = gpio[2];
    assign sclk = gpio[3];
    assign sdata = gpio[4];
    assign scmd = gpio[5];
    assign light_dir = gpio[8];
    
    always begin
        if (light_dir) begin
            light_clk = led_clk;
            light_data = led_data;
        end else begin
            light_clk = gpio[6];
            light_data = gpio[7];
        end
    end
    
    assign status_led_1 = 1;
    assign status_led_2 = 1;
    assign status_led_3 = 1;
    assign status_led_4 = 1;
    
    //wire clk;
    //IBUFG clk_buf(.I(clk_in), .O(clk)); // Clock Buffer Conversion
    
endmodule
