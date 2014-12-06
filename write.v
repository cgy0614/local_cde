module write(instru,data_in);
   input [31:0] instru,data_in;
   wire [31:0] instru,data_in;
   reg [31:0] 	s0,s1,s2,s3,s4,s5,s6,s7,t0,t1,t2,t3,t4,t5,t6,t7,ra;
   	  always@(instru)
    case(instru[15:11])
         5'b01000: t0=data_in ;
         5'b01001: t1=data_in ;
         5'b01010: t2=data_in ;
         5'b01011: t3=data_in ;
         5'b01100: t4=data_in ;
         5'b01101: t5=data_in ;
         5'b01110: t6=data_in ;
         5'b01111: t7=data_in ;
         5'b10000: s0=data_in ;
         5'b10001: s1=data_in ;
         5'b10010: s2=data_in ;
         5'b10011: s3=data_in ;
         5'b10100: s4=data_in ;
         5'b10101: s5=data_in ;
         5'b10110: s6=data_in ;
         5'b10111: s7=data_in ;
         5'b11111: ra=data_in ;
         
		endcase
		
	  endmodule 
