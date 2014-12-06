module jr(pc,Jump,RegDst,RegWrite,Branch,data_a,instru,clk,rst);
   input data_a;
   input [31:0]instru;
   input Jump,RegDst,RegWrite,Branch,clk,rst;
   output pc;
   reg [31:0]  pc;

   wire  [31:0]data_a;
   
   read u0(instru,data_a,);
  
   	always@(clk or rst)
		if(rst==1)
		  pc=0;
		  else
   if((instru[31:26]==6'b000100)&&rst==0)
   begin
	if((!Jump)&&RegDst&&RegWrite&&(!Branch))
	 begin
	    pc=data_a;	  
    end
   end
   
  
endmodule
