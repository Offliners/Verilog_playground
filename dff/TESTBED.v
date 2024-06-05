`timescale 1ns/10ps
`include "PATTERN.v"
`include "DFF.v"

module TESTBED();

wire clk;
wire rst_n;
wire D;
wire Q;

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, TESTBED);
end

DFF DUT_dff(
    .clk(clk),
    .rst_n(rst_n),
    .D(D),
    .Q(Q)
)

PATTERN I_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .D(D),
    .Q(Q)
)

endmodule