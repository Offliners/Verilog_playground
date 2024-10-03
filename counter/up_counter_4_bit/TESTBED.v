`timescale 1ns/10ps
`include "PATTERN.v"
`include "UP_COUNTER_4bit.v"

module TESTBED();

wire clk;
wire rst_n;
wire [3:0] cnt;

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, TESTBED);
end

UP_COUNTER_4bit UP_COUNTER_4bit_DFF(
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