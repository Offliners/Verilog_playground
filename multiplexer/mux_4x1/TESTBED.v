`timescale 1ns/10ps
`include "PATTERN.v"
`include "MUX_4x1.v"

module TESTBED #(parameter WIDTH=32)();

wire [WIDTH-1:0] in0, in1, in2, in3;
wire [1:0] select;
wire [WIDTH-1:0] out;

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, TESTBED);
end

MUX_4x1 #(.WIDTH(WIDTH)) DUT_MUX_4x1(
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .select(select),
    .out(out)
);

PATTERN  #(.WIDTH(WIDTH)) I_PATTERN(
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .select(select),
    .out(out)
);

endmodule