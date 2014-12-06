module store_read(clk,rst);

input clk,rst;

wire [31:0] pc0;
wire [31:0] ins_out0;
wire ctrl1,ctrl2;
wire [31:0] readdata1,readata2;
wire [31:0] writedata0;
wire [31:0] sign_out0;
wire [31:0] ALU_out0;

pc U0(clk,rst,pc0);
ins_mem U1(pc0,ins_out0);
ctrl U2(ins_out0,ctrl1,ctrl2);
mem_gather U3(ctrl1,ins_out0,writedata0,raeddata1,readdata2);
signextra U4(ins_out0,sign_out0);
Alu U5(readdata1,readadata2,ALU_out0);
data_mem U6(ctrl1,ctrl2,ALU_out0,readata2,writedata0);

endmodule