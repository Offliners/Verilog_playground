/* 4-bit up-down counter */
module UPDOWN_COUNTER #(parameter WIDTH=32)(
    // Input signals
    clk,
    rst_n,
    ctrl,
    // Output signals
    cnt
);

input clk;
input rst_n;
input ctrl;

output reg [WIDTH-1:0] cnt;

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt <= 0;
    else if(ctrl)
        cnt <= cnt + 1;
    else
        cnt <= cnt - 1;
end

endmodule