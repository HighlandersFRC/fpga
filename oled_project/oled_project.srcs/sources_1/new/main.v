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

//    // Data Pins
//    output reg reset = 0,
//    output reg sclk = 0, // Half the speed of data_clk, a 20,000th the speed of clk
//    output reg sdata = 0,
//    output reg scmd = 0,

//    // Power Pins
//    output reg vbat = 1,
//    output reg vdd = 1

    // Data Pins
    output reset,
    output sclk, // Half the speed of data_clk, a 20,000th the speed of clk
    output sdata,
    output scmd,

    // Power Pins
    output vbat,
    output vdd,
    output status_led
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
    
    wire clk;
    IBUFG clk_buf(.I(clk_in), .O(clk)); // Clock Buffer Conversion
    
//    reg data_clk = 0; // A tenth-thousandth the speed of clk
//    reg [32 : 0] data_clk_cnt = 4'b0;
//    reg [7 : 0] reset_cnt = 0;
//    always @ (posedge clk) begin
//        if (data_clk_cnt == 10000) begin
//            data_clk_cnt = 0;
//            data_clk = ~data_clk;
//        end
//        else if (reset_cnt > 100) begin
//            data_clk_cnt = data_clk_cnt + 1;
//            reset = 1;
//        end
//        else
//            reset_cnt = reset_cnt + 1;
//    end
    
//    reg [7 : 0] data [127 : 0];
//    reg [7 : 0] dc [127 : 0];
//    reg [32 : 0] data_count = 50;
    
//    integer i;
    
//    initial begin
//        data[0] = 8'hAE; // Display Off
//        dc[0] = 0;
        
//        data[1] = 8'h8D; // Pump 1
//        dc[1] = 0;
        
//        data[2] = 8'h14;
//        dc[2] = 0;
        
//        data[3] = 8'hD9; // Precharge
//        dc[3] = 0;
        
//        data[4] = 8'hF1;
//        dc[4] = 0;
        
//        data[5] = 8'h81; // Contrast
//        dc[5] = 0;
                
//        data[6] = 8'hFF;
//        dc[6] = 0;
        
//        data[7] = 8'hA4; // Display from RAM
//        dc[7] = 0;
                
//        data[8] = 8'hAE; // Display On
//        dc[8] = 0;
                
//        for (i = 9; i < 28; i = i + 1) begin
//            data[i] = 8'hE3;
//            dc[i] = 0;
//        end
        
//        data[28] = 8'h20; // Page address mode
//        dc[28] = 0;
//        data[29] = 8'h01; // Vertical address mode
//        dc[29] = 0;
//        data[30] = 8'hA5;
//        dc[30] = 0;
//        for (i = 31; i < 51; i = i + 1) begin
//            data[i] = 8'h00;
//            dc[i] = 1;
//        end
//    end
    
//    reg [7 : 0] data_addr = 0;
    
//    reg [7 : 0] data_out = 8'h00;
//    reg [3 : 0] data_progress = 15;
//    reg data_final = 0;
//    reg data_enable = 1;
    
//    // Main SPI communications loop
//    always @ (posedge data_clk) begin
    
//        // Wraps up commications by pulling clk down, data_off, reseting data_final,
//        // and stops from repeating by setting data_enable low.
//        // Only is needed when not automated by arm cores.
//        if (data_final == 1) begin
//            sclk = 0;
//            sdata = 0;
//            data_final = 0;
//            data_enable = 0;
//        end
    
//        // Primary communication routine 
//        if (data_enable) begin
//            scmd = dc[data_addr];
//            data_out = data[data_addr];
//            sclk = !data_progress[0];
//            if (sclk == 0) begin
//                sdata = data_out[(data_progress >> 1)];
//            end
//            data_progress = data_progress - 1;
//            if (data_progress == 15)
//                data_addr = data_addr + 1;
//        end
        
//        // Signals cleanup routine when communication is done.
//        if (data_addr > data_count)
//            data_final = 1;
//    end
    
endmodule
