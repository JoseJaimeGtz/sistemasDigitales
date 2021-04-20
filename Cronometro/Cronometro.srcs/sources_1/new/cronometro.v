`timescale 1ns / 1ps

// Company: 
// Engineer: 
// 
// Create Date: 20.04.2021 13:08:40
// Design Name: 
// Module Name: cronometro
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

module conometro(
input clk,
input button_n,
input reset_n, 
output [6:0] segment, 
output enable_D1,
output enable_D2,
output enable_D3,
output enable_D4,
output dp
    );

wire clk_point1hz;
wire refreshClk;
reg [3:0] hex;
wire [3:0] reg_d0; 
wire [3:0] reg_d1;
wire [3:0] reg_d2;
wire [3:0] reg_d3;


clocks (
.clk(clk),
.refreshClk(refreshClk),
.clk_point1hz(clk_point1hz)
);


enable(
.refreshClk(refreshClk),
.enable_D1(enable_D1),
.enable_D2(enable_D2),
.enable_D3(enable_D3),
.enable_D4(enable_D4)
);


contador(
.button_n(button_n),
.reset_n(reset_n),
.clk_point1hz(clk_point1hz),
.reg_d0(reg_d0),
.reg_d1(reg_d1),
.reg_d2(reg_d2),
.reg_d3(reg_d3)
);


sieteseg(
.hex(hex),
.segment(segment),
.dp(dp)
);




always @ (*)

case ({enable_D1,enable_D2,enable_D3,enable_D4})
    4'b0111: hex = reg_d0;
    4'b1011: hex = reg_d1;
    4'b1101: hex = reg_d2;
    4'b1110: hex = reg_d3;
    default: hex = 0; 
endcase 
endmodule