/* 4-bit Full Adder (Ripple Carry Adder) */
`include "FA_1bit.v"

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

wire [2:0] cout;

FA_1bit FA01(
    .a(a[0]),
    .b(b[0]),
    .cin(cin),
    .sum(sum[0]),
    .carry(cout[0])
);

FA_1bit FA02(
    .a(a[1]),
    .b(b[1]),
    .cin(cout[0]),
    .sum(sum[1]),
    .carry(cout[1])
);

FA_1bit FA03(
    .a(a[2]),
    .b(b[2]),
    .cin(cout[1]),
    .sum(sum[2]),
    .carry(cout[2])
);

FA_1bit FA04(
    .a(a[3]),
    .b(b[3]),
    .cin(cout[2]),
    .sum(sum[3]),
    .carry(carry)
);

endmodule