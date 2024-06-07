`timescale 1ns/10ps
`include "PATTERN.v"
`include "HA.v"

module TESTBED();

wire a;
wire b;
wire sum;
wire carry;

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, TESTBED);
end

HA DUT_HA(
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);

PATTERN I_PATTERN(
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);

endmodule