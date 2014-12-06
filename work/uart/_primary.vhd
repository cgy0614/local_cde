library verilog;
use verilog.vl_types.all;
entity uart is
    port(
        clk             : in     vl_logic;
        read            : in     vl_logic;
        rx              : in     vl_logic;
        reset           : in     vl_logic;
        rxdata          : out    vl_logic_vector(7 downto 0);
        write           : in     vl_logic;
        tx              : out    vl_logic;
        data            : in     vl_logic_vector(7 downto 0)
    );
end uart;
