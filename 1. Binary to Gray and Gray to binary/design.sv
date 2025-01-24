// Code your design here
`include "bin_grey.v"
`include "grey_bin.v"
module top#(parameter size = 10)(input wire [size-1 : 0] data_in,
                                 output wire [size-1 : 0] data_out);
  
  
  wire [size-1:0] temp;
  
  nbtg #(.size(size))in0 (
            .data_in(data_in),
            .data_out(temp));
  
  ngtb #(.size(size))in1 (
           .data_in(temp),
           .data_out(data_out));
  
endmodule 