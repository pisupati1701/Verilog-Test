`timescale 1ns / 1ps
module Recursive_Division(
    input clk,resetn,
    input [7:0] dividend,
    input [8:0] divisor,
    input data_en,
    output reg [7:0] quotient,
    output reg [8:0] remainder
    );
    
    //Load the inputs 
    reg [8:0] m;
    reg [8:0] a;
    reg [7:0] q;
    reg enable;    
    reg [3:0] count;
    
    reg [8:0] a_in;
    reg [7:0] q_in;
    reg [8:0] m_in;
    reg enable_in;
    wire [7:0] qout;
    wire [8:0] aout;
    
    compute Cp(a_in,q_in,m_in,enable_in,qout,aout);
    
    
    always@(posedge clk or negedge resetn)
    begin
        if(!resetn)
            begin
                m        <= 9'h00;
                a        <= 9'h00;
                q        <= 8'h00;
                quotient <= 8'h00;
                remainder<= 9'h00;
                enable   <= 0;
            end
       else if(data_en) // load the data 
            begin
                m        <= divisor;
                a        <= 9'h00;
                q        <= dividend;
                enable   <= 1'b1;           
            end
      else if(count == 1)
      begin 
                a_in <= a;
                q_in <= q;
                m_in <= m;
                enable_in <= 1'b1;
      end
      else if(count > 1 && count <9)
      begin 
                a_in <= aout;
                q_in <= qout;
                m_in <= m;
                enable_in <= 1'b1;
      end
      else if(count == 9)
      begin
                quotient  <= qout;
                remainder <= aout; 
      end
      else  begin
                m        <= m;
                a        <= a;
                q        <= q;
                enable  <= enable;                           
            end
      end
      

      always@(posedge clk or negedge resetn)
      begin
        if(!resetn)
            begin
                count <= 4'h0;    
            end
        else if(count == 9)
             begin
               count <= 4'h0;  
             end
        else if(enable)
            begin
                count <= count + 1'b1;
            end
       else 
           begin
               count <= count;     
           end     
      end
endmodule
