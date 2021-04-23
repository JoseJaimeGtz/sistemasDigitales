`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 11:46:31 AM
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

module cronometro
#(
  /* si p=10ns y queremos 10 ms
  10ms / 10ns = 1M / 2 = 500k
  log(500^3)/log(2) = 18.93 => 19 bits para abarcar */
  parameter COUNTER_COMPARE = 500_000
)
(
  input clock, // 100 MHz
  input reset,
  input start,
  output [6:0] disp7seg,
  output [3:0] dispSel
);

  wire equal;
  wire subClock;

  reg [3:0] r10ms;
  reg [3:0] r100ms;
  reg [3:0] r1s;
  reg [3:0] r10s;

  countCompare
  #(
    .NBITS (19)
  ) count
  (
    .clk (clock),
    .rst (!reset),
    .compareValue (COUNTER_COMPARE),
    .equal (equal)
  );

  ffT FFTCLK
  (
    .clk (clock),
    .rst (!reset),
    .t (equal),
    .q (subClock)
  );

  always @ (posedge subClock or posedge reset) begin
    if (reset) begin
      r10ms <= 0;
      r100ms <= 0;
      r1s <= 0;
      r10s <= 0;
    end
    else begin
      if (start) begin
        r10ms = r10ms + 1'b1;

        if (r10ms > 9) begin
          r10ms = 0;
          r100ms = r100ms + 1'b1;
        end

        if (r100ms > 9) begin
          r100ms = 0;
          r1s = r1s + 1'b1;
        end

        if (r1s > 9) begin
          r1s = 0;
          r10s = r10s + 1'b1;
        end

        if (r10s > 6) begin
          r10s = 0;
        end
      end
    end
  end

  sweep4disp7seg DISP7SEG
  (
    .clk (clock),
    .rst (!reset),
    .disp0 (r10ms),
    .disp1 (r100ms),
    .disp2 (r1s),
    .disp3 (r10s),
  	.seg (disp7seg),
  	.dispTrans (dispSel)
  );

endmodule

