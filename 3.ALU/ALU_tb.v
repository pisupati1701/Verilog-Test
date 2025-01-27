`timescale 1ns / 1ps


module ALU_tb();
 reg    a         ;
 reg    b         ; 
 reg    [2:0] choice    ; 
 wire   out       ; 
    
    
   ALU DUT( .a        (a        )    ,
            .b        (b        )    ,
            .choice   (choice   )    ,
            .out      (out      )   );
       
 integer i;
      
initial
    begin
    for(i=0;i<32;i=i+1)
    begin
    choice = {$random}%8 ;
    a = {$random}%2 ;
    b = {$random}%2 ;
    #10;
    end
    
    $finish(0);
    end

initial
    begin
    $monitor("a=%b b=%b choice = %d out = %b ",a,b,choice,out);
    end
endmodule
