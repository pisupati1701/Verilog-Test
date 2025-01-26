`timescale 1ns / 1ps
module compute( input [8:0] a,
                input [7:0] q,
                input [8:0] m,
                input enable,
                output reg [7:0] qout,
                output reg [8:0] aout 
               );
       reg [8:0] an;
      always@*
      begin
       if(enable)
       begin 
        {aout,qout} = {a,q} << 1'b1;
         an = aout + ~m + 1'b1;
         if(an[8]) 
            begin
                qout = {qout[7:1],1'b0};
                aout = aout; 
            end
         else 
            begin
                qout = {qout[7:1], 1'b1};
                aout = an; 
            end   
      end
      else 
      begin
                qout = qout;
                aout = aout;
      end
      end
                    
               
endmodule
