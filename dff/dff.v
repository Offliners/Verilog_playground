/* D Flip Flop */
module DFF(
    // Input signals
    clk,
    rst_n,
    D,
    // Output signals
    Q
);

input clk;
input rst_n;
input D;

output reg Q;

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        Q <= 0;
    else
        Q <= D;
end

endmodule