/* Down counter */
module DOWN_COUNTER #(parameter WIDTH=32)(
    // Input signals
    clk,
    rst_n,
    // Output signals
    cnt
);

input clk;
input rst_n;

output reg [WIDTH-1:0] cnt;

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt <= 0;
    else
        cnt <= cnt - 1;
end

endmodule