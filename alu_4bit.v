
module alu_4bit (
    input [3:0] opcode,        // Operation select
    input [3:0] a, b,          // 4-bit inputs
    output reg [3:0] result,   // 4-bit result
    output reg cout,           // Carry-out
    output reg zero,           // Zero flag
    output reg overflow        // Overflow flag
);
    // Internal signals
    wire [3:0] sum;
    wire c_out;

    // Adder/Subtractor using a single adder
    assign sum = (opcode == 3'b001) ? a + (~b + 1) : a + b; // Subtraction: a - b = a + (~b + 1)
    assign c_out = (opcode == 3'b001 || opcode == 3'b000) ? (a[3] & b[3]) | (b[3] & sum[3]) | (a[3] & sum[3]) : 1'b0;

    always @(*) begin
        // Default values
        result = 4'b0000;
        cout = 1'b0;
        zero = 1'b0;
        overflow = 1'b0;

        case (opcode)
            3'b000: begin // ADD
                result = sum;
                cout = c_out;
                overflow = (a[3] == b[3]) && (sum[3] != a[3]);
            end
            3'b001: begin // SUB
                result = sum;
                cout = c_out;
                overflow = (a[3] != b[3]) && (sum[3] != a[3]);
            end
            3'b010: result = a & b; // AND
            3'b011: result = a | b; // OR
            3'b100: result = a ^ b; // XOR
            default: result = 4'b0000; // Default case
        endcase

        // Zero flag
        zero = (result == 4'b0000) ? 1'b1 : 1'b0;
    end
endmodule