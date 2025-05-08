module BoothMultiplier (
    input [7:0] A, B,
    output reg [15:0] Product
);
    reg [15:0] multiplicand;
    reg [15:0] product_reg;
    reg [7:0] multiplier;
    integer i;

    always @(*) begin
        multiplicand = {8'b0, A};
        multiplier = B;
        product_reg = 16'b0;

        for (i = 0; i < 8; i = i + 1) begin
            if (multiplier[0] == 1'b1)
                product_reg = product_reg + multiplicand;
            multiplicand = multiplicand << 1;
            multiplier = multiplier >> 1;
        end
        Product = product_reg;
    end
endmodule