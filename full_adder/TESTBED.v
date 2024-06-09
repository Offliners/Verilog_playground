`timescale 1ns/10ps
`include "PATTERN.v"
`include "FA.v"

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

FA DUT_FA(
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