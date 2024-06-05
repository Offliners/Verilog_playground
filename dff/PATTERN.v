`define CYCLE_TIME 10

module PATTERN(
    // Input ports
    clk,
    rst_n,
    D,
    // Output ports
    Q
);

output reg clk;
output reg rst_n;
output reg D;

input Q;

// parameter CYCLE_DELAY = 100;
// real CYCLE = `CYCLE_TIME;
// always #(CYCLE / 2.0) clk = ~clk;

/* clock generation */
initial begin
    rst_n = 1;
    clk = 0;
    forever #100 clk = ~clk;
end

initial begin
	D = 0;
	forever #200 D = ~D;
end

/* generate data dump */
initial begin
    #5000 rst_n = 1'b1;
    #500 rst_n = 1'b0;
    #5000 rst_n = 1'b1;
    $finish;
end

initial begin
    $monitor("IN = %d   OUT = %d   RST = %d \n", D, Q, rst_n);
end

endmodule