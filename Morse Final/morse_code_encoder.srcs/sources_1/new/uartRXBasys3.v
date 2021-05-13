`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2021 09:01:27
// Design Name: 
// Module Name: uartRXBasys3
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


module uartRXBasys3
(
  clk,
  btnD,
  RsRx,
  an,
  led,
  count
);

  parameter NBITS_COMPARE = 26;
  parameter COMPARE = 100_000; // 2ms/10ns/2

  input clk;
  input btnD;
  input RsRx;
  output [3:0] an;
  output wire [15:0] led;
  output wire [6:0] count;

  wire [7:0] wDataRX;
  wire rst = !btnD;

  uartRX UART
  (
    .clk (clk),
    .rst (rst),
    .serialRX (RsRx),
    .dataRX (wDataRX),
    .done (led[0]),
    .busy (led[1])
  );

  wire equal2ms;
  reg [1:0] selDispTrans;
  reg [3:0] BCD;

  countCompare
  #(
    .NBITS(NBITS_COMPARE)
  ) COUNTCOMPARE
  (
    .clk (clk),
    .rst (rst),
    .compareValue (COMPARE),
    .equal (equal2ms)
  );

  always @ (posedge clk or negedge rst) begin
    if (!rst) begin
      selDispTrans = 2'b00;
    end
    else begin
      if (equal2ms) begin
        selDispTrans = selDispTrans + 1'b1;
      end
    end
  end
 
  morse_encoder(
    wDataRX,
    count,
    led
    );
    
  assign an = 4'b1110;

endmodule
