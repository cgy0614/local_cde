module stimulus;
  
  reg clk,reset,write,read,rst;
  reg [31:0] instru;
  
  
  
 
  
  
top t1(instru,clk,rst,read, , reset,,write);

  initial
  begin
       reset = 1'b1;
       rst=1'b1;
       
       #34 reset = 1'b0;
       #30 rst=1'b0;
       
  end
  
  initial
  begin
       clk = 1'b0;
       forever #10 clk = ~clk;
  end  
     
  initial
  begin
      write = 1'b0;
      #50 write = 1'b1;
    end
    initial
    begin
      read = 1'b0;
     
    end
    
  initial 
   begin
      instru =32'b10001101000010000100010101010101;
      #6000   instru =32'b10001101000010000100010101011111;
     
    end
    
    initial
    begin
      #15000 $stop;
    end
    
  endmodule  
