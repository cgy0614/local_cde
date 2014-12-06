module ALU(input1,input2, zero,out,instru,clk,rst);
input [31:0] input1,input2,instru;
reg [3:0] control;
input clk,rst;
output zero;
output [31:0] out;
reg [31:0] out; 
assign  zero=(out)?1'b0:1'b1;
always@(clk)
if((instru[31:26]==6'b000000)&&rst==0)
    begin
      case(control)
        32'b0000:out<=input1&input2;
        32'b0001:out<=input1|input2;
        32'b0010:out<=input1+input2;
        32'b0110:out<=input1-input2;
        32'b0111:out<=(input1<input2)?1:0;
        default:out<=32'b0;
      endcase
    end
else
out<=out;
endmodule
