`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2021 12:13:25
// Design Name: 
// Module Name: countCompare
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


module countCompare
#(
  parameter NBITS = 14
)
(
  input	clk,
  input rst,
  input	[NBITS-1:0] compareValue,
  output reg equal
);

  reg [NBITS-1:0] counter;

  always @ (negedge rst or posedge clk) begin
    if (!rst) begin
      counter <= {NBITS{1'b0}};
    end
    else begin
      if (equal) begin
        counter <= {NBITS{1'b0}};
      end
      else begin
        counter <= counter + 1'b1;
      end
    end
  end

  always @ (compareValue or counter) begin
    if (counter == compareValue) begin
      equal = 1'b1;
    end
    else begin
      equal = 1'b0;
    end
  end

endmodule
