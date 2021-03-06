`timescale 1ns / 1ps

module enable(
    input refreshClk,
    output enable_D1, 
    output enable_D2, 
    output enable_D3, 
    output enable_D4
);

reg [3:0] pattern = 4'b0111; 

assign enable_D1 = pattern[3];
assign enable_D2 = pattern[2]; 
assign enable_D3 = pattern[1]; 
assign enable_D4 = pattern[0]; 

always @(posedge refreshClk) begin
  pattern <= {pattern[0],pattern[3:1]};
end

endmodule
