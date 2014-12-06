library verilog;
use verilog.vl_types.all;
entity read is
    port(
        instru          : in     vl_logic_vector(31 downto 0);
        data_a          : out    vl_logic_vector(31 downto 0);
        data_b          : out    vl_logic_vector(31 downto 0)
    );
end read;
