`timescale 1ns/10ps
`include "PATTERN.v"
`include "REVERSE.v"

module TESTBED #(parameter WIDTH=32)() ;

wire [WIDTH-1:0] in;
wire [WIDTH-1:0] out;

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, TESTBED);
end

REVERSE REVERSE_DFF(
    .in(in),
    .out(out)
);

PATTERN I_PATTERN(
    .in(in),
    .out(out)
);

endmodule