library verilog;
use verilog.vl_types.all;
entity top is
    port(
        instru          : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        read            : in     vl_logic;
        rx              : in     vl_logic;
        reset           : in     vl_logic;
        rxdata          : out    vl_logic_vector(7 downto 0);
        write           : in     vl_logic
    );
end top;
