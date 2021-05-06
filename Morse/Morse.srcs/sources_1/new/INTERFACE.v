`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2021 01:02:02 AM
// Design Name: 
// Module Name: INTERFACE
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


module INTERFACE(
    input wire clk,
    input wire [7:0] variable,
    output reg [7:0] led_reg
    );
    
    // INIT
    initial led_reg = 8'b00000000;
    
    // CLOCK SLOW
    reg [0:0] slow_clk = 1'b0;
    integer counter = 0;
    always @ (posedge clk) begin
        if (counter == 25000000) begin
            counter = 0;
            slow_clk = ~slow_clk;
        end
        else begin
            counter = counter + 1;
        end
    end
    // VAR
    reg [0:0] light_on = 1'b0;
    
    // INTELLIGENCE
    always @ (posedge slow_clk) begin
        light_on = ~light_on;
        if(light_on == 1'b0) begin
            led_reg = variable;
        end
        else begin
            led_reg = 8'b00000000;
        end
    end
    
endmodule
