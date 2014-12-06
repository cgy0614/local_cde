library verilog;
use verilog.vl_types.all;
entity write is
    port(
        instru          : in     vl_logic_vector(31 downto 0);
        data_in         : in     vl_logic_vector(31 downto 0)
    );
end write;
