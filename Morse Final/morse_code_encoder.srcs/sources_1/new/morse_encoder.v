`timescale 1ns / 1ps

module morse_encoder(
input [7:0] sw,
output reg [6:0] count,
output reg [15:0] led
    );
    
    always@(*)
    begin
        if(sw[7:0]==7'b01100001)        //A
        begin
            count=7'b0010010; 
            led[15:10]=6'b010000;       //.-      
        end
        else if(sw[7:0]==7'b01100010)          //B
        begin
            count=7'b1001100; 
            led[15:10]=6'b100000;       //-...
        end
        else if(sw[7:0]==7'b01100011)          //C
        begin
            count=7'b1001100; 
            led[15:10]=6'b101000;       //-.-.
        end
        else if(sw[7:0]==7'b01100100)          //D
        begin
            count=7'b0000110; 
            led[15:10]=6'b100000;       //-..
        end
        else if(sw[7:0]==7'b01100101)          //E
        begin
            count=7'b1001111;           
            led[15:10]=6'b000000;       //.     
        end
        else if(sw[7:0]==7'b01100110)          //F
        begin
            count=7'b1001100;           
            led[15:10]=6'b001000;       //..-.     
        end
        else if(sw[7:0]==7'b01100111)          //G
        begin
            count=7'b0000110;           
            led[15:10]=6'b110000;       //--.     
        end
        else if(sw[7:0]==7'b01101000)          //H
        begin
            count=7'b1001100;           
            led[15:10]=6'b000000;       //....     
        end
        else if(sw[7:0]==7'b01101001)          //I
        begin
            count=7'b0010010;           
            led[15:10]=6'b000000;       //..     
        end
        else if(sw[7:0]==7'b01101010)          //J
        begin
            count=7'b1001100;           
            led[15:10]=6'b011100;       //.---     
        end
        else if(sw[7:0]==7'b01101011)          //K
        begin
            count=7'b0000110;           
            led[15:10]=6'b101000;       //-.-     
        end
        else if(sw[7:0]==7'b01101100)          //L
        begin
            count=7'b1001100;           
            led[15:10]=6'b010000;       //.-..     
        end
        else if(sw[7:0]==7'b01101101)          //M
        begin
            count=7'b0010010;           
            led[15:10]=6'b110000;       //--     
        end
        else if(sw[7:0]==7'b01101110)          //N
        begin
            count=7'b0010010;           
            led[15:10]=6'b100000;       //-.     
        end
        else if(sw[7:0]==7'b01101111)          //O
        begin
            count=7'b0000110;           
            led[15:10]=6'b111000;       //---     
        end
        else if(sw[7:0]==7'b01110000)          //P
        begin
            count=7'b1001100;           
            led[15:10]=6'b011000;       //.--.     
        end
        else if(sw[7:0]==7'b01110001)          //Q
        begin
            count=7'b1001100;           
            led[15:10]=6'b110100;       //--.-     
        end
        else if(sw[7:0]==7'b01110010)          //R
        begin
            count=7'b0000110;           
            led[15:10]=6'b010000;       //.-.     
        end
        else if(sw[7:0]==7'b01110011)          //S
        begin
            count=7'b1001100;           
            led[15:10]=6'b000000;       //...     
        end
        else if(sw[7:0]==7'b01110100)          //T
        begin
            count=7'b1001111;           
            led[15:10]=6'b100000;       //-     
        end
        else if(sw[7:0]==7'b01110101)          //U
        begin
            count=7'b0000110;           
            led[15:10]=6'b001000;       //..-     
        end
        else if(sw[7:0]==7'b01110110)          //V
        begin
            count=7'b1001100;           
            led[15:10]=6'b000100;       //...-    
        end
        else if(sw[7:0]==7'b01110111)          //W
        begin
            count=7'b0000110;           
            led[15:10]=6'b011000;       //.--    
        end
        else if(sw[7:0]==7'b01111000)          //X
        begin
            count=7'b1001100;           
            led[15:10]=6'b100100;       //-..-    
        end
        else if(sw[7:0]==7'b01111001)          //Y
        begin
            count=7'b1001100;           
            led[15:10]=6'b101100;       //-.--    
        end
        else if(sw[7:0]==7'b01111010)          //Z
        begin
            count=7'b1001100;           
            led[15:10]=6'b110000;       //--..    
        end
        else if(sw[7:0]==7'b00110000)          //0
        begin
            count=7'b0100100;           
            led[15:10]=6'b111110;       //-----    
        end
        else if(sw[7:0]==7'b00110001)          //1
        begin
            count=7'b0100100;           
            led[15:10]=6'b011110;       //.----    
        end
        else if(sw[7:0]==7'b00110010)          //2
        begin
            count=7'b0100100;           
            led[15:10]=6'b001110;       //..---    
        end
        else if(sw[7:0]==7'b00110011)          //3
        begin
            count=7'b0100100;           
            led[15:10]=6'b000110;       //...--    
        end
        else if(sw[7:0]==7'b00110100)          //4
        begin
            count=7'b0100100;           
            led[15:10]=6'b000010;       //....-    
        end
        else if(sw[7:0]==7'b00110101)          //5
        begin
            count=7'b0100100;           
            led[15:10]=6'b000000;       //.....   
        end
        else if(sw[7:0]==7'b00110110)          //6
        begin
            count=7'b0100100;           
            led[15:10]=6'b100000;       //-....    
        end
        else if(sw[7:0]==7'b00110111)          //7
        begin
            count=7'b0100100;           
            led[15:10]=6'b110000;       //--...    
        end
        else if(sw[7:0]==7'b00111000)          //8
        begin
            count=7'b0100100;           
            led[15:10]=6'b111000;       //---..    
        end
        else if(sw[7:0]==7'b00111001)          //9
        begin
            count=7'b0100100;           
            led[15:10]=6'b111100;       //----.    
        end
        else if(sw[7:0]==7'b00101110)          //.
        begin
            count=7'b0100000;           
            led[15:10]=6'b010101;       //.-.-.-    
        end
        else if(sw[7:0]==7'b00101100)          //,
        begin
            count=7'b0100000;           
            led[15:10]=6'b110011;       //--..--    
        end
        else if(sw[7:0]==7'b00111111)          //?
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