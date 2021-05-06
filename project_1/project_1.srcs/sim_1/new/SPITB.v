`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2021 11:45:30 AM
// Design Name: 
// Module Name: SPITB
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


module SPITB();
// Inputs
    reg [7:0] in_data;
    reg clk;
    reg [1:0] addr;
    reg wr;
    reg rd;
    reg cs;
    reg miso;

    // Outputs
    wire [7:0] out_data;

    // Bidirs
    wire mosi;
    wire sclk;

    // Instantiate the Unit Under Test (UUT)
    SPI uut (
        .in_data(in_data), 
        .clk(clk), 
        .addr(addr), 
        .wr(wr), 
        .rd(rd), 
        .cs(cs), 
        .out_data(out_data), 
        .mosi(mosi), 
        .miso(miso), 
        .sclk(sclk)
    );

    initial begin
        // Initialize Inputs
        in_data = 0;
        clk = 0;
        addr = 0;
        wr = 0;
        rd = 0;
        cs = 0;
        miso = 0;

        // set clk_div , and out by out_data
        #40;
        addr = 0;
        in_data = 8'haa;
        wr = 1;
        cs = 1;
        
        // write data 
        #20 ;
        wr = 0;
        cs = 0;

        #360 ;
        wr = 1;
        cs = 1;
        in_data = 8'h91;

        #20 ;
        wr = 0;
        cs = 0;
    end

    // define clock
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
endmodule
