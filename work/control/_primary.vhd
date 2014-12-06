library verilog;
use verilog.vl_types.all;
entity control is
    port(
        instru          : in     vl_logic_vector(31 downto 0);
        Jump            : out    vl_logic;
        RegDst          : out    vl_logic;
        ALUSrc          : out    vl_logic;
        MemtoReg        : out    vl_logic;
        RegWrite        : out    vl_logic;
        MemRead         : out    vl_logic;
        MemWrite        : out    vl_logic;
        Branch          : out    vl_logic;
        ALUOp1          : out    vl_logic;
        ALUOp0          : out    vl_logic
    );
end control;
