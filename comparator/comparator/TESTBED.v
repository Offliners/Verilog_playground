`timescale 1ns/10ps
`include "PATTERN.v"
`include "CMP.v"

module TESTBED #(parameter WIDTH=32)();

wire [WIDTH-1:0] a, b;
wire [WIDTH-1:0] out_small, out_big;

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, TESTBED);
end

CMP #(.WIDTH(WIDTH)) DUT_CMP(
    .a(a),
    .b(b),
    .out_small(out_small),
    .out_big(out_big)
);

PATTERN  #(.WIDTH(WIDTH)) I_PATTERN(
    .a(a),
    .b(b),
    .out_small(out_small),
    .out_big(out_big)
);

endmodule