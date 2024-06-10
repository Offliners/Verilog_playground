`timescale 1ns/10ps
`include "PATTERN.v"
`include "FA_1bit.v"

module TESTBED();

wire a;
wire b;
wire cin;
wire sum;
wire carry;

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, TESTBED);
end

FA_1bit DUT_FA_1bit(
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