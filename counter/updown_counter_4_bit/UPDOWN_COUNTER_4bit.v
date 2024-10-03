/* 4-bit up-down counter */
module UPDOWN_COUNTER_4bit(
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

output reg [3:0] cnt;

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt <= 0;
    else if(ctrl)
        cnt <= cnt + 1;
    else
        cnt <= cnt - 1;
end

endmodule