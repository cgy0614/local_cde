library verilog;
use verilog.vl_types.all;
entity jr is
    port(
        pc              : out    vl_logic_vector(31 downto 0);
        Jump            : in     vl_logic;
        RegDst          : in     vl_logic;
        RegWrite        : in     vl_logic;
        Branch          : in     vl_logic;
        data_a          : in     vl_logic_vector(31 downto 0);
        instru          : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end jr;
