`timescale 1ns / 1ps

module morse_encoder(
input [7:0] sw,
output reg [6:0] count,
output reg [15:0] led
    );
    
    always@(*)
    begin
        if(sw[5:0]==7'b01000001)        //A
        begin
            count=7'b0010010; 
            led[15:10]=6'b010000;       //.-      
        end
        else if(sw[5:0]==7'b01000010)          //B
        begin
            count=7'b1001100; 
            led[15:10]=6'b100000;       //-...
        end
        else if(sw[5:0]==7'b01000011)          //C
        begin
            count=7'b1001100; 
            led[15:10]=6'b101000;       //-.-.
        end
        else if(sw[5:0]==7'b01000100)          //D
        begin
            count=7'b0000110; 
            led[15:10]=6'b100000;       //-..
        end
        else if(sw[5:0]==7'b01000101)          //E
        begin
            count=7'b1001111;           
            led[15:10]=6'b000000;       //.     
        end
        else if(sw[5:0]==7'b01000110)          //F
        begin
            count=7'b1001100;           
            led[15:10]=6'b001000;       //..-.     
        end
        else if(sw[5:0]==7'b01000111)          //G
        begin
            count=7'b0000110;           
            led[15:10]=6'b110000;       //--.     
        end
        else if(sw[5:0]==7'b01001000)          //H
        begin
            count=7'b1001100;           
            led[15:10]=6'b000000;       //....     
        end
        else if(sw[5:0]==7'b01001001)          //I
        begin
            count=7'b0010010;           
            led[15:10]=6'b000000;       //..     
        end
        else if(sw[5:0]==7'b01001010)          //J
        begin
            count=7'b1001100;           
            led[15:10]=6'b011100;       //.---     
        end
        else if(sw[5:0]==7'b01001011)          //K
        begin
            count=7'b0000110;           
            led[15:10]=6'b101000;       //-.-     
        end
        else if(sw[5:0]==7'b01001100)          //L
        begin
            count=7'b1001100;           
            led[15:10]=6'b010000;       //.-..     
        end
        else if(sw[5:0]==7'b01001101)          //M
        begin
            count=7'b0010010;           
            led[15:10]=6'b110000;       //--     
        end
        else if(sw[5:0]==7'b01001110)          //N
        begin
            count=7'b0010010;           
            led[15:10]=6'b100000;       //-.     
        end
        else if(sw[5:0]==7'b01001111)          //O
        begin
            count=7'b0000110;           
            led[15:10]=6'b111000;       //---     
        end
        else if(sw[5:0]==7'b01010000)          //P
        begin
            count=7'b1001100;           
            led[15:10]=6'b011000;       //.--.     
        end
        else if(sw[5:0]==7'b01010001)          //Q
        begin
            count=7'b1001100;           
            led[15:10]=6'b110100;       //--.-     
        end
        else if(sw[5:0]==7'b01010010)          //R
        begin
            count=7'b0000110;           
            led[15:10]=6'b010000;       //.-.     
        end
        else if(sw[5:0]==7'b01010011)          //S
        begin
            count=7'b1001100;           
            led[15:10]=6'b000000;       //...     
        end
        else if(sw[5:0]==7'b01010100)          //T
        begin
            count=7'b1001111;           
            led[15:10]=6'b100000;       //-     
        end
        else if(sw[5:0]==7'b01010101)          //U
        begin
            count=7'b0000110;           
            led[15:10]=6'b001000;       //..-     
        end
        else if(sw[5:0]==7'b01010110)          //V
        begin
            count=7'b1001100;           
            led[15:10]=6'b000100;       //...-    
        end
        else if(sw[5:0]==7'b01010111)          //W
        begin
            count=7'b0000110;           
            led[15:10]=6'b011000;       //.--    
        end
        else if(sw[5:0]==7'b01011000)          //X
        begin
            count=7'b1001100;           
            led[15:10]=6'b100100;       //-..-    
        end
        else if(sw[5:0]==7'b01011001)          //Y
        begin
            count=7'b1001100;           
            led[15:10]=6'b101100;       //-.--    
        end
        else if(sw[5:0]==7'b01011010)          //Z
        begin
            count=7'b1001100;           
            led[15:10]=6'b110000;       //--..    
        end
        else if(sw[5:0]==7'b01000001)          //0
        begin
            count=7'b0100100;           
            led[15:10]=6'b111110;       //-----    
        end
        else if(sw[5:0]==7'b00110001)          //1
        begin
            count=7'b0100100;           
            led[15:10]=6'b011110;       //.----    
        end
        else if(sw[5:0]==7'b00110010)          //2
        begin
            count=7'b0100100;           
            led[15:10]=6'b001110;       //..---    
        end
        else if(sw[5:0]==7'b00110011)          //3
        begin
            count=7'b0100100;           
            led[15:10]=6'b000110;       //...--    
        end
        else if(sw[5:0]==7'b00110011)          //4
        begin
            count=7'b0100100;           
            led[15:10]=6'b000010;       //....-    
        end
        else if(sw[5:0]==7'b00110011)          //5
        begin
            count=7'b0100100;           
            led[15:10]=6'b000000;       //.....   
        end
        else if(sw[5:0]==7'b00110110)          //6
        begin
            count=7'b0100100;           
            led[15:10]=6'b100000;       //-....    
        end
        else if(sw[5:0]==7'b00110110)          //7
        begin
            count=7'b0100100;           
            led[15:10]=6'b110000;       //--...    
        end
        else if(sw[5:0]==7'b00110110)          //8
        begin
            count=7'b0100100;           
            led[15:10]=6'b111000;       //---..    
        end
        else if(sw[5:0]==7'b00110110)          //9
        begin
            count=7'b0100100;           
            led[15:10]=6'b111100;       //----.    
        end
        else if(sw[5:0]==7'b00110110)          //.
        begin
            count=7'b0100000;           
            led[15:10]=6'b010101;       //.-.-.-    
        end
        else if(sw[5:0]==7'b00110110)          //,
        begin
            count=7'b0100000;           
            led[15:10]=6'b110011;       //--..--    
        end
        else if(sw[5:0]==7'b00110110)          //?
        begin
            count=7'b0100000;           
            led[15:10]=6'b001100;       //..--..    
        end
        else
        begin
            count=7'b1111110;
            led[15:10]=6'b000000;
        end
    end    
endmodule