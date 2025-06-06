module Subtractor (
    input [7:0] A, B,
    output [7:0] Diff
);
    wire [7:0] B_inv;
    wire [7:0] temp_sum;
    wire carry;

    assign B_inv = ~B;
    Adder add_sub (.A(A), .B(B_inv), .Cin(1'b1), .Sum(temp_sum), .Cout(carry));
    assign Diff = temp_sum;
endmodule