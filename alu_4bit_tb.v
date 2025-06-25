`timescale 1ns / 1ps
module alu_4bit_tb;
    // Testbench signals
    reg [3:0] a, b;
    reg [2:0] opcode;
    wire [3:0] result;
    wire cout, zero, overflow;

    // Instantiate the ALU
    alu_4bit dut (
        .opcode(opcode),
        .a(a),
        .b(b),
        .result(result),
        .cout(cout),
        .zero(zero),
        .overflow(overflow)
    );

    // Stimulus
    initial begin
        // Initialize inputs
        a = 4'b0000;
        b = 4'b0000;
        opcode = 3'b000;

        // Test cases
        #10 a = 4'b1010; b = 4'b0101; opcode = 3'b000; // ADD: 1010 + 0101
        #10 opcode = 3'b001;                           // SUB: 1010 - 0101
        #10 opcode = 3'b010;                           // AND: 1010 & 0101
        #10 opcode = 3'b011;                           // OR:  1010 | 0101
        #10 opcode = 3'b100;                           // XOR: 1010 ^ 0101
        #10 a = 4'b1111; b = 4'b1111; opcode = 3'b000; // ADD: 1111 + 1111 (test overflow)
        #10 opcode = 3'b001;                           // SUB: 1111 - 1111 (test zero)
        #10 $finish;                                   // End simulation
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | A=%b | B=%b | Opcode=%b | Result=%b | Cout=%b | Zero=%b | Overflow=%b", 
                 $time, a, b, opcode, result, cout, zero, overflow);
    end
endmodule