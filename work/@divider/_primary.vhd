library verilog;
use verilog.vl_types.all;
entity Divider is
    port(
        Dividend        : in     vl_logic_vector(7 downto 0);
        Divisor         : in     vl_logic_vector(7 downto 0);
        Quotient        : out    vl_logic_vector(7 downto 0)
    );
end Divider;
