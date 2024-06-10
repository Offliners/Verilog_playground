`timescale 1ns/10ps
`include "PATTERN.v"
`include "FA_4bits.v"

module TESTBED();

wire [3:0] a;
wire [3:0] b;
wire cin;
wire [3:0] sum;
wire carry;

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, TESTBED);
end

FA_4bits DUT_FA_4bits(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
);

PATTERN I_PATTERN(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
);

endmodule