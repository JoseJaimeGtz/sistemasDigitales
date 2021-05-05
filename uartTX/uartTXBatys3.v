`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2021 01:05:17 PM
// Design Name: 
// Module Name: uartTXBatys3
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


module uartTXBasys3
(
    input i_clk,
    input i_rst,
    input [7:0] i_data,
    input i_startTX,
    output o_busy,
    output o_done,
    output o_serialTX
);
    wire startDebounce;

    debouncer
    DEBOUNCER
    (
        .clk (i_clk),
        .rst (i_rst),
        .sw_pb (i_startTX),
        .one_shot (startDebounce)
    );
  
    uartTX
    UARTTX
    (
        .i_clk (i_clk),
        .i_rst (i_rst),
        .i_data (i_data),
        .i_startTX (startDebounce),
        .o_busy (o_busy),
        .o_done (o_done),
        .o_serialTX (o_serialTX)
    );
endmodule
