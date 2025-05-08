module Divider (
    input [7:0] Dividend,
    input [7:0] Divisor,
    output reg [7:0] Quotient
);
    reg [15:0] Remainder;
    integer i;

    always @(*) begin
        if (Divisor == 8'b0) begin
            Quotient = 8'b0; 
        end else begin
            Remainder = {8'b0, Dividend};
            Quotient = 8'b0;

            for (i = 0; i < 8; i = i + 1) begin
                Remainder = Remainder << 1;

                if (Remainder[15:8] >= Divisor) begin
                    Remainder[15:8] = Remainder[15:8] - Divisor;
                    Quotient = (Quotient << 1) | 1'b1;
                end else begin
                    Quotient = Quotient << 1;
                end
            end
        end
    end
endmodule

