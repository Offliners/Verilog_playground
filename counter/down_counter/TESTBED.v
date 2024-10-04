`timescale 1ns/10ps
`include "PATTERN.v"
`include "DOWN_COUNTER.v"

module TESTBED #(parameter WIDTH=32)();

wire clk;
wire rst_n;
wire [WIDTH-1:0] cnt;

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, TESTBED);
end

DOWN_COUNTER DOWN_COUNTER_DFF(
    .clk(clk),
    .rst_n(rst_n),
    .cnt(cnt)
);

PATTERN I_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .cnt(cnt)
);

endmodule