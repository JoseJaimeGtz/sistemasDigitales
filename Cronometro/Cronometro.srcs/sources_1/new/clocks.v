`timescale 1ns / 1ps

module clocks(
input     clk,  
output    refreshClk,  
output    clk_point1hz 

);

reg [26:0] 	count = 0;  
reg [16:0] 	refresh = 0; 


reg      	tmp_clk = 0;
reg 		rclk = 0;


assign clk_point1hz = tmp_clk;
assign refreshClk = rclk;


BUFG clock_buf_0( 
  .I(clk),
  .O(clk_100mhz)
);


always @(posedge clk_100mhz) begin 
  if (count < 50_0000) begin
    count <= count + 1;
  end
  else begin
    tmp_clk <= ~tmp_clk; 
    count <= 0;
  end
end

always @(posedge clk_100mhz) begin
	if (refresh < 10000) begin
		refresh <= refresh + 1;
	end else begin
		refresh <= 0;
		rclk <= ~rclk;
	end
end

endmodule
