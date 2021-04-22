`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 12:10:42 AM
// Design Name: 
// Module Name: cronometroTB
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


module cronometroTB();
    reg clk;
    reg button_n;
    reg reset_n;
    wire [6:0] segment;
    wire enable_D1;
    wire enable_D2;
    wire enable_D3;
    wire enable_D4;
    wire dp;
    
    cronometro DUT (
        .clk(clk),
        .button_n(button_n),
        .reset_n(reset_n),
        .segment(segment),
        .enable_D1(enable_D1),
        .enable_D2(enable_D2),
        .enable_D3(enable_D3),
        .enable_D4(enable_D4),
        .dp(dp)
    );
    
    always begin
        #1 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        button_n = 0;
        reset_n = 0;
        #300
        
        button_n = 1;
        #300
        
        button_n = 0;
        #300
        
        button_n = 1;
        #300
        
        reset_n = 1;
        #300
        
        button_n = 0;
        
        #2000
        $stop;
    end

endmodule
