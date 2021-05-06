`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2021 12:57:59 AM
// Design Name: 
// Module Name: led
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


module led(
    input wire clk,
    input wire[7:0] A,
    output wire[7:0] Led
    );
    
    // REGISTROS
    reg [7:0] A_reg = 8'b00000000;
    
    // BUSSES
    reg [7:0] led_bus;
    
    // INTELLIGENCE
    always @ (posedge clk) begin
        A_reg = A;
    end
    
    INTERFACE leds_handler(
        .clk(clk),
        .variable(A_reg),
        .led_reg(led_bus)
    );
    
    // ASSIGN
    assign Led = led_bus;
    
endmodule
