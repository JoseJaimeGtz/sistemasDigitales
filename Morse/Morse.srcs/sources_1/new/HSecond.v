`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2021 09:40:08
// Design Name: 
// Module Name: HSecond
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


module HSecond(
    input clk,
    output reg led
    );
integer kontador = 0;
reg enabled = 1;

always @(posedge clk)
begin
    
     if(kontador == 500_010)
        enabled <= 0;
     else
        kontador <= kontador+1;
end

always @(posedge clk)
if (enabled) begin
    led <= 0;
     if(kontador == 250_000)
        led <= 1;
     else if (kontador == 500_000)
        led <= 0; 
        enabled <=0;
        
end
endmodule