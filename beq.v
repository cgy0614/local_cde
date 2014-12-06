module beq(pc_out,pc_in,instru,Jump,ALUSrc,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0,clk,rst);                                                                                                                                                                             
   input [31:0] pc_in,instru;
   input 		Jump,ALUSrc,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0,clk,rst;
   output[31:0] pc_out;

   reg [31:0] 	 pc_out;
   reg [17:0] 	 pc_temp;//temp for shift pc
   wire[31:0] 	 instru, pc_in;
   reg [4:0]    rs,rt;
   reg [31:0]   a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
   reg zero;
   wire Jump,ALUSrc,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0;
   
   
 	always@(clk or rst)
		if(rst==1)
		  pc_out=0;
		  else
  if((instru[31:26]==6'b000100)&&rst==0)
  begin
  begin
  a0=4'b0000;
  a1=4'b0001;
  a2=4'b0010;
  a3=4'b0011;
  a4=4'b0100;
  a5=4'b0101;
  a6=4'b0110;
  a7=4'b0111;
  a8=4'b1000;
  a9=4'b1001;
  a10=4'b1010;
  a11=4'b1011;
  a12=4'b1100;
  a13=4'b1101;
  a14=4'b1110;
  a15=4'b1111;
  rs=01000;
  rt=01000;
	  //zero=beqALU(rs,rt);//judge pc jump to where
	  zero=1'b1;
   if (zero&&(!Jump)&&(!ALUSrc)&&(!RegWrite)&&(!MemRead)&&(!MemWrite)&&Branch&&(!ALUOp1)&&ALUOp0)
	 begin
		pc_temp={14'b0,instru[15:0],2'b0};
		pc_out=pc_temp+pc_in+4;
		
	 end
   
   else
	 pc_out=pc_in+4;
  end
  end
  else
  pc_out=pc_in;
function beqALU;
  input[4:0] rs,rt;
  reg[4:0] temp1,temp2;

  
  begin
  case(rs)
    5'b01000:temp1=a0;
    5'b01001:temp1=a1;
    5'b01010:temp1=a2;
    5'b01011:temp1=a3;
    5'b01100:temp1=a4;
    5'b01101:temp1=a5;
    5'b01110:temp1=a6;
    5'b01111:temp1=a7;
    5'b10000:temp1=a8;
    5'b10001:temp1=a9;
    5'b10010:temp1=a10;
    5'b10011:temp1=a11;
    5'b10100:temp1=a12;
    5'b10101:temp1=a13;
    5'b10110:temp1=a14;
    5'b10111:temp1=a15;
    //different rs point to different registers
  endcase
  case(rt)
    5'b01000:temp1=a0;
    5'b01001:temp1=a1;
    5'b01010:temp1=a2;
    5'b01011:temp1=a3;
    5'b01100:temp1=a4;
    5'b01101:temp1=a5;
    5'b01110:temp1=a6;
    5'b01111:temp1=a7;
    5'b10000:temp1=a8;
    5'b10001:temp1=a9;
    5'b10010:temp1=a10;
    5'b10011:temp1=a11;
    5'b10100:temp1=a12;
    5'b10101:temp1=a13;
    5'b10110:temp1=a14;
    5'b10111:temp1=a15;
  endcase
    //different rt point to different registers
if(temp1==temp2)
beqALU=1;
else
beqALU=0;
end
endfunction

   
endmodule // beq
