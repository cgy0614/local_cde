library verilog;
use verilog.vl_types.all;
entity tx is
    port(
        clk             : in     vl_logic;
        write           : in     vl_logic;
        reset           : in     vl_logic;
        tx              : out    vl_logic;
        data            : in     vl_logic_vector(7 downto 0)
    );
end tx;
