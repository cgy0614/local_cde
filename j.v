module j(Jump,instru,pc_in,pc_out,pc_temp,clk,rst);
   output [31:0]pc_out;
   output [27:0]pc_temp; 
   input Jump,clk,rst;
   input [31:0]instru,pc_in;
   
   wire [31:0]		instru,pc_in;
   reg [31:0] 		pc_out; 
   reg [27:0] pc_temp;
  
		always@(clk or rst)
		if(rst==1)
		  pc_out=0;
		  else
		  if((instru[31:26]==6'b000010)&&rst==0)
		  begin
			 if(Jump)
			   begin
			 pc_out<=pc_in + 4'd4;
			 pc_temp=instru[25:0]<<2;    
			 pc_out[27:0]<=pc_temp; 
			   end
		  end
		  else
		  pc_out<=pc_in;
   
		  endmodule // jump
