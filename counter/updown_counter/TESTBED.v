`timescale 1ns/10ps
`include "PATTERN.v"
`include "UPDOWN_COUNTER.v"

module TESTBED #(parameter WIDTH=32)();

wire clk;
wire rst_n;
wire ctrl;
wire [WIDTH-1:0] cnt;

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, TESTBED);
end

UPDOWN_COUNTER UPDOWN_COUNTER_DFF(
    .clk(clk),
    .rst_n(rst_n),
    .ctrl(ctrl),
    .cnt(cnt)
);

PATTERN I_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .ctrl(ctrl),
    .cnt(cnt)
);

endmodule