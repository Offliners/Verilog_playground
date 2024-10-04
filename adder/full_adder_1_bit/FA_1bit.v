/* 1-bit Full Adder */
module FA_1bit(
    // Input signals
    a,
    b,
    cin,
    // Output signals
    sum,
    carry
);

input a, b, cin;
output sum, carry;

assign sum = a ^ b ^ cin;
assign carry = (a & b) | (a & cin) | (b & cin);

endmodule