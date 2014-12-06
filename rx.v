module rx (clk, read, rx, reset,rxdata);


input         clk;		// Input clock, 16 x baudrate clock used for synchronisation.
input         read;			// Read strobe.
input	      rx;		  	// Receive input line.  
input	      reset;		// Global Reset.

// 8 bit latched output data bus.
output      [7:0] rxdata;		reg 	[7:0]rxdata;	   // 8 bit output data bus

reg [3:0] rcnt;
reg       rxclk;
reg [7:0] rsr;
reg [3:0] rstate;
reg       rxstop;
reg       rxrdy;


always@(posedge clk or posedge reset)
   begin
     if(reset)
       rcnt <= 4'b0001;
     else if(read)
          rcnt <= rcnt + 1;
     else
          rcnt <= 4'b0001;
     
    
   end
   
always@(posedge clk or posedge reset)
   begin
       if(reset)
    rxclk <= 1'b0;
    else
     rxclk <= rcnt[3];
   end

always@(posedge rxclk or posedge reset)
   if(reset)
     begin
     rsr  =  8'hff;
     rxrdy = 1'b1;
     rxstop = 1'b0;
     rxdata = 4'b1111;
     end
   else if(read && !rxrdy)
     case(rstate)
     4'b0000 :begin rsr[7] =rx; rsr =rsr>>1;rstate =4'b0001;end
     4'b0001 :begin rsr[7] =rx; rsr =rsr>>1;rstate =4'b0010;end
     4'b0010 :begin rsr[7] =rx; rsr =rsr>>1;rstate =4'b0011;end
     4'b0011 :begin rsr[7] =rx; rsr =rsr>>1;rstate =4'b0100;end
     4'b0100 :begin rsr[7] =rx; rsr =rsr>>1;rstate =4'b0101;end
     4'b0101 :begin rsr[7] =rx; rsr =rsr>>1;rstate =4'b0110;end
     4'b0110 :begin rsr[7] =rx; rsr =rsr>>1;rstate =4'b0111;end
     4'b0111 :begin rsr[7] =rx; rstate =4'b1000;            end
     4'b1000 :begin rxstop = rx; if(rxstop) begin rxrdy =1'b1; rxdata = rsr; rstate =4'b0000; end      end
     endcase
   else
     begin
     rxrdy = rx;
     rstate = 4'b0000;
     rxstop = 1'b0;
     end 

endmodule
