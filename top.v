module top(instru,clk,rst,read, rx, reset,rxdata,write);

   input [31:0] instru;
   input  clk,rst;
   input       read;			
   input	      rx;		  	wire rx; 
   input	      reset;		
   input       write;
   
     wire tx;
   
   output [7:0] rxdata; wire [7:0]rxdata;
  
   reg [7:0]data;
   
  wire [31:0] pc,pc_out,pc_in,pc_temp;
   reg [31:0] address_load,address_store;
   reg [31:0]  mem[31:0];
   wire [31:0]  data_out,data_in;
   
 
 
   wire [31:0]     data_a,data_b;
   wire     Jump,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0;
  control control_0(instru,Jump,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0);
	read read_0(instru,data_a,data_b);//two steps for every instruction 
	//AlU alu2(data_a,data_b,instru,zero_out,data_out,instru,clk,rst);
	jr jr2(pc,Jump,RegDst,RegWrite,Branch,data_a,instru,clk,rst);
	jal jal2(pc_out,data_in,instru,pc_in,Jump,RegWrite,clk,rst);
	j j2(Jump,instru,pc_in,pc_out,pc_temp,clk,rst);
	beq beq2(pc_out,pc_in,instru,Jump,ALUSrc,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0,clk,rst);
	
	always@(data_a)
	begin
	data=data_a[7:0];
	end
	
	
	uart uu(clk, read, rx, reset,rxdata,write,tx,data);
		
	  
endmodule // top
