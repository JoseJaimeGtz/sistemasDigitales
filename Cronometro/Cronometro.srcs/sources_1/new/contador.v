`timescale 1ns / 1ps

module contador(
input button_n,
input reset_n,
input clk_point1hz,
output reg [3:0] reg_d0,
output reg [3:0] reg_d1,
output reg [3:0] reg_d2,
output reg [3:0] reg_d3
    );

reg button_n_ff;
reg start_stop;
reg reset_n_ff;
reg reset;

always @ (posedge clk_point1hz)
    begin
        button_n_ff <= button_n;
        if (button_n_ff && !button_n)
                start_stop <= ~start_stop; 
        reset_n_ff <= reset_n;
        if (reset_n_ff && !reset_n)
            reset <=1;
        else
            reset <=0;
    end

always @(posedge clk_point1hz)
begin
     if (start_stop == 1 && reset ==1)
        begin 
            reg_d0 <= 0; 
            reg_d1 <= 0; 
            reg_d2 <= 0; 
            reg_d3 <= 0;
        
        
        end else if (start_stop == 1) 
        begin
            reg_d0 <= reg_d0; 
            reg_d1 <= reg_d1; 
            reg_d2 <= reg_d2; 
            reg_d3 <= reg_d3; 
        end else if (start_stop != 1)
        begin
          if(reg_d0 == 9)
          begin
             reg_d0 <= 0;
             if (reg_d1 == 9)
                 begin
                    reg_d1 <= 0; 
                    if (reg_d2 == 9)
                        begin 
                            reg_d2 <= 0; 
                            if(reg_d3 == 9)
                                reg_d3 <= 0;
                            else
                                reg_d3 <= reg_d3 + 1;
                        end else
                            reg_d2 <= reg_d2 + 1;
                 end else
                     reg_d1 <= reg_d1 + 1; 
          end else
            reg_d0 <= reg_d0 + 1;
         end
end
    
endmodule
