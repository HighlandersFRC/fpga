`timescale 1ns / 1ns

module spi(
    input [7 : 0] data_in,
    input clk,
    input write_enable,
    output reg spi_out = 0,
    output reg spi_clk = 0,
    output reg write_done = 0
    );
    
    reg [4 : 0] data_progress = 4'b0;
    
    always @ (posedge clk) begin
        if (write_enable && data_progress == 0) begin
            data_progress = 1;
            write_done = 0;
        end else if (data_progress != 0) begin
            data_progress = data_progress + 1;
            spi_clk = 1;
        end
    end
    
    always @ (negedge clk) begin
        if (data_progress != 0) begin
            spi_clk = 0;
            if (data_progress <= 8) spi_out = data_in[8 - data_progress];
            else begin
                write_done = 1;
                data_progress = 0;
                spi_out = 0;
            end
        end
    end

endmodule