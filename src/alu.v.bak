module ALU (
    input [7:0] A, B,
    input [2:0] Op,
    output [15:0] Result,
    output Overflow
);
    wire [7:0] sum, diff, quot;
    wire [15:0] prod;
    wire carry_out;

    wire [15:0] sum_ext, diff_ext, quot_ext;

    Adder adder (.A(A), .B(B), .Cin(1'b0), .Sum(sum), .Cout(carry_out));
    Subtractor subtractor (.A(A), .B(B), .Diff(diff));
    BoothMultiplier multiplier (.A(A), .B(B), .Product(prod));
    Divider divider (.Dividend(A), .Divisor(B), .Quotient(quot));

    assign sum_ext = {8'b0, sum};
    assign diff_ext = {{8{diff[7]}}, diff}; // semn extins corect
    assign quot_ext = {8'b0, quot};

    assign Result = (Op == 3'b000) ? sum_ext :
                    (Op == 3'b001) ? diff_ext :
                    (Op == 3'b010) ? prod :
                    (Op == 3'b011) ? quot_ext :
                    16'b0;

    assign Overflow = (Op == 3'b000) ? carry_out : 1'b0;
endmodule