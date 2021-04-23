`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 11:51:23 AM
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

module cronometroTB ();
  reg clock;
  reg reset;
  reg start;
  wire [6:0] disp7seg;
  wire [3:0] dispSel;

  cronometro
  #(
    .COUNTER_COMPARE (100/2)
  )
  DUT
  (
    .clock (clock), // 100 MHz
    .reset (reset),
    .start (start),
    .disp7seg (disp7seg),
    .dispSel (dispSel)
  );

  always begin
    #1 clock = ~clock;
  end

  initial begin
    clock = 0;
    reset = 1;
    start = 0;

    #10
    reset = 0;

    #2000100
    $stop;
  end

endmodule

