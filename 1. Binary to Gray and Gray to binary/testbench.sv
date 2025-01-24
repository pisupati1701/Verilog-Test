// Code your testbench here
// or browse Examples
module tb ;
  
parameter size = 10 ;
  reg [size-1:0] data_in ;
  wire [size-1:0] data_out ;
  
  top #(size)DUV (.data_in(data_in),
           .data_out(data_out));
  
   
  initial
    begin
      data_in = 15;
      #10;
      data_in = 8;
      #10;
      data_in = 6;
      #10;
      $finish(0);
    end
  initial
    begin 
        $dumpfile("test.vcd");
      $dumpvars(2);
    end
  
  initial
    begin
      $monitor("data_in = %b data_out = %b ",data_in,data_out);
    end
endmodule 
 