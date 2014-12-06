library verilog;
use verilog.vl_types.all;
entity beq is
    port(
        pc_out          : out    vl_logic_vector(31 downto 0);
        pc_in           : in     vl_logic_vector(31 downto 0);
        instru          : in     vl_logic_vector(31 downto 0);
        Jump            : in     vl_logic;
        ALUSrc          : in     vl_logic;
        RegWrite        : in     vl_logic;
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        Branch          : in     vl_logic;
        ALUOp1          : in     vl_logic;
        ALUOp0          : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end beq;
