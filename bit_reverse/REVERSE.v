/* Bit Reverse */
module REVERSE #(parameter WIDTH=32)(
    // Input signals
    in,
    // Output signals
    out
);

input [WIDTH-1:0] in;
output reg [WIDTH-1:0] out;

integer i;

always @ (*) begin
    for(i = 0; i < WIDTH; i += 1)
        out[i] = in[WIDTH-1-i];
end

endmodule