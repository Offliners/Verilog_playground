/* Comparator */
module CMP #(parameter WIDTH=32)(
    // Input signals
    a,
    b,
    // Output signals
    out_small,
    out_big
);

input [WIDTH-1:0] a, b;

output [WIDTH-1:0] out_small, out_big;

assign out_small = (a > b) ? b : a;
assign out_big = (a > b) ? a : b;
    
endmodule