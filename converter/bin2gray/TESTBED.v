`timescale 1ns/10ps
`include "PATTERN.v"
`include "BIN2GRAY.v"

module TESTBED #(parameter WIDTH=32)();

wire [WIDTH-1:0] bin_in;
wire [WIDTH-1:0] gray_out;

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, TESTBED);
end

BIN2GRAY #(.WIDTH(WIDTH)) DUT_BIN2GRAY(
    .bin_in(bin_in),
    .gray_out(gray_out)
);

PATTERN  #(.WIDTH(WIDTH)) I_PATTERN(
    .bin_in(bin_in),
    .gray_out(gray_out)
);

endmodule