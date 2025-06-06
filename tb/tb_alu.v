`timescale 10ps / 1ps

module ALU_tb;
    reg [7:0] A, B;
    reg [2:0] Op;
    wire [15:0] Result;
    wire Overflow;

    ALU uut (
        .A(A),
        .B(B),
        .Op(Op),
        .Result(Result),
        .Overflow(Overflow)
    );

    initial begin
        $display("Test\tA\tB\tOp\tResult\t\tOverflow");
        $monitor("%0dns\t%d\t%d\t%b\t%d\t%b", $time, A, B, Op, $signed(Result), Overflow);

        A = 8'd12; B = 8'd3; Op = 3'b000; #10;
        A = 8'd12; B = 8'd3; Op = 3'b001; #10;
        A = 8'd6; B = 8'd2;  Op = 3'b010; #10;
        A = 8'd20; B = 8'd4; Op = 3'b011; #10;
    end
endmodule
