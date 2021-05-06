`timescale 1ns / 1ps

module SPIExam(
  clk, // 20 MHz
  data,
  mosi,
  ss
  );

  input clk;
  input[7:0] data;
  output mosi;
  output ss;

  // modo0 flanco de subida
  //flanco de bajada
  // always @ ( * ) begin posedge
  // modo de transmicion esta en spi para cambiar el dato/estado
  //


  parameter clkCounter = 10407;
  parameter NBITS = 8;

  wire subclk;
  wire equal;

  countCompare CC(
    .clk(clk),
    .rst(1),
    .compareValue(clkCounter),
    equal(equal)
    );

    ffT flip(
      .clk(clk),
      .rst(1),
      .t(),
      .q(),
      .q_n()
    );

endmodule
