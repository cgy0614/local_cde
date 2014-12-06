module jal(pc_out,data_in,instru,pc_in,Jump,RegWrite,clk,rst);

   input[31:0] pc_in,instru;
   input 	   Jump,RegWrite,clk,rst;
   output[31:0] pc_out,data_in;
   reg [31:0] 	pc_out,data_in;
   wire RegWrite,Jump;
   wire [31:0] pc_in,instru;
   
   	always@(clk or rst)
		if(rst==1)
		  pc_out=0;
		  else
    if((instru[31:26]==6'b000011)&&rst==0)
	 begin
		if(RegWrite&&Jump)
			begin	 
			   data_in<=pc_in+4'd4;
			   pc_out[31:28]<=data_in[31:28];
			   pc_out[27:0]<=instru[25:0]<<2;
		end
	 end

	 else
	 pc_out<=pc_out;

write u1(instru,data_in);
endmodule 
