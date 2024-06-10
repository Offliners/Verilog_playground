/* Binary to Gray Code Converter */
module BIN2GRAY #(parameter WIDTH=32)(
    // Input signals
    bin_in,
    // Output signals
    gray_out
);

input  [WIDTH-1:0] bin_in;
output [WIDTH-1:0] gray_out;

assign gray_out[WIDTH-1:0] = bin_in[WIDTH-1:0] ^ (bin_in[WIDTH-1:0] >> 1);

endmodule