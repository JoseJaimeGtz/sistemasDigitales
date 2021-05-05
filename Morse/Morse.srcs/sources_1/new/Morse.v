`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2021 09:40:08
// Design Name: 
// Module Name: Morse
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

module morse_encoder(
input [0:7] sw,
output reg [0:3] count,
output reg [0:5] led
    );
    always@(*)
    begin
        if(sw[0:7]== 7'b01000001)               //A
        begin
            count=2; 
            led[0:5]=6'b010000;       //.-      
        end
        else if(sw[0:7]==7'b01000010)          //B
        begin
            count=4; 
            led[0:5]=6'b100000;       //-...
        end
        else if(sw[0:7]==7'b01000011)          //C
        begin
            count=4; 
            led[0:5]=6'b101000;       //-.-.
        end
        else if(sw[0:7]==7'b01000100)          //D
        begin
            count=3; 
            led[0:5]=6'b100000;       //-..
        end
        else if(sw[0:7]==7'b01000101)          //E
        begin
            count=1;           
            led[0:5]=6'b000000;       //.     
        end
        else if(sw[0:7]==7'b01000110)          //F
        begin
            count=4;           
            led[0:5]=6'b001000;       //..-.     
        end
        else if(sw[0:7]==7'b01000111)          //G
        begin
            count=3;           
            led[0:5]=6'b110000;       //--.     
        end
        else if(sw[0:7]==7'b01001000)          //H
        begin
            count=4;           
            led[0:5]=6'b000000;       //....     
        end
        else if(sw[0:7]==7'b01001001)          //I
        begin
            count=3;           
            led[0:5]=6'b000000;       //..     
        end
        else if(sw[0:7]==7'b01001010)          //J
        begin
            count=4;           
            led[0:5]=6'b011100;       //.---     
        end
        else if(sw[0:7]==7'b01001011)          //K
        begin
            count=3;           
            led[0:5]=6'b101000;       //-.-     
        end
        else if(sw[0:7]==7'b01001100)          //L
        begin
            count=4;           
            led[0:5]=6'b010000;       //.-..     
        end
        else if(sw[0:7]==7'b01001101)          //M
        begin
            count=2;           
            led[0:5]=6'b110000;       //--     
        end
        else if(sw[0:7]==7'b01001110)          //N
        begin
            count=2;           
            led[0:5]=6'b100000;       //-.     
        end
        else if(sw[0:7]==7'b01001111)          //O
        begin
            count=3;           
            led[0:5]=6'b111000;       //---     
        end
        else if(sw[0:7]==7'b01010000)          //P
        begin
            count=4;           
            led[0:5]=6'b011000;       //.--.     
        end
        else if(sw[0:7]==7'b01010001)          //Q
        begin
            count=4;           
            led[0:5]=6'b110100;       //--.-     
        end
        else if(sw[0:7]==7'b01010010)          //R
        begin
            count=3;           
            led[0:5]=6'b010000;       //.-.     
        end
        else if(sw[0:7]==7'b01010011)          //S
        begin
            count=3;           
            led[0:5]=6'b000000;       //...     
        end
        else if(sw[0:7]==7'b01010100)          //T
        begin
            count=1;           
            led[0:5]=6'b100000;       //-     
        end
        else if(sw[0:7]==7'b01010101)          //U
        begin
            count=3;           
            led[0:5]=6'b001000;       //..-     
        end
        else if(sw[0:7]==7'b01010110)          //V
        begin
            count=4;           
            led[0:5]=6'b000100;       //...-    
        end
        else if(sw[0:7]==7'b01010111)          //W
        begin
            count=3;           
            led[0:5]=6'b011000;       //.--    
        end
        else if(sw[0:7]==7'b01011000)          //X
        begin
            count=4;           
            led[0:5]=6'b100100;       //-..-    
        end
        else if(sw[0:7]==7'b01011001)          //Y
        begin
            count=4;           
            led[0:5]=6'b101100;       //-.--    
        end
        else if(sw[0:7]==7'b01011010)          //Z
        begin
            count=4;           
            led[0:5]=6'b110000;       //--..    
        end
        else if(sw[0:7]==7'b01000001)          //0
        begin
            count=5;           
            led[0:5]=6'b111110;       //-----    
        end
        else if(sw[0:7]==7'b00110001)          //1
        begin
            count=5;           
            led[0:5]=6'b011110;       //.----    
        end
        else if(sw[0:7]==7'b00110010)          //2
        begin
            count=5;           
            led[0:5]=6'b001110;       //..---    
        end
        else if(sw[0:7]==7'b00110011)          //3
        begin
            count=5;           
            led[0:5]=6'b000110;       //...--    
        end
        else if(sw[0:7]==7'b00110011)          //4
        begin
            count=5;           
            led[0:5]=6'b000010;       //....-    
        end
        else if(sw[0:7]==7'b00110011)          //5
        begin
            count=5;           
            led[0:5]=6'b000000;       //.....   
        end
        else if(sw[0:7]==7'b00110110)          //6
        begin
            count=5;           
            led[0:5]=6'b100000;       //-....    
        end
        else if(sw[0:7]==7'b00110110)          //7
        begin
            count=5;           
            led[0:5]=6'b110000;       //--...    
        end
        else if(sw[0:7]==7'b00110110)          //8
        begin
            count=5;           
            led[0:5]=6'b111000;       //---..    
        end
        else if(sw[0:7]==7'b00110110)          //9
        begin
            count=5;           
            led[0:5]=6'b111100;       //----.    
        end
        else if(sw[0:7]==7'b00110110)          //.
        begin
            count=6;           
            led[0:5]=6'b010101;       //.-.-.-    
        end
        else if(sw[0:7]==7'b00110110)          //,
        begin
            count=6;           
            led[0:5]=6'b110011;       //--..--    
        end
        else if(sw[0:7]==7'b00110110)          //?
        begin
            count=6;           
            led[0:5]=6'b001100;       //..--..    
        end
        else
        begin
            count=1;
            led[0:5]=6'b000000;
        end
    end    
endmodule
