library verilog;
use verilog.vl_types.all;
entity Subtractor is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        Diff            : out    vl_logic_vector(7 downto 0)
    );
end Subtractor;
