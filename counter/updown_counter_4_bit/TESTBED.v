`timescale 1ns/10ps
`include "PATTERN.v"
`include "UPDOWN_COUNTER_4bit.v"

module TESTBED();

wire clk;
wire rst_n;
wire ctrl;
wire [3:0] cnt;

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, TESTBED);
end

UPDOWN_COUNTER_4bit UPDOWN_COUNTER_4bit_DFF(
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