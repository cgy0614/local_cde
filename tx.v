module tx(clk,write,reset,tx,data);
input clk;
input reset;
input write;
input [7:0]data;

output tx;reg tx;


reg [7:0] thr; 
reg [7:0] tsr;
reg [2:0] cnt;
reg [3:0] state;
reg txclk;
reg txdone,txdone1,write1,write2;
reg datardy;


//write ????????
always@(write or data)
	if(write)
	  begin 
	  thr=data;

	  end

//???????????1/16
always@(posedge clk or posedge reset)
if(reset)
  begin
  txclk <=1'b0;
  cnt <=3'b000;
  end
else
  begin
  if(cnt ==3'b000)
	txclk = !txclk;

	cnt <= cnt +1;
  end 
 always @(posedge clk or posedge reset)
if (reset) 
	begin
	datardy <= 1'b1;
	write2 <= 1'b1;
	write1 <= 1'b1;		
	txdone1 <= 1'b1;		            // Set equal to txdone at reset.
	end
else
	begin
	if (write1 &&  !write2)
	   datardy  <= 1'b0;           // At risign edge of write, new data are latched in thr, and txdatardy are set.

	else if (!txdone &&  txdone1)
	     	datardy  <= 1'b1;			// At falling edge of txdone, the thr has been loaded into tsr, so txdatardy are reset.

	// Generate delayed versions of write and txdone signals for edge detection.
	write2 <= write1;
	write1 <= write;
	txdone1 <= txdone;
	end 

//?????tx??
always@(posedge txclk or posedge reset)
if(reset)
  begin
  state = 4'b0000;
  txdone= 1'b1;

  end
else if(write&&datardy)
  case(state)
  4'b0000: begin state=4'b0001; tsr=thr;tx=1'b0; txdone= 1'b0; end
  4'b0001: begin state=4'b0010; tx=tsr[0];tsr=tsr>>1; end
  4'b0010: begin state=4'b0011; tx=tsr[0];tsr=tsr>>1; end
  4'b0011: begin state=4'b0100; tx=tsr[0];tsr=tsr>>1; end
  4'b0100: begin state=4'b0101; tx=tsr[0];tsr=tsr>>1; end
  4'b0101: begin state=4'b0110; tx=tsr[0];tsr=tsr>>1; end
  4'b0110: begin state=4'b0111; tx=tsr[0];tsr=tsr>>1; end
  4'b0111: begin state=4'b1000; tx=tsr[0];tsr=tsr>>1; end
  4'b1000: begin state=4'b1001; tx=tsr[0]; end 
  4'b1001: begin state=4'b0000;txdone=1'b1;    tx=1'b1;    end 
  endcase

 
endmodule
