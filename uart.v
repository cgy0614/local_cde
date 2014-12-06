`include "tx.v"
`include "rx.v"

module uart(clk, read, rx, reset,rxdata,write,tx,data);
  
   input		     clk; 
   input       read;			
   input	      rx;		  	wire rx; 
   input	      reset;		
   input       write;
   
   output      tx;    wire tx;
   input  [7:0] data;
   output [7:0] rxdata; wire [7:0]rxdata;
   
   
   tx tx_1(clk,write,reset,tx,data);
   rx rx_1 (clk, read, rx, reset,rxdata);
   
  // assign 		data = !read ? rxdata : 8'bzzzzzzzz;
endmodule
   
    