/* 4-bit Full Adder (Carry Lookahead Adder) */
module FA_4bits(
    // Input signals
    a,
    b,
    cin,
    // Output signals
    sum,
    carry
);

input [3:0] a, b;
input cin;
output [3:0] sum;
output carry;

wire G[3:0], P[3:0];
wire C[4:0];

assign G[0] = a[0] & b[0];
assign G[1] = a[1] & b[1];
assign G[2] = a[2] & b[2];
assign G[3] = a[3] & b[3];

assign P[0] = a[0] | b[0];
assign P[1] = a[1] | b[1];
assign P[2] = a[2] | b[2];
assign P[3] = a[3] | b[3];

assign C[0] = cin;
assign C[1] = G[0] | (P[0] & cin);
assign C[2] = G[1] | (P[1] & (G[0] | (P[0] & cin)));
assign C[3] = G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & cin)))));
assign carry = G[3] | (P[3] & (G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & cin)))))));

assign sum[0] = a[0] ^ b[0] ^ C[0];
assign sum[1] = a[1] ^ b[1] ^ C[1];
assign sum[2] = a[2] ^ b[2] ^ C[2];
assign sum[3] = a[3] ^ b[3] ^ C[3];

endmodule