// Code your design here
`timescale 1ns / 1ps

module nbtg#( parameter size = 4)( input wire [size-1:0] data_in ,
            output wire [size-1:0] data_out );


genvar i;
  
	assign  data_out[size-1] = data_in[size-1];	   
  
  generate 
    for(i=size-2;i>=0;i=i-1'b1)
      begin
        assign data_out[i] = data_in[i] ^ data_in[i+1] ; 
      end
  endgenerate
  
endmodule 

