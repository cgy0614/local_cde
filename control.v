module control(instru,Jump,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0);
   output Jump,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0;
   input [31:0] instru;
   
   reg Jump,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0;
   reg [9:0]  identify;
   always@(instru)
   begin
   Jump<=identify[9];
   RegDst<=identify[8];
   ALUSrc<=identify[7];
   MemtoReg<=identify[6];
   RegWrite<=identify[5];
   MemRead<=identify[4];
   MemWrite<=identify[3];
   Branch<=identify[2];
   ALUOp1<=identify[1];
   ALUOp0<=identify[0];
   
   identify<=10'b0000000000;//clear to 0

   case(instru[31:26])
	 6'b000000: identify<=10'b0100100010;//R-type
	 6'b100011: identify<=10'b0011110000;//load
	 6'b101011: identify<=10'b0X1X001000;//store
	 6'b000100: identify<=10'b0X0X000101;//beq
	 6'b000010: identify<=10'b1XXXXXXXXX;//jump
	 6'b000011: identify<=10'b1XXX1XXXXX;//jal
	 6'b000100: identify<=10'b01XX1XX0XX;//jr
	 default:   identify<=10'b0000000000;//suppose identify is 0
   endcase 
   end
endmodule 
