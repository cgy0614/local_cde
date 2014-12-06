module read(instru,data_a,data_b);
   input [31:0] instru;
   output [31:0] data_a,data_b;
   reg [31:0] data_a, data_b;
   reg [31:0] 	s0=32'haaaaaaaa,s1=32'haaaaaaaa,s2=32'haaaaaaaa,s3=32'haaaaaaaa,s4=32'haaaaaaaa,s5=32'haaaaaaaa,s6=32'haaaaaaaa,s7=32'haaaaaaaa,t0=32'haaaaaaaa,t1=32'haaaaaaaa,t2=32'haaaaaaaa,t3=32'haaaaaaaa,t4=32'haaaaaaaa,t5=32'haaaaaaaa,t6=32'haaaaaaaa,t7=32'haaaaaaaa,ra=32'haaaaaaaa;
always@(instru)
  begin
   case(instru[25:21])
         5'b01000: data_a=t0 ;
         5'b01001: data_a=t1 ;
         5'b01010: data_a=t2 ;
         5'b01011: data_a=t3 ;
         5'b01100: data_a=t4 ;
         5'b01101: data_a=t5 ;
         5'b01110: data_a=t6 ;
         5'b01111: data_a=t7 ;
         5'b10000: data_a=s0 ;
         5'b10001: data_a=s1 ;
         5'b10010: data_a=s2 ;
         5'b10011: data_a=s3 ;
         5'b10100: data_a=s4 ;
         5'b10101: data_a=s5 ;
         5'b10110: data_a=s6 ;
         5'b10111: data_a=s7 ;

	
   endcase // case(instru[25:21])
   	 
      case(instru[20:16])
         5'b01000: data_b=t0 ;
         5'b01001: data_b=t1 ;
         5'b01010: data_b=t2 ;
         5'b01011: data_b=t3 ;
         5'b01100: data_b=t4 ;
         5'b01101: data_b=t5 ;
         5'b01110: data_b=t6 ;
         5'b01111: data_b=t7 ;
         5'b10000: data_b=s0 ;
         5'b10001: data_b=s1 ;
         5'b10010: data_b=s2 ;
         5'b10011: data_b=s3 ;
         5'b10100: data_b=s4 ;
         5'b10101: data_b=s5 ;
         5'b10110: data_b=s6 ;
         5'b10111: data_b=s7 ;

	  endcase // case(instru[20:16])
	  
      
   end
		endmodule 

