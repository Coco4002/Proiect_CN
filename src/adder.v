module Adder (
    input [7:0] A, B,
    input Cin,
    output [7:0] Sum,
    output Cout
);
    wire [7:0] carry;

    full_adder fa0 (A[0], B[0], Cin, Sum[0], carry[0]);
    full_adder fa1 (A[1], B[1], carry[0], Sum[1], carry[1]);
    full_adder fa2 (A[2], B[2], carry[1], Sum[2], carry[2]);
    full_adder fa3 (A[3], B[3], carry[2], Sum[3], carry[3]);
    full_adder fa4 (A[4], B[4], carry[3], Sum[4], carry[4]);
    full_adder fa5 (A[5], B[5], carry[4], Sum[5], carry[5]);
    full_adder fa6 (A[6], B[6], carry[5], Sum[6], carry[6]);
    full_adder fa7 (A[7], B[7], carry[6], Sum[7], Cout);
endmodule

module full_adder (
    input A, B, Cin,
    output Sum, Cout
);
    wire s1, c1, c2;

    xor (s1, A, B);
    xor (Sum, s1, Cin);

    and (c1, A, B);
    and (c2, s1, Cin);
    or  (Cout, c1, c2);
endmodule