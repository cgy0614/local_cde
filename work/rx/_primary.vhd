library verilog;
use verilog.vl_types.all;
entity rx is
    port(
        clk             : in     vl_logic;
        read            : in     vl_logic;
        rx              : in     vl_logic;
        reset           : in     vl_logic;
        rxdata          : out    vl_logic_vector(7 downto 0)
    );
end rx;
