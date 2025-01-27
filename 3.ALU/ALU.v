`timescale 1ns / 1ps


module ALU(input wire a,
           input wire b,
           input wire [2:0] choice  ,
           output reg out 
            );
           
           
always@*
    begin
    case(choice)
    
    3'd0 : out        =   a & b   ;
    3'd1 : out        =   a | b   ;
    3'd2 : out        = ~(a & b)  ;
    3'd3 : out        = ~(a | b)  ;
    3'd4 : out        =   a ^ b   ;
    3'd5 : out        = ~(a ^ b)  ;
    3'd6 : out        = ~ a       ;
    3'd7 : out        = 1'bx      ;
    default : out = out;
    endcase
    end
           
    
 
endmodule
