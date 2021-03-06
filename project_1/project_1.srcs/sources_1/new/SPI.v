`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/29/2021 11:31:42 AM
// Design Name:
// Module Name: SPI
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


module SPI(

    /*input clk, input[7:0] data, output mosi, output ss
    */
    input wire[7:0] in_data,
    input wire clk,  //
    input wire[1:0] addr, // commonds
    input wire wr,
    input wire rd,
    input wire cs, // ss?
    output reg[7:0] out_data,
    inout mosi,
    input miso,
    inout sclk
    );

    // --------define internal register and buffer--------
    // output buffer stage
    reg sclk_buf = 0;
    reg mosi_buf = 0;
    // idle flag , rst = 0 if no data to receive or send , or else set rst = 1
    reg rst = 0;
    // shift register
    reg[7:0] in_buf = 0;
    reg[7:0] out_buf = 0;

    reg[7:0] clk_cnt = 0;
    // division of clk , clk_div=0 means that clk is not be divide , and modify it could implement corresponding sck for device
    reg[7:0] clk_div = 0;

    reg[4:0] cnt = 0;
    // --------------------------------------------------

    // the port of module links internal buffer
    assign sclk = sclk_buf;
    assign mosi = mosi_buf;

    //sclk positive edge read data into out-shift register from miso , implement read operation
    always @(posedge sclk_buf) begin
        out_buf[0] <= miso;
        out_buf <= out_buf << 1;
    end

    // read data (combinatorial logic that level sensitive , detect all input)
    always @(cs or wr or rd or addr or out_buf or rst or clk_div) begin
        out_data = 8'bx;
        if (cs && rd) begin
            case(addr)
                2'b00 : out_data = out_buf;
                2'b01 : out_data = {7'b0 , rst}; // when send data encounter spi is rst , return rst singal
                2'b10 : out_data = clk_div;
                default : out_data = out_data;
            endcase
        end
    end

    // sclk negitive edge write data to mosi
    always @(posedge clk) begin
        if (!rst) begin // idle state load data into send buffer
            if(cs && wr) begin
                case(addr) // commonds
                    2'b00 : begin
                        in_buf <= in_data;
                        rst <= 1;
                        cnt <= 0;
                    end
                    2'b10 : begin
                        in_buf <= clk_div; // load number of division to slave for implement sync of sclk
                    end
                    default : in_buf <= in_buf;
                endcase
            end
            else if(cs && rd) begin
                rst <= 1;
                cnt <= 0;
            end
        end
        else begin // when 8-bits data write into buffer ,  begin send with bit by bit
            clk_cnt <= clk_cnt + 1;
            if (clk_cnt >= clk_div) begin // divide clk
                clk_cnt <= 0;

                if (cnt % 2 == 0) begin // when csk_buf is negitive , shift data into mosi buffer
                    mosi_buf <= in_buf[7];
                    in_buf <= in_buf << 1;
                end
                else begin
                    mosi_buf <= mosi_buf;
                end

                if (cnt > 0 && cnt < 17) begin
                    sclk_buf <= ~sclk_buf;
                end

                // 8-bits had sent over , spi regain idle
                if (cnt >= 17) begin
                    cnt <= 0;
                    rst <= 0;
                end
                else begin
                    cnt <= cnt;
                    rst <= rst;
                end

                cnt <= cnt + 1;
            end
        end
    end
endmodule
