library verilog;
use verilog.vl_types.all;
entity j is
    port(
        Jump            : in     vl_logic;
        instru          : in     vl_logic_vector(31 downto 0);
        pc_in           : in     vl_logic_vector(31 downto 0);
        pc_out          : out    vl_logic_vector(31 downto 0);
        pc_temp         : out    vl_logic_vector(27 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end j;
