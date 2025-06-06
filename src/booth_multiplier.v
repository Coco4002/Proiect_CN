//BOOTH RADIX 2
module BoothMultiplier (
    input [7:0] A, B,
    output reg [15:0] Product
);
    reg [15:0] A_ext;     
    reg [15:0] P;         
    reg Q_1;              
    integer i;

    always @(*) begin
        A_ext = {{8{A[7]}}, A};   
        P = {8'b0, B};        
        Q_1 = 1'b0;

        for (i = 0; i < 8; i = i + 1) begin
            case ({P[0], Q_1})
                2'b01: P[15:8] = P[15:8] + A_ext;
                2'b10: P[15:8] = P[15:8] - A_ext;
                default: ; 
            endcase

            {P, Q_1} = $signed({P, Q_1}) >>> 1;  
        end

        Product = P;
    end
endmodule